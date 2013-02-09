from evas.c_evas cimport Eina_Bool
from evas.c_evas cimport Evas_Object
from object cimport Object

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Elementary.h":

    ctypedef enum Elm_Notify_Orient:
        ELM_NOTIFY_ORIENT_TOP
        ELM_NOTIFY_ORIENT_CENTER
        ELM_NOTIFY_ORIENT_BOTTOM
        ELM_NOTIFY_ORIENT_LEFT
        ELM_NOTIFY_ORIENT_RIGHT
        ELM_NOTIFY_ORIENT_TOP_LEFT
        ELM_NOTIFY_ORIENT_TOP_RIGHT
        ELM_NOTIFY_ORIENT_BOTTOM_LEFT
        ELM_NOTIFY_ORIENT_BOTTOM_RIGHT
        ELM_NOTIFY_ORIENT_LAST

    # Notify                (api:DONE  cb:DONE  test:DONE  doc:DONE)
    Evas_Object             *elm_notify_add(Evas_Object *parent)
    void                     elm_notify_parent_set(Evas_Object *obj, Evas_Object *parent)
    Evas_Object             *elm_notify_parent_get(Evas_Object *obj)
    void                     elm_notify_orient_set(Evas_Object *obj, int orient)
    int                      elm_notify_orient_get(Evas_Object *obj)
    void                     elm_notify_timeout_set(Evas_Object *obj, double timeout)
    double                   elm_notify_timeout_get(Evas_Object *obj)
    void                     elm_notify_allow_events_set(Evas_Object *obj, Eina_Bool repeat)
    Eina_Bool                elm_notify_allow_events_get(Evas_Object *obj)

