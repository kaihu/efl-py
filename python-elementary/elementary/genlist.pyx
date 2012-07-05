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
                            _object_item_list_to_python, \
                            elm_object_item_data_get
from object_item import _cb_object_item_conv
from general cimport strdup, PY_REFCOUNT
from list cimport ELM_LIST_COMPRESS

from evas.general cimport eina_list_remove_list
import traceback

cdef _py_elm_genlist_item_call(func, Evas_Object *obj, part, data) with gil:
    try:
        o = Object_from_instance(obj)
        return func(o, _ctouni(part), data)
    except Exception as e:
        traceback.print_exc()
        return None

cdef char *_py_elm_genlist_item_text_get(void *data, Evas_Object *obj, const_char_ptr part) with gil:
    cdef GenlistItem item = <object>data
    cdef object params = item.params
    cdef GenlistItemClass itc = params[0]

    func = itc._text_get_func
    if func is None:
        return NULL

    ret = _py_elm_genlist_item_call(func, obj, part, params[1])
    if ret is not None:
        return strdup(_fruni(ret))
    else:
        return NULL

cdef Evas_Object *_py_elm_genlist_item_content_get(void *data, Evas_Object *obj, const_char_ptr part) with gil:
    cdef GenlistItem item = <object>data
    cdef object params = item.params
    cdef evasObject icon
    cdef GenlistItemClass itc = params[0]

    func = itc._content_get_func
    if func is None:
        return NULL

    ret = _py_elm_genlist_item_call(func, obj, part, params[1])
    if ret is not None:
        try:
            icon = ret
            return icon.obj
        except Exception as e:
            traceback.print_exc()
            return NULL
    else:
        return NULL

cdef Eina_Bool _py_elm_genlist_item_state_get(void *data, Evas_Object *obj, const_char_ptr part) with gil:
    cdef GenlistItem item = <object>data
    cdef object params = item.params
    cdef GenlistItemClass itc = params[0]

    func = itc._state_get_func
    if func is None:
        return False

    ret = _py_elm_genlist_item_call(func, obj, part, params[1])
    if ret is not None:
        return bool(ret)
    else:
        return False

cdef void _py_elm_genlist_object_item_del(void *data, Evas_Object *obj) with gil:
    cdef GenlistItem item = <object>data
    cdef object params
    cdef GenlistItemClass itc

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

cdef void _py_elm_genlist_item_func(void *data, Evas_Object *obj, void *event_info) with gil:
    cdef GenlistItem item = <object>data
    cdef object func = item.params[2]

    if func is not None:
        try:
            o = Object_from_instance(obj)
            func(item, o, item.params[1])
        except Exception as e:
            traceback.print_exc()

