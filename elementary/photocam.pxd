from evas.general cimport Eina_Bool
from evas.object cimport Evas_Object
from evas.general cimport Evas_Load_Error
from object cimport Object

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    ctypedef enum Elm_Photocam_Zoom_Mode:
        ELM_PHOTOCAM_ZOOM_MODE_MANUAL
        ELM_PHOTOCAM_ZOOM_MODE_AUTO_FIT
        ELM_PHOTOCAM_ZOOM_MODE_AUTO_FILL
        ELM_PHOTOCAM_ZOOM_MODE_AUTO_FIT_IN
        ELM_PHOTOCAM_ZOOM_MODE_LAST

    # Photocam              (api:DONE  cb:DONE  test:TODO  doc:DONE  py3:DONE)
    Evas_Object             *elm_photocam_add(Evas_Object *parent)
    Evas_Load_Error          elm_photocam_file_set(Evas_Object *obj, const_char_ptr file)
    const_char_ptr           elm_photocam_file_get(Evas_Object *obj)
    void                     elm_photocam_zoom_set(Evas_Object *obj, double zoom)
    double                   elm_photocam_zoom_get(Evas_Object *obj)
    void                     elm_photocam_zoom_mode_set(Evas_Object *obj, Elm_Photocam_Zoom_Mode mode)
    Elm_Photocam_Zoom_Mode   elm_photocam_zoom_mode_get(Evas_Object *obj)
    void                     elm_photocam_image_size_get(Evas_Object *obj, int *w, int *h)
    void                     elm_photocam_image_region_get(Evas_Object *obj, int *x, int *y, int *w, int *h)
    void                     elm_photocam_image_region_show(Evas_Object *obj, int x, int y, int w, int h)
    void                     elm_photocam_image_region_bring_in(Evas_Object *obj, int x, int y, int w, int h)
    void                     elm_photocam_paused_set(Evas_Object *obj, Eina_Bool paused)
    Eina_Bool                elm_photocam_paused_get(Evas_Object *obj)
    Evas_Object             *elm_photocam_internal_image_get(Evas_Object *obj)
    void                     elm_photocam_bounce_set(Evas_Object *obj, Eina_Bool h_bounce, Eina_Bool v_bounce)
    void                     elm_photocam_bounce_get(Evas_Object *obj, Eina_Bool *h_bounce, Eina_Bool *v_bounce)
    void                     elm_photocam_gesture_enabled_set(Evas_Object *obj, Eina_Bool gesture)
    Eina_Bool                elm_photocam_gesture_enabled_get(Evas_Object *obj)

