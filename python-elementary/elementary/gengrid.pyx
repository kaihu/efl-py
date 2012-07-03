# Copyright (c) 2010 ProFUSION embedded systems
#
# This file is part of python-elementary.
#
# python-elementary is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# python-elementary is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with python-elementary.  If not, see <http://www.gnu.org/licenses/>.
#

include "widget_header.pxi"
include "tooltips.pxi"
from object_item cimport    ObjectItem, \
                            _object_item_to_python, \
                            elm_object_item_widget_get, \
                            _object_item_from_python, \
                            _object_item_list_to_python
from object_item import _cb_object_item_conv
from genlist cimport ELM_GENLIST_ITEM_SCROLLTO_IN
from general cimport strdup, PY_REFCOUNT

import traceback

cdef _py_elm_gengrid_item_call(func, Evas_Object *obj, part, data) with gil:
    try:
        o = Object_from_instance(obj)
        return func(o, _ctouni(part), data)
    except Exception as e:
        traceback.print_exc()
        return None

cdef char *_py_elm_gengrid_item_text_get(void *data, Evas_Object *obj, const_char_ptr part) with gil:
    cdef GengridItem item = <object>data
    cdef object params = item.params
    cdef GengridItemClass itc = params[0]

    func = itc._text_get_func
    if func is None:
        return NULL

    ret = _py_elm_gengrid_item_call(func, obj, part, params[1])
    if ret is not None:
        return strdup(_fruni(ret))
    else:
        return NULL

cdef Evas_Object *_py_elm_gengrid_item_content_get(void *data, Evas_Object *obj, const_char_ptr part) with gil:
    cdef GengridItem item = <object>data
    cdef object params = item.params
    cdef evasObject icon
    cdef GengridItemClass itc = params[0]

    func = itc._content_get_func
    if func is None:
        return NULL

    ret = _py_elm_gengrid_item_call(func, obj, part, params[1])
    if ret is not None:
        try:
            icon = ret
            return icon.obj
        except Exception as e:
            traceback.print_exc()
            return NULL
    else:
        return NULL

cdef Eina_Bool _py_elm_gengrid_item_state_get(void *data, Evas_Object *obj, const_char_ptr part) with gil:
    cdef GengridItem item = <object>data
    cdef object params = item.params
    cdef GengridItemClass itc = params[0]

    func = itc._state_get_func
    if func is None:
        return False

    ret = _py_elm_gengrid_item_call(func, obj, part, params[1])
    if ret is not None:
        return bool(ret)
    else:
        return False

cdef void _py_elm_gengrid_object_item_del(void *data, Evas_Object *obj) with gil:
    cdef GengridItem item = <object>data
    cdef object params
    cdef GengridItemClass itc

    if item is None:
        return

    params = item.params
    itc = params[0]

    func = itc._del_func
    if func is not None:
        try:
            o = Object_from_instance(obj)
            func(o, params[1])
        except Exception as e:
            traceback.print_exc()
    item._unset_obj()
    Py_DECREF(item)

cdef void _py_elm_gengrid_item_func(void *data, Evas_Object *obj, void *event_info) with gil:
    cdef GengridItem item = <object>data
    cdef object func = item.params[2]

    if func is not None:
        try:
            o = Object_from_instance(obj)
            func(item, o, item.params[1])
        except Exception as e:
            traceback.print_exc()

