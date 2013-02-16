from evas.general cimport Eina_Bool, const_Eina_List
from evas.object cimport Evas_Object, const_Evas_Object, Evas_Smart_Cb
from object cimport Object
from object_item cimport Elm_Object_Item, const_Elm_Object_Item, ObjectItem

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    # Multibuttonentry      (api:DONE  cb:DONE  test:DONE  doc:TODO  py3:TODO)
    ctypedef Eina_Bool (*Elm_Multibuttonentry_Item_Filter_Cb)(Evas_Object *obj, const_char_ptr item_label, void *item_data, void *data)

    Evas_Object             *elm_multibuttonentry_add(Evas_Object *parent)
    Evas_Object             *elm_multibuttonentry_entry_get(const_Evas_Object *obj)
    Eina_Bool                elm_multibuttonentry_expanded_get(const_Evas_Object *obj)
    void                     elm_multibuttonentry_expanded_set(Evas_Object *obj, Eina_Bool expanded)
    Elm_Object_Item         *elm_multibuttonentry_item_prepend(Evas_Object *obj, const_char_ptr label, Evas_Smart_Cb func, void *data)
    Elm_Object_Item         *elm_multibuttonentry_item_append(Evas_Object *obj, const_char_ptr label, Evas_Smart_Cb func, void *data)
    Elm_Object_Item         *elm_multibuttonentry_item_insert_before(Evas_Object *obj, Elm_Object_Item *before, const_char_ptr label, Evas_Smart_Cb func, void *data)
    Elm_Object_Item         *elm_multibuttonentry_item_insert_after(Evas_Object *obj, Elm_Object_Item *after, const_char_ptr label, Evas_Smart_Cb func, void *data)
    const_Eina_List         *elm_multibuttonentry_items_get(const_Evas_Object *obj)
    Elm_Object_Item         *elm_multibuttonentry_first_item_get(const_Evas_Object *obj)
    Elm_Object_Item         *elm_multibuttonentry_last_item_get(const_Evas_Object *obj)
    Elm_Object_Item         *elm_multibuttonentry_selected_item_get(const_Evas_Object *obj)
    void                     elm_multibuttonentry_item_selected_set(Elm_Object_Item *it, Eina_Bool selected)
    Eina_Bool                elm_multibuttonentry_item_selected_get(const_Elm_Object_Item *it)
    void                     elm_multibuttonentry_clear(Evas_Object *obj)
    Elm_Object_Item         *elm_multibuttonentry_item_prev_get(const_Elm_Object_Item *it)
    Elm_Object_Item         *elm_multibuttonentry_item_next_get(const_Elm_Object_Item *it)
    void                     elm_multibuttonentry_item_filter_append(Evas_Object *obj, Elm_Multibuttonentry_Item_Filter_Cb func, void *data)
    void                     elm_multibuttonentry_item_filter_prepend(Evas_Object *obj, Elm_Multibuttonentry_Item_Filter_Cb func, void *data)
    void                     elm_multibuttonentry_item_filter_remove(Evas_Object *obj, Elm_Multibuttonentry_Item_Filter_Cb func, void *data)

