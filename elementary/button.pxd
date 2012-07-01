from evas.general cimport Eina_Bool
from evas.object cimport Evas_Object
from layout_class cimport LayoutClass
from object cimport Object

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    # Button                (api:DONE  cb:DONE  test:DONE  doc:DONE)
    Evas_Object             *elm_button_add(Evas_Object *parent)
    void                     elm_button_autorepeat_set(Evas_Object *obj, Eina_Bool on)
    Eina_Bool                elm_button_autorepeat_get(Evas_Object *obj)
    void                     elm_button_autorepeat_initial_timeout_set(Evas_Object *obj, double t)
    double                   elm_button_autorepeat_initial_timeout_get(Evas_Object *obj)
    void                     elm_button_autorepeat_gap_timeout_set(Evas_Object *obj, double t)
    double                   elm_button_autorepeat_gap_timeout_get(Evas_Object *obj)

cdef class Button(LayoutClass):
    pass