cdef class GengridItemClass:
    """Defines the behavior of each grid item.

    This class should be created and handled to the Gengrid itself.

    It may be subclassed, in this case the methods :py:func:`text_get()`,
    :py:func:`content_get()`, :py:func:`state_get()` and ``delete()`` will be used.

    It may also be instantiated directly, given getters to override as
    constructor parameters.

    """
    cdef Elm_Gengrid_Item_Class obj
    cdef readonly object _item_style
    cdef readonly object _text_get_func
    cdef readonly object _content_get_func
    cdef readonly object _state_get_func
    cdef readonly object _del_func

    def __cinit__(self, *a, **ka):
        self._item_style = "default"
        self._text_get_func = None
        self._content_get_func = None
        self._state_get_func = None
        self._del_func = None

        self.obj.item_style = NULL
        self.obj.func.text_get = _py_elm_gengrid_item_text_get
        self.obj.func.content_get = _py_elm_gengrid_item_content_get
        self.obj.func.state_get = _py_elm_gengrid_item_state_get
        self.obj.func.del_ = _py_elm_gengrid_object_item_del

    def __init__(self, item_style=None, text_get_func=None,
                 content_get_func=None, state_get_func=None, del_func=None):
        """GengridItemClass constructor.

        :param item_style: the string that defines the gengrid item
            theme to be used. The corresponding edje group will
            have this as suffix.

        :param text_get_func: if provided will override the
            behavior defined by :py:func:`text_get()` in this class. Its
            purpose is to return the label string to be used by a
            given part and row. This function should have the
            signature:
            ``func(obj, part, item_data) -> str``

        :param content_get_func: if provided will override the behavior
            defined by :py:func:`content_get()` in this class. Its purpose is
            to return the icon object to be used (swalloed) by a
            given part and row. This function should have the
            signature:
            ``func(obj, part, item_data) -> obj``

        :param state_get_func: if provided will override the
            behavior defined by :py:func:`state_get()` in this class. Its
            purpose is to return the boolean state to be used by a
            given part and row. This function should have the
            signature:
            ``func(obj, part, item_data) -> bool``

        :param del_func: if provided will override the behavior
            defined by ``delete()`` in this class. Its purpose is to be
            called when item is deleted, thus finalizing resources
            and similar. This function should have the signature:
            ``func(obj, item_data)``

        .. note:: In all these signatures, 'obj' means Gengrid and
            'item_data' is the value given to Gengrid item append/prepend
            methods, it should represent your item model as you want.
        """
        if item_style:
            self._item_style = item_style

        if text_get_func and not callable(text_get_func):
            raise TypeError("text_get_func is not callable!")
        elif text_get_func:
            self._text_get_func = text_get_func
        else:
            self._text_get_func = self.text_get

        if content_get_func and not callable(content_get_func):
            raise TypeError("content_get_func is not callable!")
        elif content_get_func:
            self._content_get_func = content_get_func
        else:
            self._content_get_func = self.content_get

        if state_get_func and not callable(state_get_func):
            raise TypeError("state_get_func is not callable!")
        elif state_get_func:
            self._state_get_func = state_get_func
        else:
            self._state_get_func = self.state_get

        if del_func and not callable(del_func):
            raise TypeError("del_func is not callable!")
        elif del_func:
            self._del_func = del_func
        else:
            try:
                self._del_func = self.delete
            except AttributeError:
                pass

        self.obj.item_style = _cfruni(self._item_style)

    def __str__(self):
        return ("%s(item_style=%r, text_get_func=%s, content_get_func=%s, "
                "state_get_func=%s, del_func=%s)") % \
               (self.__class__.__name__,
                self._item_style,
                self._text_get_func,
                self._content_get_func,
                self._state_get_func,
                self._del_func)

    def __repr__(self):
        return ("%s(%#x, refcount=%d, Elm_Gengrid_Item_Class=%#x, "
                "item_style=%r, text_get_func=%s, content_get_func=%s, "
                "state_get_func=%s, del_func=%s)") % \
               (self.__class__.__name__,
                <unsigned long><void *>self,
                PY_REFCOUNT(self),
                <unsigned long>&self.obj,
                self._item_style,
                self._text_get_func,
                self._content_get_func,
                self._state_get_func,
                self._del_func)

    property item_style:
        def __get__(self):
            return self._item_style

    def text_get(self, evasObject obj, part, item_data):
        """To be called by Gengrid for each item to get its label.

        :param obj: the Gengrid instance
        :param part: the part that is being handled.
        :param item_data: the value given to gengrid append/prepend.

        :return: label to be used.
        :rtype: str or None
        """
        return None

    def content_get(self, evasObject obj, part, item_data):
        """To be called by Gengrid for each item to get its icon.

        :param obj: the Gengrid instance
        :param part: the part that is being handled.
        :param item_data: the value given to gengrid append/prepend.

        :return: icon object to be used and swallowed.
        :rtype: evas Object or None
        """
        return None

    def state_get(self, evasObject obj, part, item_data):
        """To be called by Gengrid for each item to get its state.

        :param obj: the Gengrid instance
        :param part: the part that is being handled.
        :param item_data: the value given to gengrid append/prepend.

        :return: boolean state to be used.
        :rtype: bool or None
        """
        return False


