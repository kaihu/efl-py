from evas.general cimport Eina_Bool, Eina_List, Eina_Compare_Cb
from evas.object cimport Evas_Object, Evas_Smart_Cb
from object cimport Object, Elm_Object_Select_Mode
from scroller cimport Elm_Scroller_Policy
from object_item cimport Elm_Object_Item, ObjectItem

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    ctypedef enum Elm_List_Mode:
        ELM_LIST_COMPRESS
        ELM_LIST_SCROLL
        ELM_LIST_LIMIT
        ELM_LIST_EXPAND

    # List                  (api:TODO  cb:DONE  test:DONE  doc:DONE  py3:DONE)
    Evas_Object             *elm_list_add(Evas_Object *parent)
    void                     elm_list_go(Evas_Object *obj)
    void                     elm_list_multi_select_set(Evas_Object *obj, Eina_Bool multi)
    Eina_Bool                elm_list_multi_select_get(Evas_Object *obj)
    void                     elm_list_mode_set(Evas_Object *obj, Elm_List_Mode mode)
    Elm_List_Mode            elm_list_mode_get(Evas_Object *obj)
    void                     elm_list_horizontal_set(Evas_Object *obj, Eina_Bool horizontal)
    Eina_Bool                elm_list_horizontal_get(Evas_Object *obj)
    void                     elm_list_select_mode_set(Evas_Object *obj, Elm_Object_Select_Mode mode)
    Elm_Object_Select_Mode   elm_list_select_mode_get(Evas_Object *obj)
    void                     elm_list_bounce_set(Evas_Object *obj, Eina_Bool h_bounce, Eina_Bool v_bounce)
    void                     elm_list_bounce_get(Evas_Object *obj, Eina_Bool *h_bounce, Eina_Bool *v_bounce)
    void                     elm_list_scroller_policy_set(Evas_Object *obj, Elm_Scroller_Policy policy_h, Elm_Scroller_Policy policy_v)
    void                     elm_list_scroller_policy_get(Evas_Object *obj, Elm_Scroller_Policy *policy_h, Elm_Scroller_Policy *policy_v)
    Elm_Object_Item         *elm_list_item_append(Evas_Object *obj, const_char_ptr label, Evas_Object *icon, Evas_Object *end, Evas_Smart_Cb func, void *data)
    Elm_Object_Item         *elm_list_item_prepend(Evas_Object *obj, const_char_ptr label, Evas_Object *icon, Evas_Object *end, Evas_Smart_Cb func, void *data)
    Elm_Object_Item         *elm_list_item_insert_before(Evas_Object *obj, Elm_Object_Item *before, const_char_ptr label, Evas_Object *icon, Evas_Object *end, Evas_Smart_Cb func, void *data)
    Elm_Object_Item         *elm_list_item_insert_after(Evas_Object *obj, Elm_Object_Item *after, const_char_ptr label, Evas_Object *icon, Evas_Object *end, Evas_Smart_Cb func, void *data)
    Elm_Object_Item         *elm_list_item_sorted_insert(Evas_Object *obj, const_char_ptr label, Evas_Object *icon, Evas_Object *end, Evas_Smart_Cb func, void *data, Eina_Compare_Cb cmp_func)
    void                     elm_list_clear(Evas_Object *obj)
    Eina_List               *elm_list_items_get(Evas_Object *obj)
    Elm_Object_Item         *elm_list_selected_item_get(Evas_Object *obj)
    Eina_List               *elm_list_selected_items_get(Evas_Object *obj)
    void                     elm_list_item_selected_set(Elm_Object_Item *item, Eina_Bool selected)
    Eina_Bool                elm_list_item_selected_get(Elm_Object_Item *item)
    void                     elm_list_item_separator_set(Elm_Object_Item *it, Eina_Bool setting)
    Eina_Bool                elm_list_item_separator_get(Elm_Object_Item *it)
    void                     elm_list_item_show(Elm_Object_Item *item)
    void                     elm_list_item_bring_in(Elm_Object_Item *it)
    Evas_Object             *elm_list_item_object_get(Elm_Object_Item *item)
    Elm_Object_Item         *elm_list_item_prev(Elm_Object_Item *it)
    Elm_Object_Item         *elm_list_item_next(Elm_Object_Item *it)
    Elm_Object_Item         *elm_list_first_item_get(Evas_Object *obj)
    Elm_Object_Item         *elm_list_last_item_get(Evas_Object *obj)

