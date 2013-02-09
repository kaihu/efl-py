from evas.c_evas cimport Eina_Bool
from evas.c_evas cimport Evas_Object
from layout_class cimport LayoutClass
from object cimport Object

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    # Separator             (api:DONE  cb:N/A   test:DONE  doc:DONE)
    Evas_Object             *elm_separator_add(Evas_Object *parent)
    void                     elm_separator_horizontal_set(Evas_Object *obj, Eina_Bool)
    Eina_Bool                elm_separator_horizontal_get(Evas_Object *obj)

