from evas.general cimport Eina_Bool
from evas.object cimport Evas_Object
from layout_class cimport LayoutClass
from object cimport Object
from object_item cimport Elm_Object_Item, ObjectItem

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    # SegmentControl        (api:DONE  cb:DONE  test:TODO  doc:DONE  py3:DONE)
    Evas_Object             *elm_segment_control_add(Evas_Object *parent)
    Elm_Object_Item         *elm_segment_control_item_add(Evas_Object *obj, Evas_Object *icon, const_char_ptr label)
    Elm_Object_Item         *elm_segment_control_item_insert_at(Evas_Object *obj, Evas_Object *icon, const_char_ptr label, int index)
    void                     elm_segment_control_item_del_at(Evas_Object *obj, int index)
    int                      elm_segment_control_item_count_get(Evas_Object *obj)
    Elm_Object_Item         *elm_segment_control_item_get(Evas_Object *obj, int index)
    const_char_ptr           elm_segment_control_item_label_get(Evas_Object *obj, int index)
    Evas_Object             *elm_segment_control_item_icon_get(Evas_Object *obj, int index)
    int                      elm_segment_control_item_index_get(Elm_Object_Item *it)
    Evas_Object             *elm_segment_control_item_object_get(Elm_Object_Item *it)
    Elm_Object_Item         *elm_segment_control_item_selected_get(Evas_Object *obj)
    void                     elm_segment_control_item_selected_set(Elm_Object_Item *it, Eina_Bool select)

