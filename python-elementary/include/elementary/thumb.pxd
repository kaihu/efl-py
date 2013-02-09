from evas.c_evas cimport Eina_Bool
from evas.c_evas cimport Evas_Object
from object cimport Object

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    ctypedef enum Elm_Thumb_Animation_Setting:
        ELM_THUMB_ANIMATION_START
        ELM_THUMB_ANIMATION_LOOP
        ELM_THUMB_ANIMATION_STOP
        ELM_THUMB_ANIMATION_LAST

    # Thumb                 (api:DONE  cb:DONE  test:DONE  doc:DONE  py3:DONE)
    Evas_Object             *elm_thumb_add(Evas_Object *parent)
    void                     elm_thumb_reload(Evas_Object *obj)
    void                     elm_thumb_file_set(Evas_Object *obj, const_char_ptr file, const_char_ptr key)
    void                     elm_thumb_file_get(Evas_Object *obj, const_char_ptr *file, const_char_ptr *key)
    void                     elm_thumb_path_get(Evas_Object *obj, const_char_ptr *file, const_char_ptr *key)
    void                     elm_thumb_animate_set(Evas_Object *obj, Elm_Thumb_Animation_Setting s)
    Elm_Thumb_Animation_Setting elm_thumb_animate_get(Evas_Object *obj)
    void                    *elm_thumb_ethumb_client_get()
    Eina_Bool                elm_thumb_ethumb_client_connected_get()
    Eina_Bool                elm_thumb_editable_set(Evas_Object *obj, Eina_Bool edit)
    Eina_Bool                elm_thumb_editable_get(Evas_Object *obj)
