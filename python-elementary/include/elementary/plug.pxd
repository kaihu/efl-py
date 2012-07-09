from evas.general cimport Eina_Bool
from evas.object cimport Evas_Object
from object cimport Object

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    # Plug                  (api:DONE  cb:N/A   test:TODO  doc:DONE  py3:DONE)
    Evas_Object             *elm_plug_add(Evas_Object *parent)
    Eina_Bool                elm_plug_connect(Evas_Object *obj, const_char_ptr svcname, int svcnum, Eina_Bool svcsys)
    Evas_Object             *elm_plug_image_object_get(Evas_Object *obj)

