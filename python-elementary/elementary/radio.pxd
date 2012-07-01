from evas.object cimport Evas_Object
from layout_class cimport LayoutClass
from object cimport Object

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    # Radio                 (api:DONE  cb:DONE  test:DONE  doc:DONE)
    Evas_Object             *elm_radio_add(Evas_Object *parent)
    void                     elm_radio_group_add(Evas_Object *obj, Evas_Object *group)
    void                     elm_radio_state_value_set(Evas_Object *obj, int value)
    int                      elm_radio_state_value_get(Evas_Object *obj)
    void                     elm_radio_value_set(Evas_Object *obj, int value)
    int                      elm_radio_value_get(Evas_Object *obj)
    void                     elm_radio_value_pointer_set(Evas_Object *obj, int *valuep)
    Evas_Object             *elm_radio_selected_object_get(Evas_Object *obj)

