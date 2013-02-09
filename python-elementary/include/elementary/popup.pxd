from evas.c_evas cimport Eina_Bool
from evas.c_evas cimport Evas_Object, Evas_Smart_Cb
from object cimport Object
from object_item cimport Elm_Object_Item, ObjectItem
from general cimport Elm_Wrap_Type

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    ctypedef enum Elm_Popup_Orient:
        ELM_POPUP_ORIENT_TOP
        ELM_POPUP_ORIENT_CENTER
        ELM_POPUP_ORIENT_BOTTOM
        ELM_POPUP_ORIENT_LEFT
        ELM_POPUP_ORIENT_RIGHT
        ELM_POPUP_ORIENT_TOP_LEFT
        ELM_POPUP_ORIENT_TOP_RIGHT
        ELM_POPUP_ORIENT_BOTTOM_LEFT
        ELM_POPUP_ORIENT_BOTTOM_RIGHT
        ELM_POPUP_ORIENT_LAST

    # Popup                 (api:DONE  cb:DONE  test:TODO  doc:DONE  py3:DONE)
    Evas_Object             *elm_popup_add(Evas_Object *parent)
    Elm_Object_Item         *elm_popup_item_append(Evas_Object *obj, const_char_ptr label, Evas_Object *icon, Evas_Smart_Cb func, void *data)
    void                     elm_popup_content_text_wrap_type_set(Evas_Object *obj, Elm_Wrap_Type wrap)
    Elm_Wrap_Type            elm_popup_content_text_wrap_type_get(Evas_Object *obj)
    void                     elm_popup_orient_set(Evas_Object *obj, Elm_Popup_Orient orient)
    Elm_Popup_Orient         elm_popup_orient_get(Evas_Object *obj)
    void                     elm_popup_timeout_set(Evas_Object *obj, double timeout)
    double                   elm_popup_timeout_get(Evas_Object *obj)
    void                     elm_popup_allow_events_set(Evas_Object *obj, Eina_Bool allow)
    Eina_Bool                elm_popup_allow_events_get(Evas_Object *obj)