cdef class GenlistItemClass:
    """Defines the behavior of each list item.

    This class should be created and handled to the Genlist itself.

    It may be subclassed, in this case the methods :py:func:`text_get()`,
    :py:func:`content_get()`, :py:func:`state_get()` and ``delete()`` will be used.

    It may also be instantiated directly, given getters to override as
    constructor parameters.

    """
    cdef Elm_Genlist_Item_Class obj
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
        self.obj.func.text_get = _py_elm_genlist_item_text_get
        self.obj.func.content_get = _py_elm_genlist_item_content_get
        self.obj.func.state_get = _py_elm_genlist_item_state_get
        self.obj.func.del_ = _py_elm_genlist_object_item_del

    def __init__(self, item_style=None, text_get_func=None,
                 content_get_func=None, state_get_func=None, del_func=None):
        """GenlistItemClass constructor.

        :param item_style: the string that defines the genlist item
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
            called when row is deleted, thus finalizing resouces
            and similar. This function should have the signature:
            ``func(obj, part, item_data) -> str``

        .. note:: In all these signatures, 'obj' means Genlist and
            'item_data' is the value given to Genlist item append/prepend
            methods, it should represent your row model as you want.
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

        self.obj.item_style = _fruni(self._item_style)

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
        return ("%s(%#x, refcount=%d, Elm_Genlist_Item_Class=%#x, "
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
        """To be called by Genlist for each row to get its label.

        :param obj: the Genlist instance
        :param part: the part that is being handled.
        :param item_data: the value given to genlist append/prepend.

        :return: label to be used.
        :rtype: str or None
        """
        return None

    def content_get(self, evasObject obj, part, item_data):
        """To be called by Genlist for each row to get its icon.

        :param obj: the Genlist instance
        :param part: the part that is being handled.
        :param item_data: the value given to genlist append/prepend.

        :return: icon object to be used and swallowed.
        :rtype: evas Object or None
        """
        return None

    def state_get(self, evasObject obj, part, item_data):
        """To be called by Genlist for each row to get its state.

        :param obj: the Genlist instance
        :param part: the part that is being handled.
        :param item_data: the value given to genlist append/prepend.

        :return: state to be used.
        :rtype: bool or None
        """
        return False

cdef class GenlistItem(ObjectItem):

    """An item for the :py:class:`Genlist` widget."""

    cdef int _set_obj(self, Elm_Object_Item *item, params=None) except 0:
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
            return _object_item_to_python(elm_genlist_item_next_get(self.item))

    def next_get(self):
        return _object_item_to_python(elm_genlist_item_next_get(self.item))

    property prev:
        def __get__(self):
            return _object_item_to_python(elm_genlist_item_prev_get(self.item))

    def prev_get(self):
        return _object_item_to_python(elm_genlist_item_prev_get(self.item))

    property selected:
        def __get__(self):
            return bool(elm_genlist_item_selected_get(self.item))

        def __set__(self, selected):
            elm_genlist_item_selected_set(self.item, bool(selected))

    def selected_set(self, selected):
        elm_genlist_item_selected_set(self.item, bool(selected))
    def selected_get(self):
        return bool(elm_genlist_item_selected_get(self.item))

    def show(self, scrollto_type = ELM_GENLIST_ITEM_SCROLLTO_IN):
        elm_genlist_item_show(self.item, scrollto_type)

    def bring_in(self, scrollto_type = ELM_GENLIST_ITEM_SCROLLTO_IN):
        elm_genlist_item_bring_in(self.item, scrollto_type)

    def update(self):
        elm_genlist_item_update(self.item)

    #def item_class_update(self, Elm_Genlist_Item_Class itc):
        #elm_genlist_item_item_class_update(self.item, itc)

    #def item_class_get(self):
        #return elm_genlist_item_item_class_get(self.item)

    property index:
        def __get__(self):
            return elm_genlist_item_index_get(self.item)

    def index_get(self):
        return elm_genlist_item_index_get(self.item)

    def tooltip_text_set(self, char *text):
        """ Set the text to be shown in the tooltip object

        Setup the text as tooltip object. The object can have only one
        tooltip, so any previous tooltip data is removed.
        Internally, this method calls :py:func:`tooltip_content_cb_set`
        """
        elm_genlist_item_tooltip_text_set(self.item, _cfruni(text))

    def tooltip_content_cb_set(self, func, *args, **kargs):
        """ Set the content to be shown in the tooltip object

        Setup the tooltip to object. The object can have only one tooltip,
        so any previews tooltip data is removed. ``func(args,kargs)`` will
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
        elm_genlist_item_tooltip_content_cb_set(self.item,
                                                _tooltip_item_content_create,
                                                cbdata,
                                                _tooltip_item_data_del_cb)

    def tooltip_unset(self):
        """ Unset tooltip from object

        Remove tooltip from object. If used the :py:func:`tooltip_text_set` the internal
        copy of label will be removed correctly. If used
        :py:func:`tooltip_content_cb_set`, the data will be unreferred but no freed.
        """
        elm_genlist_item_tooltip_unset(self.item)

    def tooltip_style_set(self, style=None):
        """ Sets a different style for this object tooltip.

        .. note:: before you set a style you should define a tooltip with
            elm_genlist_item_tooltip_content_cb_set() or
            elm_genlist_item_tooltip_text_set()
        """
        if style:
            elm_genlist_item_tooltip_style_set(self.item, _cfruni(style))
        else:
            elm_genlist_item_tooltip_style_set(self.item, NULL)

    def tooltip_style_get(self):
        """ Get the style for this object tooltip.
        """
        return _ctouni(elm_genlist_item_tooltip_style_get(self.item))

    def tooltip_window_mode_set(self, disable):
        return bool(elm_genlist_item_tooltip_window_mode_set(self.item, disable))

    def tooltip_window_mode_get(self):
        return bool(elm_genlist_item_tooltip_window_mode_get(self.item))

    def cursor_set(self, cursor):
        """ Set the cursor to be shown when mouse is over the genlist item

        Set the cursor that will be displayed when mouse is over the
        item. The item can have only one cursor set to it, so if
        this function is called twice for an item, the previous set
        will be unset.
        """
        elm_genlist_item_cursor_set(self.item, _cfruni(cursor))

    def cursor_get(self):
        return _ctouni(elm_genlist_item_cursor_get(self.item))

    def cursor_unset(self):
        """  Unset the cursor to be shown when mouse is over the genlist item
        """
        elm_genlist_item_cursor_unset(self.item)

    def cursor_style_set(self, style=None):
        """ Sets a different style for this object cursor.

        .. note:: before you set a style you should define a cursor with
            elm_genlist_item_cursor_set()
        """
        if style:
            elm_genlist_item_cursor_style_set(self.item, _cfruni(style))
        else:
            elm_genlist_item_cursor_style_set(self.item, NULL)

    def cursor_style_get(self):
        """ Get the style for this object cursor.
        """
        return _ctouni(elm_genlist_item_cursor_style_get(self.item))

    def cursor_engine_only_set(self, engine_only):
        """ Sets cursor engine only usage for this object.

        .. note:: before you set engine only usage you should define a cursor with
            elm_genlist_item_cursor_set()
        """
        elm_genlist_item_cursor_engine_only_set(self.item, bool(engine_only))

    def cursor_engine_only_get(self):
        """ Get the engine only usage for this object.
        """
        return elm_genlist_item_cursor_engine_only_get(self.item)

    property parent:
        def __get__(self):
            return _object_item_to_python(elm_genlist_item_parent_get(self.item))

    def parent_get(self):
        return _object_item_to_python(elm_genlist_item_parent_get(self.item))

    def subitems_clear(self):
        elm_genlist_item_subitems_clear(self.item)

    property expanded:
        def __get__(self):
            return bool(elm_genlist_item_expanded_get(self.item))

        def __set__(self, expanded):
            elm_genlist_item_expanded_set(self.item, bool(expanded))

    def expanded_set(self, expanded):
        elm_genlist_item_expanded_set(self.item, bool(expanded))
    def expanded_get(self, ):
        return bool(elm_genlist_item_expanded_get(self.item))

    property expanded_depth:
        def __get__(self):
            return elm_genlist_item_expanded_depth_get(self.item)

    def expanded_depth_get(self):
        return elm_genlist_item_expanded_depth_get(self.item)

    def all_contents_unset(self):
        cdef Eina_List *lst
        elm_genlist_item_all_contents_unset(self.item, &lst)
        return _object_item_list_to_python(lst)

    def promote(self):
        elm_genlist_item_promote(self.item)

    def demote(self):
        elm_genlist_item_demote(self.item)

    def fields_update(self, parts, itf):
        elm_genlist_item_fields_update(self.item, _cfruni(parts), itf)

    property decorate_mode:
        def __set__(self, value):
            decorate_it_type, decorate_it_set = value
            elm_genlist_item_decorate_mode_set(self.item, _cfruni(decorate_it_type), decorate_it_set)

        def __get__(self):
            return _ctouni(elm_genlist_item_decorate_mode_get(self.item))

    def decorate_mode_set(self, decorate_it_type, decorate_it_set):
        elm_genlist_item_decorate_mode_set(self.item, _cfruni(decorate_it_type), decorate_it_set)
    def decorate_mode_get(self):
        return _ctouni(elm_genlist_item_decorate_mode_get(self.item))

    property type:
        def __get__(self):
            cdef Elm_Genlist_Item_Type ittype = elm_genlist_item_type_get(self.item)
            return <Elm_Genlist_Item_Type>ittype

    def type_get(self):
        cdef Elm_Genlist_Item_Type ittype = elm_genlist_item_type_get(self.item)
        return <Elm_Genlist_Item_Type>ittype

    property flip:
        def __set__(self, flip):
            elm_genlist_item_flip_set(self.item, flip)

        def __get__(self):
            return bool(elm_genlist_item_flip_get(self.item))

    def flip_set(self, flip):
        elm_genlist_item_flip_set(self.item, flip)
    def flip_get(self):
        return bool(elm_genlist_item_flip_get(self.item))

    property select_mode:
        def __set__(self, mode):
            elm_genlist_item_select_mode_set(self.item, mode)

        def __get__(self):
            return elm_genlist_item_select_mode_get(self.item)

    def select_mode_set(self, mode):
        elm_genlist_item_select_mode_set(self.item, mode)
    def select_mode_get(self):
        return elm_genlist_item_select_mode_get(self.item)

