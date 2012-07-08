# Copyright (C) 2007-2008 Gustavo Sverzut Barbieri, Caio Marcelo de Oliveira Filho
#
# This file is part of Python-Evas.
#
# Python-Evas is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# Python-Evas is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this Python-Evas.  If not, see <http://www.gnu.org/licenses/>.

# This file is included verbatim by c_evas.pyx

from cpython cimport PyObject, Py_INCREF, Py_DECREF
from cpython cimport PyMethod_New
from cpython cimport PyMem_Malloc
from cpython cimport bool
import warnings

cdef int PY_REFCOUNT(object o):
    cdef PyObject *obj = <PyObject *>o
    return obj.ob_refcnt

from events cimport Evas_Event_Cb
from general cimport eina_list_free
from object cimport evas_object_top_get, evas_object_bottom_get, evas_object_name_find

from rect cimport Rect
from object_rectangle cimport Rectangle
from object_line cimport Line
from object_image cimport Image, FilledImage
from object_polygon cimport Polygon
from object_text cimport Text
from object_box cimport Box
from textblock cimport Textblock

include "canvas_callbacks.pxi"

cdef object canvas_mapping

canvas_mapping = dict()

cdef Canvas Canvas_from_instance(Evas *evas):
    cdef void *data
    cdef Canvas c

    if evas == NULL:
        return None

    o = canvas_mapping.get(<long>evas, None)
    if o is not None:
        c = o
    else:
        c = Canvas.__new__(Canvas)
        c._set_obj(evas) # calls Canvas_remember()

    return c

cdef int Canvas_remember(long ptr, Canvas c) except 0:
    o = canvas_mapping.get(ptr, None)
    if o is not None:
        raise ValueError("Canvas 0x%x already registered for %s" % (ptr, o))
    canvas_mapping[ptr] = c
    return 1

cdef int Canvas_forget(long ptr) except 0:
    try:
        canvas_mapping.pop(ptr)
    except KeyError, e:
        raise ValueError("Canvas %#x is unknown" % ptr)
    return 1


# XXX: this should be C-only, but it would require ecore_evas
# XXX: being able to use it.
def _Canvas_from_instance(long ptr):
    return Canvas_from_instance(<Evas *>ptr)


cdef int _canvas_free_wrapper_resources(Canvas canvas) except 0:
    cdef int i
    for i from 0 <= i < evas_canvas_event_callbacks_len:
        canvas._callbacks[i] = None
    return 1


cdef int _canvas_unregister_callbacks(Canvas canvas) except 0:
    cdef Evas *e
    cdef Evas_Event_Cb cb
    e = canvas.obj
    if e != NULL:
        for i, lst in enumerate(canvas._callbacks):
            if lst is not None:
                cb = evas_canvas_event_callbacks[i]
                evas_event_callback_del(e, i, cb)
    return 1


cdef _canvas_add_callback_to_list(Canvas canvas, int type, func, args, kargs):
    if type < 0 or type >= evas_canvas_event_callbacks_len:
        raise ValueError("Invalid callback type")

    r = (func, args, kargs)
    lst = canvas._callbacks[type]
    if lst is not None:
        lst.append(r)
        return False
    else:
        canvas._callbacks[type] = [r]
        return True


cdef _canvas_del_callback_from_list(Canvas canvas, int type, func):
    if type < 0 or type >= evas_canvas_event_callbacks_len:
        raise ValueError("Invalid callback type")

    lst = canvas._callbacks[type]
    if not lst:
        raise ValueError("Callback %s was not registered with type %d" %
                         (func, type))

    i = None
    for i, r in enumerate(lst):
        if func == r[0]:
            break
    else:
        raise ValueError("Callback %s was not registered with type %d" %
                         (func, type))

    lst.pop(i)
    if len(lst) == 0:
        canvas._callbacks[type] = None
        return True
    else:
        return False


def render_method_lookup(char *name):
    """Lookup render method and return its id (> 0 if found).

    :param name: Render method
    :type name: string
    :return: ID
    :rtype: int

    """
    return evas_render_method_lookup(name)


def render_method_list():
    """Returns a list of render method names.

    :rtype: list of str

    """
    cdef Eina_List *lst

    ret = []
    lst = evas_render_method_list()
    while lst != NULL:
        ret.append(<char*> lst.data)
        lst = lst.next

    evas_render_method_list_free(lst)
    return ret



