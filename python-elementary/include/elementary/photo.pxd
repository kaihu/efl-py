from evas.c_evas cimport Eina_Bool
from evas.c_evas cimport Evas_Object
from object cimport Object

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    # Photo                 (api:DONE  cb:DONE  test:TODO  doc:DONE  py3:DONE)
    Evas_Object             *elm_photo_add(Evas_Object *parent)
    Eina_Bool                elm_photo_file_set(Evas_Object *obj, const_char_ptr file)
    void                     elm_photo_thumb_set(Evas_Object *obj, const_char_ptr file, const_char_ptr group)
    void                     elm_photo_size_set(Evas_Object *obj, int size)
    void                     elm_photo_fill_inside_set(Evas_Object *obj, Eina_Bool fill)
    void                     elm_photo_editable_set(Evas_Object *obj, Eina_Bool editable)
    void                     elm_photo_aspect_fixed_set(Evas_Object *obj, Eina_Bool fixed)
    Eina_Bool                elm_photo_aspect_fixed_get(Evas_Object *obj)