cdef class GengridItem(ObjectItem):

    """An item for the :py:class:`Gengrid` widget."""

    cdef int _set_obj(self, Elm_Object_Item *item) except 0:
        assert self.item == NULL, "Object must be clean"
        self.item = item
        Py_INCREF(self)
        return 1

    cdef void _unset_obj(self):
        assert self.item != NULL, "Object must wrap something"
        self.item = NULL

    def __str__(self):
        return "%s(item_class=%s, func=%s, item_data=%s)" % \
               (self.__class__.__name__,
                self.params[0].__class__.__name__,
                self.params[2],
                self.params[1])

    def __repr__(self):
        return ("%s(%#x, refcount=%d, Elm_Object_Item=%#x, "
                "item_class=%s, func=%s, item_data=%r)") % \
               (self.__class__.__name__,
                <unsigned long><void*>self,
                PY_REFCOUNT(self),
                <unsigned long>self.item,
                self.params[0].__class__.__name__,
                self.params[2],
                self.params[1])

    property data:
        def __get__(self):
            return self.params[1]

    def data_get(self):
        return self.params[1]

    property next:
        def __get__(self):
            return _object_item_to_python(elm_gengrid_item_next_get(self.item))

    def next_get(self):
        return _object_item_to_python(elm_gengrid_item_next_get(self.item))

    property prev:
        def __get__(self):
            return _object_item_to_python(elm_gengrid_item_prev_get(self.item))

    def prev_get(self):
        return _object_item_to_python(elm_gengrid_item_prev_get(self.item))

    property index:
        def __get__(self):
            return elm_gengrid_item_index_get(self.item)

    def index_get(self):
        return elm_gengrid_item_index_get(self.item)

    def update(self):
        elm_gengrid_item_update(self.item)

    property selected:
        def __get__(self):
            return bool(elm_gengrid_item_selected_get(self.item))

        def __set__(self, selected):
            elm_gengrid_item_selected_set(self.item, bool(selected))

    def selected_set(self, selected):
        elm_gengrid_item_selected_set(self.item, bool(selected))
    def selected_get(self):
        return bool(elm_gengrid_item_selected_get(self.item))

    def show(self, scrollto_type = ELM_GENLIST_ITEM_SCROLLTO_IN):
        elm_gengrid_item_show(self.item, scrollto_type)

    def bring_in(self, scrollto_type = ELM_GENLIST_ITEM_SCROLLTO_IN):
        elm_gengrid_item_bring_in(self.item, scrollto_type)

    property pos:
        def __get__(self):
            cdef unsigned int x, y
            elm_gengrid_item_pos_get(self.item, &x, &y)
            return (x, y)

    def pos_get(self):
        cdef unsigned int x, y
        elm_gengrid_item_pos_get(self.item, &x, &y)
        return (x, y)

    # XXX TODO elm_gengrid_item_item_class_update

    # XXX TODO elm_gengrid_item_item_class_get

    def tooltip_text_set(self, text):
        """Set the text to be shown in the tooltip object

        Setup the text as tooltip object. The object can have only one
        tooltip, so any previous tooltip data is removed.
        Internaly, this method call :py:func:`tooltip_content_cb_set`
        """
        elm_gengrid_item_tooltip_text_set(self.item, _cfruni(text))

    property tooltip_text:
        def __get__(self):
            return self.tooltip_text_get()

    def tooltip_content_cb_set(self, func, *args, **kargs):
        """Set the content to be shown in the tooltip object

        Setup the tooltip to object. The object can have only one tooltip,
        so any previews tooltip data is removed. ``func(args, kargs)`` will
        be called every time that need show the tooltip and it should return a
        valid Evas_Object. This object is then managed fully by tooltip system
        and is deleted when the tooltip is gone.

        :param func: Function to be create tooltip content, called when
            need show tooltip.
        """
        if not callable(func):
            raise TypeError("func must be callable")

        cdef void *cbdata

        data = (func, self, args, kargs)
        Py_INCREF(data)
        cbdata = <void *>data
        elm_gengrid_item_tooltip_content_cb_set(self.item,
                                                _tooltip_item_content_create,
                                                cbdata,
                                                _tooltip_item_data_del_cb)

    def item_tooltip_unset(self):
        """ Unset tooltip from object

        Remove tooltip from object. If used the :py:func:`tooltip_text_set` the internal
        copy of label will be removed correctly. If used
        :py:func:`tooltip_content_cb_set`, the data will be unreferred but no freed.
        """
        elm_gengrid_item_tooltip_unset(self.item)

    property tooltip_style:
        """Style for this object tooltip.

        @note: before you set a style you should define a tooltip with
            elm_gengrid_item_tooltip_content_cb_set() or
            elm_gengrid_item_tooltip_text_set()
        """
        def __get__(self):
            return _ctouni(elm_gengrid_item_tooltip_style_get(self.item))

        def __set__(self, style):
            elm_gengrid_item_tooltip_style_set(self.item, _cfruni(style) if style is not None else NULL)

    def tooltip_style_set(self, style=None):
        elm_gengrid_item_tooltip_style_set(self.item, _cfruni(style) if style is not None else NULL)
    def tooltip_style_get(self):
        return _ctouni(elm_gengrid_item_tooltip_style_get(self.item))

    property tooltip_window_mode:
        def __get__(self):
            return bool(elm_gengrid_item_tooltip_window_mode_get(self.item))

        def __set__(self, disable):
            elm_gengrid_item_tooltip_window_mode_set(self.item, bool(disable))

    def tooltip_window_mode_set(self, disable):
        elm_gengrid_item_tooltip_window_mode_set(self.item, bool(disable))
    def tooltip_window_mode_get(self):
        return bool(elm_gengrid_item_tooltip_window_mode_get(self.item))

    property cursor:
        """The cursor that will be displayed when mouse is over the item.
        The item can have only one cursor set to it, so if this property is
        set twice for an item, the previous one will be unset.

        """
        def __get__(self):
            return _ctouni(elm_gengrid_item_cursor_get(self.item))

        def __set__(self, cursor):
            elm_gengrid_item_cursor_set(self.item, _cfruni(cursor))

        def __del__(self):
            elm_gengrid_item_cursor_unset(self.item)

    def cursor_set(self, char *cursor):
        elm_gengrid_item_cursor_set(self.item, _cfruni(cursor))
    def cursor_get(self):
        return _ctouni(elm_gengrid_item_cursor_get(self.item))
    def cursor_unset(self):
        elm_gengrid_item_cursor_unset(self.item)

    property cursor_style:
        def __get__(self):
            return _ctouni(elm_gengrid_item_cursor_style_get(self.item))

        def __set__(self, style):
            elm_gengrid_item_cursor_style_set(self.item, _cfruni(style) if style is not None else NULL)

    def cursor_style_set(self, style=None):
        elm_gengrid_item_cursor_style_set(self.item, _cfruni(style) if style is not None else NULL)
    def cursor_style_get(self):
        return _ctouni(elm_gengrid_item_cursor_style_get(self.item))

    property cursor_engine_only:
        def __get__(self):
            return elm_gengrid_item_cursor_engine_only_get(self.item)

        def __set__(self, engine_only):
            elm_gengrid_item_cursor_engine_only_set(self.item, bool(engine_only))

    def cursor_engine_only_set(self, engine_only):
        elm_gengrid_item_cursor_engine_only_set(self.item, bool(engine_only))
    def cursor_engine_only_get(self):
        return elm_gengrid_item_cursor_engine_only_get(self.item)

    property select_mode:
        def __get__(self):
            return elm_gengrid_item_select_mode_get(self.item)

        def __set__(self, mode):
            elm_gengrid_item_select_mode_set(self.item, mode)

    def select_mode_set(self, mode):
        elm_gengrid_item_select_mode_set(self.item, mode)
    def select_mode_get(self):
        return elm_gengrid_item_select_mode_get(self.item)