cdef class Genlist(Object):
    """This widget aims to have more expansive list than the simple list in
    Elementary that could have more flexible items and allow many more
    entries while still being fast and low on memory usage. At the same time
    it was also made to be able to do tree structures. But the price to pay
    is more complexity when it comes to usage. If all you want is a simple
    list with icons and a single text, use the normal
    :py:class:`elementary.list.List` object.

    Genlist has a fairly large API, mostly because it's relatively complex,
    trying to be both expansive, powerful and efficient. First we will begin
    an overview on the theory behind genlist.

    .. rubric:: Genlist item classes - creating items

    In order to have the ability to add and delete items on the fly, genlist
    implements a class (callback) system where the application provides a
    structure with information about that type of item (genlist may contain
    multiple different items with different classes, states and styles).
    Genlist will call the functions in this struct (methods) when an item is
    "realized" (i.e., created dynamically, while the user is scrolling the
    grid). All objects will simply be deleted when no longer needed with
    evas_object_del(). The #Elm_Genlist_Item_Class structure contains the
    following members:

    - ``item_style`` - This is a constant string and simply defines the name
      of the item style. It **must** be specified and the default should be
      ``"default".``
    - ``decorate_item_style`` - This is a constant string and simply defines
      the name of the decorate mode item style. It is used to specify
      decorate mode item style. It can be used when you call
      elm_genlist_item_decorate_mode_set().
    - ``decorate_all_item_style`` - This is a constant string and simply
      defines the name of the decorate all item style. It is used to specify
      decorate all item style. It can be used to set selection, checking and
      deletion mode. This is used when you call
      elm_genlist_decorate_mode_set().
    - ``func`` - A struct with pointers to functions that will be called when
      an item is going to be actually created. All of them receive a ``data``
      parameter that will point to the same data passed to
      elm_genlist_item_append() and related item creation functions, and an
      ``obj`` parameter that points to the genlist object itself.

    The function pointers inside ``func`` are ``text_get,`` ``content_get,``
    ``state_get`` and ``del.`` The 3 first functions also receive a ``part``
    parameter described below. A brief description of these functions follows:

    - ``text_get`` - The ``part`` parameter is the name string of one of the
      existing text parts in the Edje group implementing the item's theme.
      This function **must** return a strdup'()ed string, as the caller will
      free() it when done. See #Elm_Genlist_Item_Text_Get_Cb.
    - ``content_get`` - The ``part`` parameter is the name string of one of the
      existing (content) swallow parts in the Edje group implementing the
      item's theme. It must return ``NULL,`` when no content is desired, or
      a valid object handle, otherwise.  The object will be deleted by the
      genlist on its deletion or when the item is "unrealized". See
      #Elm_Genlist_Item_Content_Get_Cb.
    - ``func.state_get`` - The ``part`` parameter is the name string of one of
      the state parts in the Edje group implementing the item's theme. Return
      ``EINA_FALSE`` for false/off or ``EINA_TRUE`` for true/on. Genlists will
      emit a signal to its theming Edje object with ``"elm,state,xxx,active"``
      and ``"elm"`` as "emission" and "source" arguments, respectively, when
      the state is true (the default is false), where ``xxx`` is the name of
      the (state) part.  See #Elm_Genlist_Item_State_Get_Cb.
    - ``func.del`` - This is intended for use when genlist items are deleted,
      so any data attached to the item (e.g. its data parameter on creation)
      can be deleted. See #Elm_Genlist_Item_Del_Cb.

    available item styles:

    - default
    - default_style - The text part is a textblock

    @image html img/widget/genlist/preview-04.png
    @image latex img/widget/genlist/preview-04.eps

    - double_label

    @image html img/widget/genlist/preview-01.png
    @image latex img/widget/genlist/preview-01.eps

    - icon_top_text_bottom

    @image html img/widget/genlist/preview-02.png
    @image latex img/widget/genlist/preview-02.eps

    - group_index

    @image html img/widget/genlist/preview-03.png
    @image latex img/widget/genlist/preview-03.eps

    - one_icon - Only 1 icon (left) @since 1.1
    - end_icon - Only 1 icon (at end/right) @since 1.1
    - no_icon - No icon (at end/right) @since 1.1

    .. rubric:: Structure of items

    An item in a genlist can have 0 or more texts (they can be regular text
    or textblock Evas objects - that's up to the style to determine), 0 or
    more contents (which are simply objects swallowed into the genlist item's
    theming Edje object) and 0 or more <b>boolean states</b>, which have the
    behavior left to the user to define. The Edje part names for each of
    these properties will be looked up, in the theme file for the genlist,
    under the Edje (string) data items named ``"labels",`` ``"contents"``
    and ``"states",`` respectively. For each of those properties, if more
    than one part is provided, they must have names listed separated by
    spaces in the data fields. For the default genlist item theme, we have
    **one** text part (``"elm.text"),`` **two** content parts
    (``"elm.swallow.icon"`` and ``"elm.swallow.end")`` and **no** state parts.

    A genlist item may be at one of several styles. Elementary provides one
    by default - "default", but this can be extended by system or application
    custom themes/overlays/extensions (see @ref Theme "themes" for more
    details).

    .. rubric:: Editing and Navigating

    Items can be added by several calls. All of them return a @ref
    Elm_Object_Item handle that is an internal member inside the genlist.
    They all take a data parameter that is meant to be used for a handle to
    the applications internal data (eg. the struct with the original item
    data). The parent parameter is the parent genlist item this belongs to if
    it is a tree or an indexed group, and NULL if there is no parent. The
    flags can be a bitmask of #ELM_GENLIST_ITEM_NONE, #ELM_GENLIST_ITEM_TREE
    and #ELM_GENLIST_ITEM_GROUP. If #ELM_GENLIST_ITEM_TREE is set then this
    item is displayed as an item that is able to expand and have child items.
    If #ELM_GENLIST_ITEM_GROUP is set then this item is group index item that
    is displayed at the top until the next group comes. The func parameter is
    a convenience callback that is called when the item is selected and the
    data parameter will be the func_data parameter, ``obj`` be the genlist
    object and event_info will be the genlist item.

    elm_genlist_item_append() adds an item to the end of the list, or if
    there is a parent, to the end of all the child items of the parent.
    elm_genlist_item_prepend() is the same but adds to the beginning of
    the list or children list. elm_genlist_item_insert_before() inserts at
    item before another item and elm_genlist_item_insert_after() inserts after
    the indicated item.

    The application can clear the list with elm_genlist_clear() which deletes
    all the items in the list and elm_object_item_del() will delete a specific
    item. elm_genlist_item_subitems_clear() will clear all items that are
    children of the indicated parent item.

    To help inspect list items you can jump to the item at the top of the list
    with elm_genlist_first_item_get() which will return the item pointer, and
    similarly elm_genlist_last_item_get() gets the item at the end of the list.
    elm_genlist_item_next_get() and elm_genlist_item_prev_get() get the next
    and previous items respectively relative to the indicated item. Using
    these calls you can walk the entire item list/tree. Note that as a tree
    the items are flattened in the list, so elm_genlist_item_parent_get() will
    let you know which item is the parent (and thus know how to skip them if
    wanted).

    .. rubric:: Multi-selection

    If the application wants multiple items to be able to be selected,
    elm_genlist_multi_select_set() can enable this. If the list is
    single-selection only (the default), then elm_genlist_selected_item_get()
    will return the selected item, if any, or NULL if none is selected. If the
    list is multi-select then elm_genlist_selected_items_get() will return a
    list (that is only valid as long as no items are modified (added, deleted,
    selected or unselected)).

    .. rubric:: Usage hints

    There are also convenience functions. elm_object_item_widget_get() will
    return the genlist object the item belongs to. elm_genlist_item_show()
    will make the scroller scroll to show that specific item so its visible.
    elm_object_item_data_get() returns the data pointer set by the item
    creation functions.

    If an item changes (state of boolean changes, text or contents change),
    then use elm_genlist_item_update() to have genlist update the item with
    the new state. Genlist will re-realize the item and thus call the functions
    in the _Elm_Genlist_Item_Class for that item.

    To programmatically (un)select an item use elm_genlist_item_selected_set().
    To get its selected state use elm_genlist_item_selected_get(). Similarly
    to expand/contract an item and get its expanded state, use
    elm_genlist_item_expanded_set() and elm_genlist_item_expanded_get(). And
    again to make an item disabled (unable to be selected and appear
    differently) use elm_object_item_disabled_set() to set this and
    elm_object_item_disabled_get() to get the disabled state.

    In general to indicate how the genlist should expand items horizontally to
    fill the list area, use elm_genlist_mode_set(). Valid modes are
    ELM_LIST_LIMIT, ELM_LIST_COMPRESS and ELM_LIST_SCROLL. The default is
    ELM_LIST_SCROLL. This mode means that if items are too wide to fit, the
    scroller will scroll horizontally. Otherwise items are expanded to
    fill the width of the viewport of the scroller. If it is
    ELM_LIST_LIMIT, items will be expanded to the viewport width
    if larger than the item, but genlist widget with is
    limited to the largest item. D not use ELM_LIST_LIMIT mode with homogenous
    mode turned on. ELM_LIST_COMPRESS can be combined with a different style
    that uses edjes' ellipsis feature (cutting text off like this: "tex...").

    Items will only call their selection func and callback when first becoming
    selected. Any further clicks will do nothing, unless you enable always
    select with elm_genlist_select_mode_set() as ELM_OBJECT_SELECT_MODE_ALWAYS.
    This means even if selected, every click will make the selected callbacks
    be called. elm_genlist_select_mode_set() as ELM_OBJECT_SELECT_MODE_NONE will
    turn off the ability to select items entirely and they will neither
    appear selected nor call selected callback functions.

    Remember that you can create new styles and add your own theme augmentation
    per application with elm_theme_extension_add(). If you absolutely must
    have a specific style that overrides any theme the user or system sets up
    you can use elm_theme_overlay_add() to add such a file.

    .. rubric:: Implementation

    Evas tracks every object you create. Every time it processes an event
    (mouse move, down, up etc.) it needs to walk through objects and find out
    what event that affects. Even worse every time it renders display updates,
    in order to just calculate what to re-draw, it needs to walk through many
    many many objects. Thus, the more objects you keep active, the more
    overhead Evas has in just doing its work. It is advisable to keep your
    active objects to the minimum working set you need. Also remember that
    object creation and deletion carries an overhead, so there is a
    middle-ground, which is not easily determined. But don't keep massive lists
    of objects you can't see or use. Genlist does this with list objects. It
    creates and destroys them dynamically as you scroll around. It groups them
    into blocks so it can determine the visibility etc. of a whole block at
    once as opposed to having to walk the whole list. This 2-level list allows
    for very large numbers of items to be in the list (tests have used up to
    2,000,000 items). Also genlist employs a queue for adding items. As items
    may be different sizes, every item added needs to be calculated as to its
    size and thus this presents a lot of overhead on populating the list, this
    genlist employs a queue. Any item added is queued and spooled off over
    time, actually appearing some time later, so if your list has many members
    you may find it takes a while for them to all appear, with your process
    consuming a lot of CPU while it is busy spooling.

    Genlist also implements a tree structure, but it does so with callbacks to
    the application, with the application filling in tree structures when
    requested (allowing for efficient building of a very deep tree that could
    even be used for file-management). See the above smart signal callbacks for
    details.

    .. rubric:: Genlist smart events

    Signals that you can add callbacks for are:

    - ``"activated"`` - The user has double-clicked or pressed
      (enter|return|spacebar) on an item. The ``event_info`` parameter is the
      item that was activated.
    - ``"clicked,double"`` - The user has double-clicked an item.  The @c
      event_info parameter is the item that was double-clicked.
    - ``"selected"`` - This is called when a user has made an item selected.
      The event_info parameter is the genlist item that was selected.
    - ``"unselected"`` - This is called when a user has made an item
      unselected. The event_info parameter is the genlist item that was
      unselected.
    - ``"expanded"`` - This is called when elm_genlist_item_expanded_set() is
      called and the item is now meant to be expanded. The event_info
      parameter is the genlist item that was indicated to expand.  It is the
      job of this callback to then fill in the child items.
    - ``"contracted"`` - This is called when elm_genlist_item_expanded_set() is
      called and the item is now meant to be contracted. The event_info
      parameter is the genlist item that was indicated to contract. It is the
      job of this callback to then delete the child items.
    - ``"expand,request"`` - This is called when a user has indicated they want
      to expand a tree branch item. The callback should decide if the item can
      expand (has any children) and then call elm_genlist_item_expanded_set()
      appropriately to set the state. The event_info parameter is the genlist
      item that was indicated to expand.
    - ``"contract,request"`` - This is called when a user has indicated they
      want to contract a tree branch item. The callback should decide if the
      item can contract (has any children) and then call
      elm_genlist_item_expanded_set() appropriately to set the state. The
      event_info parameter is the genlist item that was indicated to contract.
    - ``"realized"`` - This is called when the item in the list is created as a
      real evas object. event_info parameter is the genlist item that was
      created.
    - ``"unrealized"`` - This is called just before an item is unrealized.
      After this call content objects provided will be deleted and the item
      object itself delete or be put into a floating cache.
    - ``"drag,start,up"`` - This is called when the item in the list has been
      dragged (not scrolled) up.
    - ``"drag,start,down"`` - This is called when the item in the list has been
      dragged (not scrolled) down.
    - ``"drag,start,left"`` - This is called when the item in the list has been
      dragged (not scrolled) left.
    - ``"drag,start,right"`` - This is called when the item in the list has
      been dragged (not scrolled) right.
    - ``"drag,stop"`` - This is called when the item in the list has stopped
      being dragged.
    - ``"drag"`` - This is called when the item in the list is being dragged.
    - ``"longpressed"`` - This is called when the item is pressed for a certain
      amount of time. By default it's 1 second. The event_info parameter is the
      longpressed genlist item.
    - ``"scroll,anim,start"`` - This is called when scrolling animation has
      started.
    - ``"scroll,anim,stop"`` - This is called when scrolling animation has
      stopped.
    - ``"scroll,drag,start"`` - This is called when dragging the content has
      started.
    - ``"scroll,drag,stop"`` - This is called when dragging the content has
      stopped.
    - ``"edge,top"`` - This is called when the genlist is scrolled until
      the top edge.
    - ``"edge,bottom"`` - This is called when the genlist is scrolled
      until the bottom edge.
    - ``"edge,left"`` - This is called when the genlist is scrolled
      until the left edge.
    - ``"edge,right"`` - This is called when the genlist is scrolled
      until the right edge.
    - ``"multi,swipe,left"`` - This is called when the genlist is multi-touch
      swiped left.
    - ``"multi,swipe,right"`` - This is called when the genlist is multi-touch
      swiped right.
    - ``"multi,swipe,up"`` - This is called when the genlist is multi-touch
      swiped up.
    - ``"multi,swipe,down"`` - This is called when the genlist is multi-touch
      swiped down.
    - ``"multi,pinch,out"`` - This is called when the genlist is multi-touch
      pinched out.
    - ``multi,pinch,in"`` - This is called when the genlist is multi-touch
      pinched in.
    - ``"swipe"`` - This is called when the genlist is swiped.
    - ``"moved"`` - This is called when a genlist item is moved in reorder mode.
    - ``"moved,after"`` - This is called when a genlist item is moved after
      another item in reorder mode. The event_info parameter is the reordered
      item. To get the relative previous item, use elm_genlist_item_prev_get().
      This signal is called along with "moved" signal.
    - ``"moved,before"`` - This is called when a genlist item is moved before
      another item in reorder mode. The event_info parameter is the reordered
      item. To get the relative previous item, use elm_genlist_item_next_get().
      This signal is called along with "moved" signal.
    - ``"language,changed"`` - This is called when the program's language is
      changed.
    - ``"tree,effect,finished"`` - This is called when a genlist tree effect
      is finished.

    """

    def __init__(self, evasObject parent):
        Object.__init__(self, parent.evas)
        self._set_obj(elm_genlist_add(parent.obj))

    def clear(self):
        elm_genlist_clear(self.obj)

    property multi_select:
        def __set__(self, multi):
            elm_genlist_multi_select_set(self.obj, bool(multi))

        def __get__(self):
            return bool(elm_genlist_multi_select_get(self.obj))

    def multi_select_set(self, multi):
        elm_genlist_multi_select_set(self.obj, bool(multi))
    def multi_select_get(self):
        return bool(elm_genlist_multi_select_get(self.obj))

    property mode:
        def __set__(self, mode):
            elm_genlist_mode_set(self.obj, mode)

        def __get__(self):
            return elm_genlist_mode_get(self.obj)

    def mode_set(self, mode):
        elm_genlist_mode_set(self.obj, mode)
    def mode_get(self):
        return elm_genlist_mode_get(self.obj)

    property bounce:
        def __set__(self, value):
            h_bounce, v_bounce = value
            elm_genlist_bounce_set(self.obj, bool(h_bounce), bool(v_bounce))

        def __get__(self):
            cdef Eina_Bool h_bounce, v_bounce
            elm_genlist_bounce_get(self.obj, &h_bounce, &v_bounce)
            return (h_bounce, v_bounce)

    def bounce_set(self, h_bounce, v_bounce):
        elm_genlist_bounce_set(self.obj, bool(h_bounce), bool(v_bounce))
    def bounce_get(self):
        cdef Eina_Bool h_bounce, v_bounce
        elm_genlist_bounce_get(self.obj, &h_bounce, &v_bounce)
        return (h_bounce, v_bounce)

    def item_append(self,
                    GenlistItemClass item_class not None,
                    item_data,
                    GenlistItem parent_item=None,
                    int flags=ELM_GENLIST_ITEM_NONE,
                    func=None):
        """Append a new item (add as last row) to this genlist.

        :param item_class: a valid instance that defines the
            behavior of this row. See :py:class:`GenlistItemClass`.
        :param item_data: some data that defines the model of this
            row. This value will be given to methods of
            ``item_class`` such as
            :py:func:`GenlistItemClass.text_get()`. It will also be
            provided to ``func`` as its last parameter.
        :param parent_item: if this is a tree child, then the
            parent item must be given here, otherwise it may be
            None. The parent must have the flag
            ``ELM_GENLIST_ITEM_SUBITEMS`` set.
        :param flags: defines special behavior of this item:
            - ELM_GENLIST_ITEM_NONE = 0
            - ELM_GENLIST_ITEM_SUBITEMS = 1
            - ELM_GENLIST_ITEM_GROUP = 2
        :param func: if not None, this must be a callable to be
            called back when the item is selected. The function
            signature is:
            ``func(item, obj, item_data)``
            Where ``item`` is the handle, ``obj`` is the Evas object
            that represents this item, and ``item_data`` is the
            value given as parameter to this function.
        """
        cdef GenlistItem ret = GenlistItem()
        cdef Elm_Object_Item *item, *parent
        cdef Evas_Smart_Cb cb

        parent = _object_item_from_python(parent_item) if parent_item is not None else NULL

        if func is None:
            cb = NULL
        elif callable(func):
            cb = _py_elm_genlist_item_func
        else:
            raise TypeError("func is not None or callable")

        ret.params = (item_class, item_data, func)
        item = elm_genlist_item_append( self.obj,
                                        &item_class.obj,
                                        <void*>ret,
                                        parent,
                                        <Elm_Genlist_Item_Type>flags,
                                        cb,
                                        <void*>ret)
        if item != NULL:
            ret._set_obj(item)
            return ret
        else:
            Py_DECREF(ret)
            return None

    def item_prepend(   self,
                        GenlistItemClass item_class not None,
                        item_data,
                        GenlistItem parent_item=None,
                        int flags=ELM_GENLIST_ITEM_NONE,
                        func=None):
        """Prepend a new item (add as first row) to this genlist.

        :param item_class: a valid instance that defines the
            behavior of this row. See :py:class:`GenlistItemClass`.
        :param item_data: some data that defines the model of this
            row. This value will be given to methods of
            ``item_class`` such as
            :py:func:`GenlistItemClass.text_get()`. It will also be
            provided to ``func`` as its last parameter.
        :param parent_item: if this is a tree child, then the
            parent item must be given here, otherwise it may be
            None. The parent must have the flag
            ``ELM_GENLIST_ITEM_SUBITEMS`` set.
        :param flags: defines special behavior of this item:
            - ELM_GENLIST_ITEM_NONE = 0
            - ELM_GENLIST_ITEM_SUBITEMS = 1
            - ELM_GENLIST_ITEM_GROUP = 2
        :param func: if not None, this must be a callable to be
            called back when the item is selected. The function
            signature is:
            ``func(item, obj, item_data)``
            Where ``item`` is the handle, ``obj`` is the Evas object
            that represents this item, and ``item_data`` is the
            value given as parameter to this function.
        """
        cdef GenlistItem ret = GenlistItem()
        cdef Elm_Object_Item *item, *parent
        cdef Evas_Smart_Cb cb

        parent = _object_item_from_python(parent_item) if parent_item is not None else NULL

        if func is None:
            cb = NULL
        elif callable(func):
            cb = _py_elm_genlist_item_func
        else:
            raise TypeError("func is not None or callable")

        ret.params = (item_class, item_data, func)
        item = elm_genlist_item_prepend(self.obj,
                                        &item_class.obj,
                                        <void*>ret,
                                        parent,
                                        <Elm_Genlist_Item_Type>flags,
                                        cb,
                                        <void*>ret)
        if item != NULL:
            ret._set_obj(item)
            return ret
        else:
            Py_DECREF(ret)
            return None

    def item_insert_before( self,
                            GenlistItemClass item_class not None,
                            item_data,
                            #API XXX: parent
                            GenlistItem before_item=None,
                            int flags=ELM_GENLIST_ITEM_NONE,
                            func=None
                            #API XXX: *args, **kwargs
                            ):
        """Insert a new item (row) before another item in this genlist.

        :param item_class: a valid instance that defines the
            behavior of this row. See :py:class:`GenlistItemClass`.
        :param item_data: some data that defines the model of this
            row. This value will be given to methods of
            ``item_class`` such as
            :py:func:`GenlistItemClass.text_get()`. It will also be
            provided to ``func`` as its last parameter.
        :param before_item: a reference item to use, the new item
            will be inserted before it.
        :param flags: defines special behavior of this item:
            - ELM_GENLIST_ITEM_NONE = 0
            - ELM_GENLIST_ITEM_SUBITEMS = 1
            - ELM_GENLIST_ITEM_GROUP = 2
        :param func: if not None, this must be a callable to be
            called back when the item is selected. The function
            signature is:
            ``func(item, obj, item_data)``
            Where ``item`` is the handle, ``obj`` is the Evas object
            that represents this item, and ``item_data`` is the
            value given as parameter to this function.
        """
        cdef GenlistItem ret = GenlistItem()
        cdef Elm_Object_Item *item, *before
        cdef Evas_Smart_Cb cb

        before = _object_item_from_python(before_item)

        if func is None:
            cb = NULL
        elif callable(func):
            cb = _py_elm_genlist_item_func
        else:
            raise TypeError("func is not None or callable")

        ret.params = (item_class, item_data, func)
        item = elm_genlist_item_insert_before(  self.obj,
                                                &item_class.obj,
                                                <void*>ret,
                                                NULL,
                                                before,
                                                <Elm_Genlist_Item_Type>flags, cb,
                                                <void*>ret)
        if item != NULL:
            ret._set_obj(item)
            return ret
        else:
            Py_DECREF(ret)
            return None

    def item_insert_after(  self,
                            GenlistItemClass item_class not None,
                            item_data,
                            #API XXX: parent
                            GenlistItem after_item=None,
                            int flags=ELM_GENLIST_ITEM_NONE,
                            func=None
                            #API XXX: *args, **kwargs
                            ):
        """Insert a new item (row) after another item in this genlist.

        :param item_class: a valid instance that defines the
            behavior of this row. See :py:class:`GenlistItemClass`.
        :param item_data: some data that defines the model of this
            row. This value will be given to methods of
            ``item_class`` such as
            :py:func:`GenlistItemClass.text_get()`. It will also be
            provided to ``func`` as its last parameter.
        :param after_item: a reference item to use, the new item
            will be inserted after it.
        :param flags: defines special behavior of this item:
            - ELM_GENLIST_ITEM_NONE = 0
            - ELM_GENLIST_ITEM_SUBITEMS = 1
            - ELM_GENLIST_ITEM_GROUP = 2
        :param func: if not None, this must be a callable to be
            called back when the item is selected. The function
            signature is:
            ``func(item, obj, item_data)``
            Where ``item`` is the handle, ``obj`` is the Evas object
            that represents this item, and ``item_data`` is the
            value given as parameter to this function.
        """
        cdef GenlistItem ret = GenlistItem()
        cdef Elm_Object_Item *item, *after
        cdef Evas_Smart_Cb cb

        after = _object_item_from_python(after_item)

        if func is None:
            cb = NULL
        elif callable(func):
            cb = _py_elm_genlist_item_func
        else:
            raise TypeError("func is not None or callable")

        ret.params = (item_class, item_data, func)
        item = elm_genlist_item_insert_after(self.obj, &item_class.obj,
                                             <void*>ret,
                                             NULL,
                                             after,
                                             <Elm_Genlist_Item_Type>flags, cb,
                                             <void*>ret)
        if item != NULL:
            ret._set_obj(item)
            return ret
        else:
            Py_DECREF(ret)
            return None

    #Elm_Object_Item         *elm_genlist_item_sorted_insert(self.obj, Elm_Genlist_Item_Class *itc, void *data, Elm_Object_Item *parent, Elm_Genlist_Item_Type flags, Eina_Compare_Cb comp, Evas_Smart_Cb func, void *func_data)

    property selected_item:
        def __get__(self):
            return _object_item_to_python(elm_genlist_selected_item_get(self.obj))

    def selected_item_get(self):
        return _object_item_to_python(elm_genlist_selected_item_get(self.obj))

    property selected_items:
        def __get__(self):
            return _object_item_list_to_python(elm_genlist_selected_items_get(self.obj))

    def selected_items_get(self):
        return _object_item_list_to_python(elm_genlist_selected_items_get(self.obj))

    property realized_items:
        def __get__(self):
            return _object_item_list_to_python(elm_genlist_realized_items_get(self.obj))

    def realized_items_get(self):
        return _object_item_list_to_python(elm_genlist_realized_items_get(self.obj))

    property first_item:
        def __get__(self):
            return _object_item_to_python(elm_genlist_first_item_get(self.obj))

    def first_item_get(self):
        return _object_item_to_python(elm_genlist_first_item_get(self.obj))

    property last_item:
        def __get__(self):
            return _object_item_to_python(elm_genlist_last_item_get(self.obj))

    def last_item_get(self):
        return _object_item_to_python(elm_genlist_last_item_get(self.obj))

    property scroller_policy:
        def __set__(self, value):
            policy_h, policy_v = value
            elm_genlist_scroller_policy_set(self.obj, policy_h, policy_v)

        def __get__(self):
            cdef Elm_Scroller_Policy policy_h, policy_v
            elm_genlist_scroller_policy_get(self.obj, &policy_h, &policy_v)
            return (policy_h, policy_v)

    def scroller_policy_set(self, policy_h, policy_v):
        elm_genlist_scroller_policy_set(self.obj, policy_h, policy_v)
    def scroller_policy_get(self):
        cdef Elm_Scroller_Policy policy_h, policy_v
        elm_genlist_scroller_policy_get(self.obj, &policy_h, &policy_v)
        return (policy_h, policy_v)

    def realized_items_update(self):
        elm_genlist_realized_items_update(self.obj)

    property items_count:
        def __get__(self):
            return elm_genlist_items_count(self.obj)

    property homogeneous:
        def __set__(self, homogeneous):
            elm_genlist_homogeneous_set(self.obj, bool(homogeneous))

        def __get__(self):
            return bool(elm_genlist_homogeneous_get(self.obj))

    def homogeneous_set(self, homogeneous):
        elm_genlist_homogeneous_set(self.obj, bool(homogeneous))
    def homogeneous_get(self):
        return bool(elm_genlist_homogeneous_get(self.obj))

    property block_count:
        def __set__(self, int n):
            elm_genlist_block_count_set(self.obj, n)

        def __get__(self):
            return elm_genlist_block_count_get(self.obj)

    def block_count_set(self, int n):
        elm_genlist_block_count_set(self.obj, n)
    def block_count_get(self):
        return elm_genlist_block_count_get(self.obj)

    property longpress_timeout:
        def __set__(self, timeout):
            elm_genlist_longpress_timeout_set(self.obj, timeout)

        def __get__(self):
            return elm_genlist_longpress_timeout_get(self.obj)

    def longpress_timeout_set(self, timeout):
        elm_genlist_longpress_timeout_set(self.obj, timeout)
    def longpress_timeout_get(self):
        return elm_genlist_longpress_timeout_get(self.obj)

    def at_xy_item_get(self, int x, int y):
        return _object_item_to_python(elm_genlist_at_xy_item_get(self.obj, x, y, NULL))

    property decorated_item:
        def __get__(self):
            return _object_item_to_python(elm_genlist_decorated_item_get(self.obj))

    def decorated_item_get(self):
        return _object_item_to_python(elm_genlist_decorated_item_get(self.obj))

    property reorder_mode:
        def __set__(self, reorder_mode):
            elm_genlist_reorder_mode_set(self.obj, reorder_mode)

        def __get__(self):
            return bool(elm_genlist_reorder_mode_get(self.obj))

    def reorder_mode_set(self, reorder_mode):
        elm_genlist_reorder_mode_set(self.obj, reorder_mode)
    def reorder_mode_get(self):
        return bool(elm_genlist_reorder_mode_get(self.obj))

    property decorate_mode:
        def __set__(self, decorated):
            elm_genlist_decorate_mode_set(self.obj, decorated)

        def __get__(self):
            return bool(elm_genlist_decorate_mode_get(self.obj))

    def decorate_mode_set(self, decorated):
        elm_genlist_decorate_mode_set(self.obj, decorated)
    def decorate_mode_get(self):
        return bool(elm_genlist_decorate_mode_get(self.obj))

    property tree_effect_enabled:
        def __set__(self, enabled):
            elm_genlist_tree_effect_enabled_set(self.obj, enabled)

        def __get__(self):
            return bool(elm_genlist_tree_effect_enabled_get(self.obj))

    def tree_effect_enabled_set(self, enabled):
        elm_genlist_tree_effect_enabled_set(self.obj, enabled)
    def tree_effect_enabled_get(self):
        return bool(elm_genlist_tree_effect_enabled_get(self.obj))

    property highlight_mode:
        def __set__(self, highlight):
            elm_genlist_highlight_mode_set(self.obj, highlight)

        def __get__(self):
            return bool(elm_genlist_highlight_mode_get(self.obj))

    def highlight_mode_set(self, highlight):
        elm_genlist_highlight_mode_set(self.obj, highlight)
    def highlight_mode_get(self):
        return bool(elm_genlist_highlight_mode_get(self.obj))

    property select_mode:
        def __set__(self, mode):
            elm_genlist_select_mode_set(self.obj, mode)

        def __get__(self):
            return elm_genlist_select_mode_get(self.obj)

    def select_mode_set(self, mode):
        elm_genlist_select_mode_set(self.obj, mode)
    def select_mode_get(self):
        return elm_genlist_select_mode_get(self.obj)

    def callback_activated_add(self, func, *args, **kwargs):
        self._callback_add_full("activated", _cb_object_item_conv,
                                func, *args, **kwargs)

    def callback_activated_del(self, func):
        self._callback_del_full("activated",  _cb_object_item_conv, func)

    def callback_clicked_double_add(self, func, *args, **kwargs):
        self._callback_add_full("clicked,double", _cb_object_item_conv,
                                func, *args, **kwargs)

    def callback_clicked_double_del(self, func):
        self._callback_del_full("clicked,double",  _cb_object_item_conv, func)

    def callback_selected_add(self, func, *args, **kwargs):
        self._callback_add_full("selected", _cb_object_item_conv,
                                func, *args, **kwargs)

    def callback_selected_del(self, func):
        self._callback_del_full("selected", _cb_object_item_conv, func)

    def callback_unselected_add(self, func, *args, **kwargs):
        self._callback_add_full("unselected", _cb_object_item_conv,
                                func, *args, **kwargs)

    def callback_unselected_del(self, func):
        self._callback_del_full("unselected",  _cb_object_item_conv, func)

    def callback_expanded_add(self, func, *args, **kwargs):
        self._callback_add_full("expanded", _cb_object_item_conv,
                                func, *args, **kwargs)

    def callback_expanded_del(self, func):
        self._callback_del_full("expanded",  _cb_object_item_conv, func)

    def callback_contracted_add(self, func, *args, **kwargs):
        self._callback_add_full("contracted", _cb_object_item_conv,
                                func, *args, **kwargs)

    def callback_contracted_del(self, func):
        self._callback_del_full("contracted",  _cb_object_item_conv, func)

    def callback_expand_request_add(self, func, *args, **kwargs):
        self._callback_add_full("expand,request", _cb_object_item_conv,
                                func, *args, **kwargs)

    def callback_expand_request_del(self, func):
        self._callback_del_full("expand,request",  _cb_object_item_conv, func)

    def callback_contract_request_add(self, func, *args, **kwargs):
        self._callback_add_full("contract,request", _cb_object_item_conv,
                                func, *args, **kwargs)

    def callback_contract_request_del(self, func):
        self._callback_del_full("contract,request",  _cb_object_item_conv, func)

    def callback_realized_add(self, func, *args, **kwargs):
        self._callback_add_full("realized", _cb_object_item_conv,
                                func, *args, **kwargs)

    def callback_realized_del(self, func):
        self._callback_del_full("realized",  _cb_object_item_conv, func)

    def callback_unrealized_add(self, func, *args, **kwargs):
        self._callback_add_full("unrealized", _cb_object_item_conv,
                                func, *args, **kwargs)

    def callback_unrealized_del(self, func):
        self._callback_del_full("unrealized",  _cb_object_item_conv, func)

    def callback_drag_start_up_add(self, func, *args, **kwargs):
        self._callback_add_full("drag,start,up", _cb_object_item_conv,
                                func, *args, **kwargs)

    def callback_drag_start_up_del(self, func):
        self._callback_del_full("drag,start,up",  _cb_object_item_conv, func)

    def callback_drag_start_down_add(self, func, *args, **kwargs):
        self._callback_add_full("drag,start,down", _cb_object_item_conv,
                                func, *args, **kwargs)

    def callback_drag_start_down_del(self, func):
        self._callback_del_full("drag,start,down",  _cb_object_item_conv, func)

    def callback_drag_start_left_add(self, func, *args, **kwargs):
        self._callback_add_full("drag,start,left", _cb_object_item_conv,
                                func, *args, **kwargs)

    def callback_drag_start_left_del(self, func):
        self._callback_del_full("drag,start,left",  _cb_object_item_conv, func)

    def callback_drag_start_right_add(self, func, *args, **kwargs):
        self._callback_add_full("drag,start,right", _cb_object_item_conv,
                                func, *args, **kwargs)

    def callback_drag_start_right_del(self, func):
        self._callback_del_full("drag,start,right",  _cb_object_item_conv, func)

    def callback_drag_stop_add(self, func, *args, **kwargs):
        self._callback_add_full("drag,stop", _cb_object_item_conv,
                                func, *args, **kwargs)

    def callback_drag_stop_del(self, func):
        self._callback_del_full("drag,stop",  _cb_object_item_conv, func)

    def callback_drag_add(self, func, *args, **kwargs):
        self._callback_add_full("drag", _cb_object_item_conv,
                                func, *args, **kwargs)

    def callback_drag_del(self, func):
        self._callback_del_full("drag",  _cb_object_item_conv, func)

    def callback_longpressed_add(self, func, *args, **kwargs):
        self._callback_add_full("longpressed", _cb_object_item_conv,
                                func, *args, **kwargs)

    def callback_longpressed_del(self, func):
        self._callback_del_full("longpressed", _cb_object_item_conv, func)

    def callback_scroll_anim_start_add(self, func, *args, **kwargs):
        self._callback_add("scroll,anim,start", func, *args, **kwargs)

    def callback_scroll_anim_start_del(self, func):
        self._callback_del("scroll,anim,start", func)

    def callback_scroll_anim_stop_add(self, func, *args, **kwargs):
        self._callback_add("scroll,anim,stop", func, *args, **kwargs)

    def callback_scroll_anim_stop_del(self, func):
        self._callback_del("scroll,anim,stop", func)

    def callback_scroll_drag_start_add(self, func, *args, **kwargs):
        self._callback_add("scroll,drag,start", func, *args, **kwargs)

    def callback_scroll_drag_start_del(self, func):
        self._callback_del("scroll,drag,start", func)

    def callback_scroll_drag_stop_add(self, func, *args, **kwargs):
        self._callback_add("scroll,drag,stop", func, *args, **kwargs)

    def callback_scroll_drag_stop_del(self, func):
        self._callback_del("scroll,drag,stop", func)

    def callback_edge_top_add(self, func, *args, **kwargs):
        self._callback_add("edge,top", func, *args, **kwargs)

    def callback_edge_top_del(self, func):
        self._callback_del("edge,top", func)

    def callback_edge_bottom_add(self, func, *args, **kwargs):
        self._callback_add("edge,bottom", func, *args, **kwargs)

    def callback_edge_bottom_del(self, func):
        self._callback_del("edge,bottom", func)

    def callback_edge_left_add(self, func, *args, **kwargs):
        self._callback_add("edge,left", func, *args, **kwargs)

    def callback_edge_left_del(self, func):
        self._callback_del("edge,left", func)

    def callback_edge_right_add(self, func, *args, **kwargs):
        self._callback_add("edge,right", func, *args, **kwargs)

    def callback_edge_right_del(self, func):
        self._callback_del("edge,right", func)

    def callback_multi_swipe_left_add(self, func, *args, **kwargs):
        self._callback_add("multi,swipe,left", func, *args, **kwargs)

    def callback_multi_swipe_left_del(self, func):
        self._callback_del("multi,swipe,left", func)

    def callback_multi_swipe_right_add(self, func, *args, **kwargs):
        self._callback_add("multi,swipe,right", func, *args, **kwargs)

    def callback_multi_swipe_right_del(self, func):
        self._callback_del("multi,swipe,right", func)

    def callback_multi_swipe_up_add(self, func, *args, **kwargs):
        self._callback_add("multi,swipe,up", func, *args, **kwargs)

    def callback_multi_swipe_up_del(self, func):
        self._callback_del("multi,swipe,up", func)

    def callback_multi_swipe_down_add(self, func, *args, **kwargs):
        self._callback_add("multi,swipe,down", func, *args, **kwargs)

    def callback_multi_swipe_down_del(self, func):
        self._callback_del("multi,swipe,down", func)

    def callback_multi_pinch_out_add(self, func, *args, **kwargs):
        self._callback_add("multi,pinch,out", func, *args, **kwargs)

    def callback_multi_pinch_out_del(self, func):
        self._callback_del("multi,pinch,out", func)

    def callback_multi_pinch_in_add(self, func, *args, **kwargs):
        self._callback_add("multi,pinch,in", func, *args, **kwargs)

    def callback_multi_pinch_in_del(self, func):
        self._callback_del("multi,pinch,in", func)

    def callback_swipe_add(self, func, *args, **kwargs):
        self._callback_add("swipe", func, *args, **kwargs)

    def callback_swipe_del(self, func):
        self._callback_del("swipe", func)

    def callback_moved_add(self, func, *args, **kwargs):
        self._callback_add_full("moved", _cb_object_item_conv,
                                func, *args, **kwargs)

    def callback_moved_del(self, func):
        self._callback_del_full("moved",  _cb_object_item_conv, func)

    def callback_moved_after_add(self, func, *args, **kwargs):
        self._callback_add_full("moved,after", _cb_object_item_conv,
                                func, *args, **kwargs)

    def callback_moved_after_del(self, func):
        self._callback_del_full("moved,after",  _cb_object_item_conv, func)

    def callback_moved_before_add(self, func, *args, **kwargs):
        self._callback_add_full("moved,before", _cb_object_item_conv,
                                func, *args, **kwargs)

    def callback_moved_before_del(self, func):
        self._callback_del_full("moved,before",  _cb_object_item_conv, func)

    def callback_language_changed_add(self, func, *args, **kwargs):
        self._callback_add("language,changed", func, *args, **kwargs)

    def callback_language_changed_del(self, func):
        self._callback_del("language,changed", func)

    def callback_tree_effect_finished_add(self, func, *args, **kwargs):
        self._callback_add("tree,effect,finished", func, *args, **kwargs)

    def callback_tree_effect_finished_del(self, func):
        self._callback_del("tree,effect,finished", func)

_elm_widget_type_register("genlist", Genlist)

_install_metaclass(Genlist)
