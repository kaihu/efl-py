from evas.c_evas cimport Eina_Bool
from evas.c_evas cimport Evas_Object
from object cimport Object

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"
    ctypedef void const_void "const void"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    ctypedef enum Elm_Image_Orient:
        ELM_IMAGE_ORIENT_NONE
        ELM_IMAGE_ROTATE_90
        ELM_IMAGE_ROTATE_180
        ELM_IMAGE_ROTATE_270
        ELM_IMAGE_FLIP_HORIZONTAL
        ELM_IMAGE_FLIP_VERTICAL
        ELM_IMAGE_FLIP_TRANSPOSE
        ELM_IMAGE_FLIP_TRANSVERSE

    # Image                 (api:DONE  cb:DONE  test:DONE  doc:DONE  py3:DONE)
    Evas_Object             *elm_image_add(Evas_Object *parent)
    Eina_Bool                elm_image_memfile_set(Evas_Object *obj, const_void *img, size_t size, const_char_ptr format, const_char_ptr key)
    Eina_Bool                elm_image_file_set(Evas_Object *obj, const_char_ptr file, const_char_ptr group)
    void                     elm_image_file_get(Evas_Object *obj, const_char_ptr *file, const_char_ptr *group)
    void                     elm_image_smooth_set(Evas_Object *obj, Eina_Bool smooth)
    Eina_Bool                elm_image_smooth_get(Evas_Object *obj)
    void                     elm_image_object_size_get(Evas_Object *obj, int *w, int *h)
    void                     elm_image_no_scale_set(Evas_Object *obj, Eina_Bool no_scale)
    Eina_Bool                elm_image_no_scale_get(Evas_Object *obj)
    void                     elm_image_resizable_set(Evas_Object *obj, Eina_Bool scale_up,Eina_Bool scale_down)
    void                     elm_image_resizable_get(Evas_Object *obj, Eina_Bool *scale_up,Eina_Bool *scale_down)
    void                     elm_image_fill_outside_set(Evas_Object *obj, Eina_Bool fill_outside)
    Eina_Bool                elm_image_fill_outside_get(Evas_Object *obj)
    void                     elm_image_preload_disabled_set(Evas_Object *obj, Eina_Bool disabled)
    void                     elm_image_prescale_set(Evas_Object *obj, int size)
    int                      elm_image_prescale_get(Evas_Object *obj)
    void                     elm_image_orient_set(Evas_Object *obj, Elm_Image_Orient orient)
    Elm_Image_Orient         elm_image_orient_get(Evas_Object *obj)
    void                     elm_image_editable_set(Evas_Object *obj, Eina_Bool editable)
    Eina_Bool                elm_image_editable_get(Evas_Object *obj)
    Evas_Object             *elm_image_object_get(Evas_Object *obj)
    void                     elm_image_aspect_fixed_set(Evas_Object *obj, Eina_Bool fixed)
    Eina_Bool                elm_image_aspect_fixed_get(Evas_Object *obj)
    Eina_Bool                elm_image_animated_available_get(Evas_Object *obj)
    void                     elm_image_animated_set(Evas_Object *obj, Eina_Bool animated)
    Eina_Bool                elm_image_animated_get(Evas_Object *obj)
    void                     elm_image_animated_play_set(Evas_Object *obj, Eina_Bool play)
    Eina_Bool                elm_image_animated_play_get(Evas_Object *obj)

cdef class Image(Object):
    pass