cdef class Gengrid(Object):
    """Creates a generic, scalable and extensible grid widget.

    Like :py:class:`elementary.genlist.Genlist`, this widget allows more
    items while keeping performance. The items may have different look and
    feel, not being restricted only to icon and label.

    """
    def __init__(self, evasObject parent):
        Object.__init__(self, parent.evas)
        self._set_obj(elm_gengrid_add(parent.obj))

    def clear(self):
        elm_gengrid_clear(self.obj)

    property multi_select:
        def __get__(self):
            return bool(elm_gengrid_multi_select_get(self.obj))

        def __set__(self, multi):
            elm_gengrid_multi_select_set(self.obj, bool(multi))

    def multi_select_set(self, multi):
        elm_gengrid_multi_select_set(self.obj, bool(multi))
    def multi_select_get(self):
        return bool(elm_gengrid_multi_select_get(self.obj))

    property horizontal:
        def __get__(self):
            return bool(elm_gengrid_horizontal_get(self.obj))

        def __set__(self, setting):
            elm_gengrid_horizontal_set(self.obj, bool(setting))

    def horizontal_set(self, setting):
        elm_gengrid_horizontal_set(self.obj, bool(setting))
    def horizontal_get(self):
        return bool(elm_gengrid_horizontal_get(self.obj))

    property bounce:
        def __get__(self):
            cdef Eina_Bool h_bounce, v_bounce
            elm_gengrid_bounce_get(self.obj, &h_bounce, &v_bounce)
            return (h_bounce, v_bounce)

        def __set__(self, value):
            h_bounce, v_bounce = value
            elm_gengrid_bounce_set(self.obj, bool(h_bounce), bool(v_bounce))

    def bounce_set(self, h_bounce, v_bounce):
        elm_gengrid_bounce_set(self.obj, bool(h_bounce), bool(v_bounce))
    def bounce_get(self):
        cdef Eina_Bool h_bounce, v_bounce
        elm_gengrid_bounce_get(self.obj, &h_bounce, &v_bounce)
        return (h_bounce, v_bounce)

    def item_append(self, GengridItemClass item_class not None,
                    item_data, func=None):
        """Append a new item (add as last item) to this gengrid.

        :param item_class: a valid instance that defines the
            behavior of this item. See :py:class:`GengridItemClass`.
        :param item_data: some data that defines the model of this
            item. This value will be given to methods of
            ``item_class`` such as
            :py:func:`GengridItemClass.text_get()`. It will also be
            provided to ``func`` as its last parameter.
        :param func: if not None, this must be a callable to be
            called back when the item is selected. The function
            signature is:
            ``func(item, obj, item_data)``
            Where ``item`` is the handle, ``obj`` is the Evas object
            that represents this item, and ``item_data`` is the
            value given as parameter to this function.
        """
        cdef GengridItem ret = GengridItem()
        cdef Elm_Object_Item *item
        cdef Evas_Smart_Cb cb

        if func is None:
            cb = NULL
        elif callable(func):
            cb = _py_elm_gengrid_item_func
        else:
            raise TypeError("func is not None or callable")

        ret.params = (item_class, item_data, func)
        item = elm_gengrid_item_append( self.obj,
                                        &item_class.obj,
                                        <void*>ret,
                                        cb,
                                        <void*>ret)

        if item != NULL:
            ret._set_obj(item)
            return ret
        else:
            Py_DECREF(ret)
            return None

    def item_prepend(self, GengridItemClass item_class not None,
                     item_data, func=None):
        """Prepend a new item (add as first item) to this gengrid.

        :param item_class: a valid instance that defines the
            behavior of this item. See :py:class:`GengridItemClass`.
        :param item_data: some data that defines the model of this
            item. This value will be given to methods of
            ``item_class`` such as
            :py:func:`GengridItemClass.text_get()`. It will also be
            provided to ``func`` as its last parameter.
        :param func: if not None, this must be a callable to be
            called back when the item is selected. The function
            signature is:
            ``func(item, obj, item_data)``
            Where ``item`` is the handle, ``obj`` is the Evas object
            that represents this item, and ``item_data`` is the
            value given as parameter to this function.
        """
        cdef GengridItem ret = GengridItem()
        cdef Elm_Object_Item *item
        cdef Evas_Smart_Cb cb

        if func is None:
            cb = NULL
        elif callable(func):
            cb = _py_elm_gengrid_item_func
        else:
            raise TypeError("func is not None or callable")

        ret.params = (item_class, item_data, func)
        item = elm_gengrid_item_prepend(self.obj,
                                        &item_class.obj,
                                        <void*>ret,
                                        cb,
                                        <void*>ret)
        if item != NULL:
            ret._set_obj(item)
            return ret
        else:
            Py_DECREF(ret)
            return None

    def item_insert_before(self, GengridItemClass item_class not None,
                           item_data, GengridItem before_item=None,
                           func=None):
        """Insert a new item before another item in this gengrid.

        :param item_class: a valid instance that defines the
            behavior of this item. See :py:class:`GengridItemClass`.
        :param item_data: some data that defines the model of this
            item. This value will be given to methods of
            ``item_class`` such as
            :py:func:`GengridItemClass.text_get()`. It will also be
            provided to ``func`` as its last parameter.
        :param before_item: a reference item to use, the new item
            will be inserted before it.
        :param func: if not None, this must be a callable to be
            called back when the item is selected. The function
            signature is:
            ``func(item, obj, item_data)``
            Where ``item`` is the handle, ``obj`` is the Evas object
            that represents this item, and ``item_data`` is the
            value given as parameter to this function.
        """
        cdef GengridItem ret = GengridItem()
        cdef Elm_Object_Item *item, *before
        cdef Evas_Smart_Cb cb

        before = _object_item_from_python(before_item)

        if func is None:
            cb = NULL
        elif callable(func):
            cb = _py_elm_gengrid_item_func
        else:
            raise TypeError("func is not None or callable")

        (item_class, item_data, func)
        item = elm_gengrid_item_insert_before(  self.obj,
                                                &item_class.obj,
                                                <void*>ret,
                                                before,
                                                cb,
                                                <void*>ret)
        if item != NULL:
            ret._set_obj(item)
            return ret
        else:
            Py_DECREF(ret)
            return None

    def item_insert_after(self, GengridItemClass item_class not None,
                          item_data, GengridItem after_item=None,
                          func=None):
        """Insert a new item after another item in this gengrid.

        :param item_class: a valid instance that defines the
            behavior of this item. See :py:class:`GengridItemClass`.
        :param item_data: some data that defines the model of this
            item. This value will be given to methods of
            ``item_class`` such as
            :py:func:`GengridItemClass.text_get()`. It will also be
            provided to ``func`` as its last parameter.
        :param after_item: a reference item to use, the new item
            will be inserted after it.
        :param func: if not None, this must be a callable to be
            called back when the item is selected. The function
            signature is:
            ``func(item, obj, item_data)``
            Where ``item`` is the handle, ``obj`` is the Evas object
            that represents this item, and ``item_data`` is the
            value given as parameter to this function.
        """
        cdef GengridItem ret = GengridItem()
        cdef Elm_Object_Item *item, *after
        cdef Evas_Smart_Cb cb

        after = _object_item_from_python(after_item)

        if func is None:
            cb = NULL
        elif callable(func):
            cb = _py_elm_gengrid_item_func
        else:
            raise TypeError("func is not None or callable")

        ret.params = (item_class, item_data, func)
        item = elm_gengrid_item_insert_after(   self.obj,
                                                &item_class.obj,
                                                <void*>ret,
                                                after,
                                                cb,
                                                <void*>ret)
        if item != NULL:
            ret._set_obj(item)
            return ret
        else:
            Py_DECREF(ret)
            return None

    # XXX TODO elm_gengrid_item_sorted_insert()

    property selected_item:
        def __get__(self):
            return _object_item_to_python(elm_gengrid_selected_item_get(self.obj))

    def selected_item_get(self):
        return _object_item_to_python(elm_gengrid_selected_item_get(self.obj))

    property selected_items:
        def __get__(self):
            return _object_item_list_to_python(elm_gengrid_selected_items_get(self.obj))

    def selected_items_get(self):
        return _object_item_list_to_python(elm_gengrid_selected_items_get(self.obj))

    property realized_items:
        def __get__(self):
            return _object_item_list_to_python(elm_gengrid_realized_items_get(self.obj))

    def realized_items_get(self):
        return _object_item_list_to_python(elm_gengrid_realized_items_get(self.obj))

    def realized_items_update(self):
        elm_gengrid_realized_items_update(self.obj)

    property first_item:
        def __get__(self):
            return _object_item_to_python(elm_gengrid_first_item_get(self.obj))

    def first_item_get(self):
        return _object_item_to_python(elm_gengrid_first_item_get(self.obj))

    property last_item:
        def __get__(self):
            return _object_item_to_python(elm_gengrid_last_item_get(self.obj))

    def last_item_get(self):
        return _object_item_to_python(elm_gengrid_last_item_get(self.obj))

    property scroller_policy:
        def __get__(self):
            cdef Elm_Scroller_Policy policy_h, policy_v
            elm_gengrid_scroller_policy_get(self.obj, &policy_h, &policy_v)
            return (policy_h, policy_v)

        def __set__(self, value):
            policy_h, policy_v = value
            elm_gengrid_scroller_policy_set(self.obj, policy_h, policy_v)

    def scroller_policy_set(self, policy_h, policy_v):
        elm_gengrid_scroller_policy_set(self.obj, policy_h, policy_v)
    def scroller_policy_get(self):
        cdef Elm_Scroller_Policy policy_h, policy_v
        elm_gengrid_scroller_policy_get(self.obj, &policy_h, &policy_v)
        return (policy_h, policy_v)

    def items_count(self):
        return elm_gengrid_items_count(self.obj)

    property item_size:
        def __get__(self):
            cdef Evas_Coord x, y
            elm_gengrid_item_size_get(self.obj, &x, &y)
            return (x, y)

        def __set__(self, value):
            w, h = value
            elm_gengrid_item_size_set(self.obj, w, h)

    def item_size_set(self, w, h):
        elm_gengrid_item_size_set(self.obj, w, h)
    def item_size_get(self):
        cdef Evas_Coord x, y
        elm_gengrid_item_size_get(self.obj, &x, &y)
        return (x, y)

    property group_item_size:
        def __get__(self):
            cdef Evas_Coord w, h
            elm_gengrid_group_item_size_get(self.obj, &w, &h)
            return (w, h)

        def __set__(self, value):
            w, h = value
            elm_gengrid_group_item_size_set(self.obj, w, h)

    def group_item_size_set(self, w, h):
        elm_gengrid_group_item_size_set(self.obj, w, h)
    def group_item_size_get(self):
        cdef Evas_Coord w, h
        elm_gengrid_group_item_size_get(self.obj, &w, &h)
        return (w, h)

    property align:
        def __get__(self):
            cdef double align_x, align_y
            elm_gengrid_align_get(self.obj, &align_x, &align_y)
            return (align_x, align_y)

        def __set__(self, value):
            align_x, align_y = value
            elm_gengrid_align_set(self.obj, align_x, align_y)

    def align_set(self, align_x, align_y):
        elm_gengrid_align_set(self.obj, align_x, align_y)
    def align_get(self):
        cdef double align_x, align_y
        elm_gengrid_align_get(self.obj, &align_x, &align_y)
        return (align_x, align_y)

    property reorder_mode:
        def __get__(self):
            return bool(elm_gengrid_reorder_mode_get(self.obj))

        def __set__(self, mode):
            elm_gengrid_reorder_mode_set(self.obj, bool(mode))

    def reorder_mode_set(self, mode):
        elm_gengrid_reorder_mode_set(self.obj, bool(mode))
    def reorder_mode_get(self, mode):
        return bool(elm_gengrid_reorder_mode_get(self.obj))

    property page_relative:
        def __get__(self):
            cdef double h_pagerel, v_pagerel
            elm_gengrid_page_relative_get(self.obj, &h_pagerel, &v_pagerel)
            return (h_pagerel, v_pagerel)

        def __set__(self, value):
            h_pagerel, v_pagerel = value
            elm_gengrid_page_relative_set(self.obj, h_pagerel, v_pagerel)

    def page_relative_set(self, h_pagerel, v_pagerel):
        elm_gengrid_page_relative_set(self.obj, h_pagerel, v_pagerel)
    def page_relative_get(self):
        cdef double h_pagerel, v_pagerel
        elm_gengrid_page_relative_get(self.obj, &h_pagerel, &v_pagerel)
        return (h_pagerel, v_pagerel)

    def page_size_set(self, h_pagesize, v_pagesize):
        elm_gengrid_page_size_set(self.obj, h_pagesize, v_pagesize)

    property current_page:
        def __get__(self):
            cdef int h_pagenum, v_pagenum
            elm_gengrid_current_page_get(self.obj, &h_pagenum, &v_pagenum)
            return (h_pagenum, v_pagenum)

    def current_page_get(self):
        cdef int h_pagenum, v_pagenum
        elm_gengrid_current_page_get(self.obj, &h_pagenum, &v_pagenum)
        return (h_pagenum, v_pagenum)

    property last_page:
        def __get__(self):
            cdef int h_pagenum, v_pagenum
            elm_gengrid_last_page_get(self.obj, &h_pagenum, &v_pagenum)
            return (h_pagenum, v_pagenum)

    def last_page_get(self):
        cdef int h_pagenum, v_pagenum
        elm_gengrid_last_page_get(self.obj, &h_pagenum, &v_pagenum)
        return (h_pagenum, v_pagenum)

    def page_show(self, h_pagenum, v_pagenum):
        elm_gengrid_page_show(self.obj, h_pagenum, v_pagenum)

    def page_bring_in(self, h_pagenum, v_pagenum):
        elm_gengrid_page_bring_in(self.obj, h_pagenum, v_pagenum)

    property filled:
        def __get__(self):
            return bool(elm_gengrid_filled_get(self.obj))

        def __set__(self, fill):
            elm_gengrid_filled_set(self.obj, bool(fill))

    def filled_set(self, fill):
        elm_gengrid_filled_set(self.obj, bool(fill))
    def filled_get(self, fill):
        return bool(elm_gengrid_filled_get(self.obj))

    property select_mode:
        def __get__(self):
            return elm_gengrid_select_mode_get(self.obj)

        def __set__(self, mode):
            elm_gengrid_select_mode_set(self.obj, mode)

    def select_mode_set(self, mode):
        elm_gengrid_select_mode_set(self.obj, mode)
    def select_mode_get(self):
        return elm_gengrid_select_mode_get(self.obj)

    property highlight_mode:
        def __get__(self):
            return bool(elm_gengrid_highlight_mode_get(self.obj))

        def __set__(self, highlight):
            elm_gengrid_highlight_mode_set(self.obj, bool(highlight))

    def highlight_mode_set(self, highlight):
        elm_gengrid_highlight_mode_set(self.obj, bool(highlight))
    def highlight_mode_get(self, fill):
        return bool(elm_gengrid_highlight_mode_get(self.obj))

    def callback_clicked_double_add(self, func, *args, **kwargs):
        self._callback_add_full("clicked,double", _cb_object_item_conv,
                                func, *args, **kwargs)

    def callback_clicked_double_del(self, func):
        self._callback_del_full("clicked,double", _cb_object_item_conv, func)

    def callback_clicked_add(self, func, *args, **kwargs):
        self._callback_add_full("clicked", _cb_object_item_conv,
                                func, *args, **kwargs)

    def callback_clicked_del(self, func):
        self._callback_del_full("clicked", _cb_object_item_conv, func)

    def callback_selected_add(self, func, *args, **kwargs):
        self._callback_add_full("selected", _cb_object_item_conv,
                                func, *args, **kwargs)

    def callback_selected_del(self, func):
        self._callback_del_full("selected",  _cb_object_item_conv, func)

    def callback_unselected_add(self, func, *args, **kwargs):
        self._callback_add_full("unselected", _cb_object_item_conv,
                                func, *args, **kwargs)

    def callback_unselected_del(self, func):
        self._callback_del_full("unselected", _cb_object_item_conv, func)

_elm_widget_type_register("gengrid", Gengrid)

_install_metaclass(Gengrid)