cdef public class Canvas [object PyEvasCanvas, type PyEvasCanvas_Type]:
    """

    Evas Canvas.

    Canvas is the base drawing area and scene manager, it should have
    a number of objects (or actors) that will be managed. Object state
    is monitored and redraw is optimized based on changes.

    :ivar rect: :py:class:`evas.rect.Rect` describing object geometry, for
        easy manipulation. Changing this :py:class:`evas.rect.Rect` will not
        affect current geometry, you have to set it again to have this
        behavior.

    .. attention:: Canvas must be associated with an Input/Output system in
        order to be functional. So far it's impossible to do this
        association directly from Python, so you should create Canvas
        indirectly using ``ecore.evas`` classes, like
        :py:class:`ecore.evas.SoftwareX11`.

    .. seealso:
        :py:class:`ecore.evas.SoftwareX11`
        :py:class:`ecore.evas.Buffer`

    """
    def __cinit__(self, *a, **ka):
        self.obj = NULL
        self._callbacks = [None] * evas_canvas_event_callbacks_len

    def __init__(self, method=None, size=None, viewport=None):
        self._new_evas()
        if method:
            self.output_method_set(method)
        if size:
            self.size_set(*size)
        if viewport:
            self.viewport_set(*viewport)

    def __dealloc__(self):
        if self.obj:
            _canvas_unregister_callbacks(self)
            Canvas_forget(<long>self.obj)
            evas_free(self.obj)
            self.obj = NULL
        self._callbacks = None

    cdef int _set_obj(self, Evas *obj) except 0:
        assert self.obj == NULL, "Object must be clean"
        self.obj = obj
        Canvas_remember(<long>self.obj, self)
        _canvas_unregister_callbacks(self)
        _canvas_free_wrapper_resources(self)
        return 1

    cdef int _unset_obj(self) except 0:
        Canvas_forget(<long>self.obj)
        self.obj = NULL
        return 1

    def _new_evas(self):
        """Creates an internal (wrapped) ``Evas`` for this object.

        If this Python wrapper is shallow then it allocates a new
        ``Evas`` using ``evas_new()``.

        .. warning:: internal.

        """
        if self.obj == NULL:
            self._set_obj(evas_new())

    def __str__(self):
        w, h = self.size_get()
        return "%s(size=(%d, %d), method=%r)" % \
               (self.__class__.__name__, w, h, self.output_method_get())

    def __repr__(self):
        w, h = self.size_get()
        return ("%s(%#x, refcount=%d, Evas=%#x, size=(%d, %d), "
                "method=%r)") % \
               (self.__class__.__name__, <unsigned long><void *>self,
                PY_REFCOUNT(self), <unsigned long>self.obj,
                w, h, self.output_method_get())

    def output_method_set(self, method):
        """Set canvas render method, can be either a name or id.

        :param method:

        """
        cdef int engine_id

        if isinstance(method, (int, long)):
            engine_id = method
        elif isinstance(method, str):
            engine_id = evas_render_method_lookup(method)
        else:
            raise TypeError("method must be integer or string")

        evas_output_method_set(self.obj, engine_id)

    def output_method_get(self):
        """Returns the id of the current output method, or 0 if error happened.

        :rtype: int

        """
        return evas_output_method_get(self.obj)

    property output_method:
        def __set__(self, method):
            self.output_method_set(method)

        def __get__(self):
            return self.output_method_get()

    def engine_info_set(self, unsigned long ptr):
        """Set the engine information pointer.

        Note that given value is a pointer, usually acquired with
        :py:func:`engine_info_get() and is totally engine and platform
        dependent.

        This call is very low level and is meant for extension to use,
        they usually do the machinery in C and just handle pointers as
        integers.

        If in doubt, don't mess with it. Use ecore.evas instead, it's
        the way to go for regular uses.

        """
        evas_engine_info_set(self.obj, <void *>ptr)

    def engine_info_get(self):
        """Get the engine information pointer.

        Note that given value is a pointer and is totally engine and
        platform dependent.

        This call is very low level and is meant for extension to use,
        they usually do the machinery in C and just handle pointers as
        integers.

        If in doubt, don't mess with it. Use ecore.evas instead, it's
        the way to go for regular uses.

        :return: pointer as integer (unsigned long).

        """
        return <unsigned long><void *>evas_engine_info_get(self.obj)

    property engine_info:
        def __set__(self, ptr):
            self.engine_info_set(ptr)

        def __get__(self):
            return self.engine_info_get()

    def size_set(self, int w, int h):
        """Set canvas size.

        :param w:
        :param h:

        """
        evas_output_size_set(self.obj, w, h)

    def size_get(self):
        """:rtype: tuple of int"""
        cdef int w, h
        evas_output_size_get(self.obj, &w, &h)
        return (w, h)

    property size:
        def __set__(self, spec):
            self.size_set(*spec)

        def __get__(self):
            return self.size_get()

    property rect:
        def __set__(self, spec):
            cdef Rect r
            r = Rect(spec)
            self.size_set(r.w, r.h)

        def __get__(self):
            cdef int w, h
            w, h = self.size_get()
            return Rect(0, 0, w, h)

    def viewport_set(self, int x, int y, int w, int h):
        """Sets the output viewport of the given evas in evas units.

        The output viewport is the area of the evas that will be visible to
        the viewer. The viewport will be stretched to fit the output target
        of the evas when rendering is performed.

        .. note:: The coordinate values do not have to map 1-to-1 with the
            output target.  However, it is generally advised that it is done
            for ease of use.

        """

        evas_output_viewport_set(self.obj, x, y, w, h)

    def viewport_get(self):
        """:rtype: list of int"""
        cdef int x, y, w, h
        evas_output_viewport_get(self.obj, &x, &y, &w, &h)
        return (x, y, w, h)

    property viewport:
        def __set__(self, spec):
            self.viewport_set(*spec)

        def __get__(self):
            return self.viewport_get()

    def coord_screen_x_to_world(self, int x):
        """:rtype: int"""
        return evas_coord_screen_x_to_world(self.obj, x)

    def coord_screen_y_to_world(self, int y):
        """:rtype: int"""
        return evas_coord_screen_y_to_world(self.obj, y)

    def coord_world_x_to_screen(self, int x):
        """:rtype: int"""
        return evas_coord_world_x_to_screen(self.obj, x)

    def coord_world_y_to_screen(self, int y):
        """:rtype: int"""
        return evas_coord_world_y_to_screen(self.obj, y)

    def pointer_output_xy_get(self):
        """Returns the pointer's (x, y) relative to output."""
        cdef int x, y
        evas_pointer_output_xy_get(self.obj, &x, &y)
        return (x, y)

    property pointer_output_xy:
        def __get__(self):
            return self.pointer_output_xy_get()

    def pointer_canvas_xy_get(self):
        """Returns the pointer's (x, y) relative to canvas."""
        cdef int x, y
        evas_pointer_canvas_xy_get(self.obj, &x, &y)
        return (x, y)

    property pointer_canvas_xy:
        def __get__(self):
            return self.pointer_canvas_xy_get()

    def pointer_button_down_mask_get(self):
        """Returns a bitmask with the mouse buttons currently pressed set to 1.

        The least significant bit corresponds to the first mouse button
        (button 1) and the most significant bit corresponds to the last mouse
        button (button 32).

        :rtype: int

        """
        return evas_pointer_button_down_mask_get(self.obj)

    property pointer_button_down_mask:
        def __get__(self):
            return self.pointer_button_down_mask_get()

    def pointer_inside_get(self):
        """Returns whether the mouse pointer is logically inside the canvas.

        :rtype: bool

        """
        return bool(evas_pointer_inside_get(self.obj))

    property pointer_inside:
        def __get__(self):
            return self.pointer_inside_get()

    def top_at_xy_get(self, int x, int y,
                      include_pass_events_objects=False,
                      include_hidden_objects=False):
        """Get the topmost object at (x, y).

        :param x:
        :param y:
        :param include_pass_events_objects: if to include objects passing events.
        :param include_hidden_objects: if to include hidden objects.

        :return: child object.
        :rtype: :py:class:`evas.object.Object`

        """
        cdef int ip, ih
        cdef Evas_Object *o
        ip = include_pass_events_objects
        ih = include_hidden_objects
        o = evas_object_top_at_xy_get(self.obj, x, y, ip, ih)
        return Object_from_instance(o)

    def top_at_pointer_get(self):
        """Get the topmost object at pointer position.

        :return: child object.
        :rtype: :py:class:`evas.object.Object`
        """
        cdef Evas_Object *o
        o = evas_object_top_at_pointer_get(self.obj)
        return Object_from_instance(o)

    def top_in_rectangle_get(self, int x, int y, int w, int h,
                             include_pass_events_objects=False,
                             include_hidden_objects=False):
        """Get the topmost object at given geometry.

        :param x:
        :param y:
        :param w:
        :param h:
        :param include_pass_events_objects: if to include objects passing events.
        :param include_hidden_objects: if to include hidden objects.

        :return: child object.
        :rtype: :py:class:`evas.object.Object`
        """
        cdef int ip, ih
        cdef Evas_Object *o
        ip = include_pass_events_objects
        ih = include_hidden_objects
        o = evas_object_top_in_rectangle_get(self.obj, x, y, w, h, ip, ih)
        return Object_from_instance(o)

    def objects_at_xy_get(self, int x, int y,
                          include_pass_events_objects=False,
                          include_hidden_objects=False):
        """Get all children at (x, y).

        :param x:
        :param y:
        :param include_pass_events_objects: if to include objects passing events.
        :param include_hidden_objects: if to include hidden objects.

        :return: children objects.
        :rtype: List of :py:class:`evas.object.Object`
        """
        cdef Eina_List *objs, *itr
        cdef int ip, ih
        cdef Evas_Object *o
        ip = include_pass_events_objects
        ih = include_hidden_objects
        objs = evas_objects_at_xy_get(self.obj, x, y, ip, ih)
        lst = []
        itr = objs
        while itr != NULL:
            o = <Evas_Object*>itr.data
            lst.append(Object_from_instance(o))
            itr = itr.next
        eina_list_free(objs)
        return lst

    def objects_in_rectangle_get(self, int x, int y, int w, int h,
                                 include_pass_events_objects=False,
                                 include_hidden_objects=False):
        """Get all children at given geometry.

        :param x:
        :param y:
        :param w:
        :param h:
        :param include_pass_events_objects: if to include objects passing events.
        :param include_hidden_objects: if to include hidden objects.

        :return: children objects.
        :rtype: List of :py:class:`evas.object.Object`
        """
        cdef Eina_List *objs, *itr
        cdef int ip, ih
        cdef Evas_Object *o
        ip = include_pass_events_objects
        ih = include_hidden_objects
        objs = evas_objects_in_rectangle_get(self.obj, x, y, w, h, ip, ih)
        lst = []
        itr = objs
        while itr != NULL:
            o = <Evas_Object*>itr.data
            lst.append(Object_from_instance(o))
            itr = itr.next
        eina_list_free(objs)
        return lst

    def damage_rectangle_add(self, int x, int y, int w, int h):
        evas_damage_rectangle_add(self.obj, x, y, w, h)

    def obscured_rectangle_add(self, int x, int y, int w, int h):
        evas_obscured_rectangle_add(self.obj, x, y, w, h)

    def obscured_clear(self):
        evas_obscured_clear(self.obj)

    def render_updates(self):
        cdef Eina_List *lst

        lst = evas_render_updates(self.obj)
        evas_render_updates_free(lst)

    def render(self):
        """Force canvas to redraw pending updates."""
        evas_render(self.obj)

    def norender(self):
        evas_norender(self.obj)

    def top_get(self):
        """:rtype: :py:class:`evas.object.Object`"""
        cdef Evas_Object *other
        other = evas_object_top_get(self.obj)
        return Object_from_instance(other)

    property top:
        def __get__(self):
            return self.top_get()

    def bottom_get(self):
        """:rtype: :py:class:`evas.object.Object`"""
        cdef Evas_Object *other
        other = evas_object_bottom_get(self.obj)
        return Object_from_instance(other)

    property bottom:
        def __get__(self):
            return self.bottom_get()

    def focus_get(self):
        """:rtype: :py:class:`evas.object.Object`"""
        cdef Evas_Object *o
        o = evas_focus_get(self.obj)
        return Object_from_instance(o)

    property focus:
        def __get__(self):
            return self.focus_get()

    def object_name_find(self, char *name):
        """Find object by name.

        :param name:
        :rtype: :py:class:`evas.object.Object`

        """
        cdef Evas_Object *other
        other = evas_object_name_find(self.obj, name)
        return Object_from_instance(other)

    def image_cache_flush(self):
        evas_image_cache_flush(self.obj)

    def image_cache_reload(self):
        evas_image_cache_reload(self.obj)

    def image_cache_set(self, int size):
        evas_image_cache_set(self.obj, size)

    def image_cache_get(self):
        """:rtype: int"""
        return evas_image_cache_get(self.obj)

    property image_cache:
        def __get__(self):
            return self.image_cache_get()

        def __set__(self, int value):
            self.image_cache_set(value)

    def font_cache_flush(self):
        evas_font_cache_flush(self.obj)

    def font_cache_get(self):
        """:rtype: int"""
        return evas_font_cache_get(self.obj)

    def font_cache_set(self, int value):
        evas_font_cache_set(self.obj, value)

    property font_cache:
        def __get__(self):
            return self.font_cache_get()

        def __set__(self, int value):
            self.font_cache_set(value)

    def font_path_clear(self):
        evas_font_path_clear(self.obj)

    def font_path_append(self, char *path):
        evas_font_path_append(self.obj, path)

    def font_path_prepend(self, char *path):
        evas_font_path_prepend(self.obj, path)

    def font_path_list(self):
        """:rtype: list of str"""
        cdef const_Eina_List *itr
        lst = []
        itr = evas_font_path_list(self.obj)
        while itr != NULL:
            lst.append(<char*>itr.data)
            itr = itr.next
        return lst

    def font_available_list(self):
        """:rtype: list of str"""
        cdef void *p
        cdef Eina_List *itr, *head
        lst = []
        p = <void*>evas_font_available_list(self.obj) # avoid warning
        head = <Eina_List*>p
        itr = head
        while itr != NULL:
            lst.append(<char*>itr.data)
            itr = itr.next
        evas_font_available_list_free(self.obj, head)
        return lst

    def font_hinting_can_hint(self, int flags):
        """:rtype: bool"""
        return bool(evas_font_hinting_can_hint(self.obj,
                                               <Evas_Font_Hinting_Flags>flags))

    def font_hinting_set(self, int flags):
        """:param flags: one of EVAS_FONT_HINTING_NONE,
                EVAS_FONT_HINTING_AUTO or EVAS_FONT_HINTING_BYTECODE
        """
        evas_font_hinting_set(self.obj, <Evas_Font_Hinting_Flags>flags)

    def font_hinting_get(self):
        """:rtype: int"""
        return <int>evas_font_hinting_get(self.obj)

    property font_hinting:
        def __get__(self):
            return self.font_hinting_get()

        def __set__(self, int value):
            self.font_hinting_set(value)

    def freeze(self):
        """Freeze event processing"""
        evas_event_freeze(self.obj)

    def thaw(self):
        """Thaw (unfreeze) event processing"""
        evas_event_thaw(self.obj)

    def freeze_get(self):
        """:rtype: int"""
        return evas_event_freeze_get(self.obj)

    def key_modifier_is_set(self, modifier):
        """:rtype: bool"""
        return bool(evas_key_modifier_is_set(evas_key_modifier_get(self.obj),
                                             modifier))

    def event_callback_add(self, int type, func, *args, **kargs):
        """Add a new callback for the given event.

        :param type: an integer with event type code, like
           *EVAS_CALLBACK_CANVAS_FOCUS_IN*,
           *EVAS_CALLBACK_RENDER_FLUSH_PRE* and other
           *EVAS_CALLBACK_* constants.
        :param func: function to call back, this function will have one of
           the following signatures::

                function(object, event, *args, **kargs)
                function(object, *args, **kargs)

           The former is used by events that provide more data
           (none so far), while the second is used by events
           without. Parameters given at the end of
           *event_callback_add()* will be given to the callback.
           Note that the object passed to the callback in **event**
           parameter will only be valid during the callback, using
           it after callback returns will raise an ValueError.

        :raise ValueError: if **type** is unknown.
        :raise TypeError: if **func** is not callable.

        """
        cdef Evas_Event_Cb cb

        if not callable(func):
            raise TypeError("func must be callable")

        if _canvas_add_callback_to_list(self, type, func, args, kargs):
            cb = evas_canvas_event_callbacks[type]
            evas_event_callback_add(self.obj, type, cb, <void*>self)

    def event_callback_del(self, int type, func):
        """Remove callback for the given event.

        :param type: an integer with event type code.
        :param func: function used with :py:func:`event_callback_add()`.
        :precond: **type** and **func** must be used as parameter for
            :py:func:`event_callback_add()`.

        :raise ValueError: if **type** is unknown or if there was no
            **func** connected with this type.
        """
        cdef Evas_Event_Cb cb
        if _canvas_del_callback_from_list(self, type, func):
            cb = evas_canvas_event_callbacks[type]
            evas_event_callback_del(self.obj, type, cb)

    def on_canvas_focus_in_add(self, func, *a, **k):
        """Same as event_callback_add(EVAS_CALLBACK_CANVAS_FOCUS_IN, ...)

        Expected signature::

            function(object, *args, **kargs)

        """
        self.event_callback_add(EVAS_CALLBACK_CANVAS_FOCUS_IN, func, *a, **k)

    def on_canvas_focus_in_del(self, func):
        """Same as event_callback_del(EVAS_CALLBACK_CANVAS_FOCUS_IN, ...)"""
        self.event_callback_del(EVAS_CALLBACK_CANVAS_FOCUS_IN, func)

    def on_canvas_focus_out_add(self, func, *a, **k):
        """Same as event_callback_add(EVAS_CALLBACK_CANVAS_FOCUS_OUT, ...)

        Expected signature::

            function(object, *args, **kargs)

        """
        self.event_callback_add(EVAS_CALLBACK_CANVAS_FOCUS_OUT, func, *a, **k)

    def on_canvas_focus_out_del(self, func):
        """Same as event_callback_del(EVAS_CALLBACK_CANVAS_FOCUS_OUT, ...)"""
        self.event_callback_del(EVAS_CALLBACK_CANVAS_FOCUS_OUT, func)

    def on_render_flush_pre_add(self, func, *a, **k):
        """Same as event_callback_add(EVAS_CALLBACK_RENDER_FLUSH_PRE, ...)

        Expected signature::

            function(object, *args, **kargs)

        """
        self.event_callback_add(EVAS_CALLBACK_RENDER_FLUSH_PRE, func, *a, **k)

    def on_render_flush_pre_del(self, func):
        """Same as event_callback_del(EVAS_CALLBACK_RENDER_FLUSH_PRE, ...)"""
        self.event_callback_del(EVAS_CALLBACK_RENDER_FLUSH_PRE, func)

    def on_render_flush_post_add(self, func, *a, **k):
        """Same as event_callback_add(EVAS_CALLBACK_RENDER_FLUSH_POST, ...)

        Expected signature::

            function(object, *args, **kargs)

        """
        self.event_callback_add(EVAS_CALLBACK_RENDER_FLUSH_POST, func, *a, **k)

    def on_render_flush_post_del(self, func):
        """Same as event_callback_del(EVAS_CALLBACK_RENDER_FLUSH_POST, ...)"""
        self.event_callback_del(EVAS_CALLBACK_RENDER_FLUSH_POST, func)

    # Event feeding
    def feed_mouse_down(self, int b, Evas_Button_Flags flags,
                        unsigned int timestamp):
        """ Emit a mouse_down event in the canvas """
        evas_event_feed_mouse_down(self.obj, b, flags, timestamp, NULL)

    def feed_mouse_up(self, int b, Evas_Button_Flags flags,
                      unsigned int timestamp):
        """ Emit a mouse_up event in the canvas """
        evas_event_feed_mouse_up(self.obj, b, flags, timestamp, NULL)

    def feed_mouse_cancel(self, unsigned int timestamp):
        """ Emit a mouse_cancel event in the canvas """
        evas_event_feed_mouse_cancel(self.obj, timestamp, NULL)

    def feed_mouse_wheel(self, int direction, int z, unsigned int timestamp):
        """ Emit a mouse_wheel event in the canvas """
        evas_event_feed_mouse_wheel(self.obj, direction, z, timestamp, NULL)

    def feed_mouse_move(self, int x, int y, unsigned int timestamp):
        """ Emit a mouse_move event in the canvas """
        evas_event_feed_mouse_move(self.obj, x, y, timestamp, NULL)

    def feed_mouse_in(self, unsigned int timestamp):
        """ Emit a mouse_in event in the canvas """
        evas_event_feed_mouse_in(self.obj, timestamp, NULL)

    def feed_mouse_out(self, unsigned int timestamp):
        """ Emit a mouse_out event in the canvas """
        evas_event_feed_mouse_out(self.obj, timestamp, NULL)

    def feed_multi_down(self, int d, int x, int y,
                        double rad, double radx, double rady,
                        double pres, double ang,
                        double fx, double fy,
                        Evas_Button_Flags flags,
                        unsigned int timestamp):
        """ Emit a multi_down event in the canvas """
        evas_event_feed_multi_down(self.obj, d, x, y, rad, radx, rady, pres,
                                   ang, fx, fy, flags, timestamp, NULL)

    def feed_multi_up(self, int d, int x, int y,
                      double rad, double radx, double rady,
                      double pres, double ang,
                      double fx, double fy,
                      Evas_Button_Flags flags,
                      unsigned int timestamp):
        """ Emit a multi_up event in the canvas """
        evas_event_feed_multi_up(self.obj, d, x, y, rad, radx, rady, pres,
                                 ang, fx, fy, flags, timestamp, NULL)

    def feed_multi_move(self, int d, int x, int y,
                        double rad, double radx, double rady,
                        double pres, double ang,
                        double fx, double fy,
                        unsigned int timestamp):
        """ Emit a multi_move event in the canvas """
        evas_event_feed_multi_move(self.obj, d, x, y, rad, radx, rady, pres,
                                   ang, fx, fy, timestamp, NULL)

    def feed_key_down(self, char *keyname, char *key, char *string,
                      char *compose, int timestamp):
        """ Emit a key_down event in the canvas """
        evas_event_feed_key_down(self.obj, keyname, key, string,
                                 compose, timestamp, NULL)

    def feed_key_up(self, char *keyname, char *key, char *string,
                    char *compose, int timestamp):
        """ Emit a key_up event in the canvas """
        evas_event_feed_key_up(self.obj, keyname, key, string,
                              compose, timestamp, NULL)

    def feed_hold(self, int hold, unsigned int timestamp):
        """ Emit a feed_hold event in the canvas """
        evas_event_feed_hold(self.obj, hold, timestamp, NULL)

    # Factory
    def Rectangle(self, **kargs):
        """Factory of :py:class:`evas.object_rectangle.Rectangle` associated
        with this canvas.

        :rtype: :py:class:`evas.object_rectangle.Rectangle`

        """
        return Rectangle(self, **kargs)

    def Line(self, **kargs):
        """Factory of :py:class:`evas.object_line.Line` associated with this
        canvas.

        :rtype: :py:class:`evas.object_line.Line`

        """
        return Line(self, **kargs)

    def Image(self, **kargs):
        """Factory of :py:class:`evas.object_image.Image` associated with
        this canvas.

        :rtype: :py:class:`evas.object_image.Image`

        """
        return Image(self, **kargs)

    def FilledImage(self, **kargs):
        """Factory of :py:class:`evas.object_image.FilledImage` associated
        with this canvas.

        :rtype: :py:class:`evas.object_image.FilledImage`

        """
        return FilledImage(self, **kargs)

    def Polygon(self, **kargs):
        """Factory of :py:class:`evas.object_polygon.Polygon` associated
        with this canvas.

        :rtype: :py:class:`evas.object_polygon.Polygon`

        """
        return Polygon(self, **kargs)

    def Text(self, **kargs):
        """Factory of :py:class:`evas.object_text.Text` associated with this
        canvas.

        :rtype: :py:class:`evas.object_text.Text`

        """
        return Text(self, **kargs)

    def Textblock(self, **kargs):
        """Factory of :py:class:`evas.textblock.Textblock` associated with
        this canvas.

        :rtype: :py:class:`evas.textblock.Textblock`

        """
        return Textblock(self, **kargs)

    def Box(self, **kargs):
        """Factory of :py:class:`evas.object_box.Box` associated with this
        canvas.

        :rtype: :py:class:`evas.object_box.Box`

        """
        return Box(self, **kargs)
