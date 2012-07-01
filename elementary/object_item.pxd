from evas.general cimport Eina_Bool, const_Eina_List
from evas.object cimport Evas_Object, Evas_Smart_Cb

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    ctypedef struct Elm_Object_Item
    ctypedef Elm_Object_Item const_Elm_Object_Item "const Elm_Object_Item"

    #tooltip
    ctypedef Evas_Object    *(*Elm_Tooltip_Content_Cb)      (void *data, Evas_Object *obj, Evas_Object *tooltip)
    ctypedef Evas_Object    *(*Elm_Tooltip_Item_Content_Cb) (void *data, Evas_Object *obj, Evas_Object *tooltip, void *item)

    # Object Item           (py3: DONE)
    Evas_Object             *elm_object_item_widget_get(Elm_Object_Item *it)
    void                     elm_object_item_part_content_set(Elm_Object_Item *it, const_char_ptr part, Evas_Object* content)
    void                     elm_object_item_content_set(Elm_Object_Item *it, Evas_Object* content)
    Evas_Object             *elm_object_item_part_content_get(Elm_Object_Item *it, const_char_ptr part)
    Evas_Object             *elm_object_item_content_get(Elm_Object_Item *it)
    Evas_Object             *elm_object_item_part_content_unset(Elm_Object_Item *it, const_char_ptr part)
    Evas_Object             *elm_object_item_content_unset(Elm_Object_Item *it)
    void                     elm_object_item_part_text_set(Elm_Object_Item *item, const_char_ptr part, const_char_ptr label)
    void                     elm_object_item_text_set(Elm_Object_Item *item, const_char_ptr label)
    const_char_ptr           elm_object_item_part_text_get(Elm_Object_Item *item, const_char_ptr part)
    const_char_ptr           elm_object_item_text_get(Elm_Object_Item *item)
    void                     elm_object_item_access_info_set(Elm_Object_Item *it, const_char_ptr txt)
    void                    *elm_object_item_data_get(Elm_Object_Item *item)
    void                     elm_object_item_data_set(Elm_Object_Item *item, void *data)
    void                     elm_object_item_signal_emit(Elm_Object_Item *it, const_char_ptr emission, const_char_ptr source)
    void                     elm_object_item_disabled_set(Elm_Object_Item *it, Eina_Bool disabled)
    Eina_Bool                elm_object_item_disabled_get(Elm_Object_Item *it)
    void                     elm_object_item_del_cb_set(Elm_Object_Item *it, Evas_Smart_Cb del_cb)
    void                     elm_object_item_del(Elm_Object_Item *item)
    void                     elm_object_item_tooltip_text_set(Elm_Object_Item *it, const_char_ptr text)
    Eina_Bool                elm_object_item_tooltip_window_mode_set(Elm_Object_Item *it, Eina_Bool disable)
    Eina_Bool                elm_object_item_tooltip_window_mode_get(Elm_Object_Item *it)
    void                     elm_object_item_tooltip_content_cb_set(Elm_Object_Item *it, Elm_Tooltip_Item_Content_Cb func, void *data, Evas_Smart_Cb del_cb)
    void                     elm_object_item_tooltip_unset(Elm_Object_Item *it)
    void                     elm_object_item_tooltip_style_set(Elm_Object_Item *it, const_char_ptr style)
    const_char_ptr           elm_object_item_tooltip_style_get(Elm_Object_Item *it)
    void                     elm_object_item_cursor_set(Elm_Object_Item *it, const_char_ptr cursor)
    const_char_ptr           elm_object_item_cursor_get(Elm_Object_Item *it)
    void                     elm_object_item_cursor_unset(Elm_Object_Item *it)
    void                     elm_object_item_cursor_style_set(Elm_Object_Item *it, const_char_ptr style)
    const_char_ptr           elm_object_item_cursor_style_get(Elm_Object_Item *it)
    void                     elm_object_item_cursor_engine_only_set(Elm_Object_Item *it, Eina_Bool engine_only)
    Eina_Bool                elm_object_item_cursor_engine_only_get(Elm_Object_Item *it)

cdef _object_item_to_python(Elm_Object_Item *it)
cdef Elm_Object_Item * _object_item_from_python(ObjectItem item) except NULL
cdef _object_item_list_to_python(const_Eina_List *lst)
cdef void _object_item_del_cb(void *data, Evas_Object *o, void *event_info) with gil
cdef void _object_item_callback(void *data, Evas_Object *obj, void *event_info) with gil

cdef class ObjectItem(object):
    cdef Elm_Object_Item *item
    cdef object params
    cdef int _set_obj(self, Elm_Object_Item *item) except 0
