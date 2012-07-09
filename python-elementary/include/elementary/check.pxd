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

    # Check                 (api:DONE  cb:DONE  test:DONE  doc:DONE)
    Evas_Object             *elm_check_add(Evas_Object *parent)
    void                     elm_check_state_set(Evas_Object *obj, Eina_Bool state)
    Eina_Bool                elm_check_state_get(Evas_Object *obj)

