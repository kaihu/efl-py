from evas.object cimport Evas_Object
from layout_class cimport LayoutClass
from object cimport Object

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    # Conformant            (api:DONE  cb:N/A   test:TODO  doc:DONE)
    Evas_Object             *elm_conformant_add(Evas_Object *parent)

