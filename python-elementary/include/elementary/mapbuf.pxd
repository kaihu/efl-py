from evas.c_evas cimport Eina_Bool
from evas.c_evas cimport Evas_Object, const_Evas_Object
from object cimport Object

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    # Mapbuf                (api:DONE  cb:N/A  test:DONE  doc:DONE  py3:N/A)
    Evas_Object             *elm_mapbuf_add(Evas_Object *parent)
    void                     elm_mapbuf_enabled_set(Evas_Object *obj, Eina_Bool enabled)
    Eina_Bool                elm_mapbuf_enabled_get(const_Evas_Object *obj)
    void                     elm_mapbuf_smooth_set(Evas_Object *obj, Eina_Bool smooth)
    Eina_Bool                elm_mapbuf_smooth_get(const_Evas_Object *obj)
    void                     elm_mapbuf_alpha_set(Evas_Object *obj, Eina_Bool alpha)
    Eina_Bool                elm_mapbuf_alpha_get(const_Evas_Object *obj)

