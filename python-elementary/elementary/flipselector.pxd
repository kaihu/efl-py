from evas.general cimport Eina_Bool
from evas.object cimport Evas_Object, Evas_Coord, Eina_List
from evas.object_smart cimport Evas_Smart_Cb
from object cimport Object
from object_item cimport ObjectItem

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"
    ctypedef Evas_Object const_Evas_Object "const Evas_Object"
    ctypedef Eina_List const_Eina_List "const Eina_List"

cdef extern from "Elementary.h":
    ctypedef struct Elm_Object_Item
    ctypedef Elm_Object_Item const_Elm_Object_Item "const Elm_Object_Item"

    # Flipselector          (api:DONE  cb:DONE  test:DONE  doc:DONE  py3:DONE)
    Evas_Object             *elm_flipselector_add(Evas_Object *parent)
    void                     elm_flipselector_flip_next(Evas_Object *obj)
    void                     elm_flipselector_flip_prev(Evas_Object *obj)
    Elm_Object_Item         *elm_flipselector_item_append(Evas_Object *obj, const_char_ptr label, Evas_Smart_Cb func, void *data)
    Elm_Object_Item         *elm_flipselector_item_prepend(Evas_Object *obj, const_char_ptr label, Evas_Smart_Cb func, void *data)
    const_Eina_List         *elm_flipselector_items_get(const_Evas_Object *obj)
    Elm_Object_Item         *elm_flipselector_first_item_get(const_Evas_Object *obj)
    Elm_Object_Item         *elm_flipselector_last_item_get(const_Evas_Object *obj)
    Elm_Object_Item         *elm_flipselector_selected_item_get(const_Evas_Object *obj)
    void                     elm_flipselector_item_selected_set(Elm_Object_Item *it, Eina_Bool selected)
    Eina_Bool                elm_flipselector_item_selected_get(const_Elm_Object_Item *it)
    Elm_Object_Item         *elm_flipselector_item_prev_get(const_Elm_Object_Item *it)
    Elm_Object_Item         *elm_flipselector_item_next_get(const_Elm_Object_Item *it)
    void                     elm_flipselector_first_interval_set(Evas_Object *obj, double interval)
    double                   elm_flipselector_first_interval_get(const_Evas_Object *obj)

