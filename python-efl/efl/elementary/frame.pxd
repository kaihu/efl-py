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

    # Frame                 (api:DONE  cb:DONE  test:TODO  doc:DONE)
    Evas_Object             *elm_frame_add(Evas_Object *parent)
    void                     elm_frame_autocollapse_set(Evas_Object *obj, Eina_Bool autocollapse)
    Eina_Bool                elm_frame_autocollapse_get(Evas_Object *obj)
    void                     elm_frame_collapse_set(Evas_Object *obj, Eina_Bool collapse)
    Eina_Bool                elm_frame_collapse_get(Evas_Object *obj)
    void                     elm_frame_collapse_go(Evas_Object *obj, Eina_Bool collapse)

