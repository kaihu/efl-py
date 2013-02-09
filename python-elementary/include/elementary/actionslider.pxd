from evas.c_evas cimport Evas_Object
from layout_class cimport LayoutClass
from object cimport Object

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    ctypedef enum Elm_Actionslider_Pos:
        ELM_ACTIONSLIDER_NONE
        ELM_ACTIONSLIDER_LEFT
        ELM_ACTIONSLIDER_CENTER
        ELM_ACTIONSLIDER_RIGHT
        ELM_ACTIONSLIDER_ALL

    # Actionslider          (api:DONE  cb:DONE  test:DONE  doc:DONE)
    Evas_Object             *elm_actionslider_add(Evas_Object *parent)
    char                    *elm_actionslider_selected_label_get(Evas_Object *obj)
    void                     elm_actionslider_indicator_pos_set(Evas_Object *obj, Elm_Actionslider_Pos pos)
    Elm_Actionslider_Pos     elm_actionslider_indicator_pos_get(Evas_Object *obj)
    void                     elm_actionslider_magnet_pos_set(Evas_Object *obj, Elm_Actionslider_Pos pos)
    Elm_Actionslider_Pos     elm_actionslider_magnet_pos_get(Evas_Object *obj)
    void                     elm_actionslider_enabled_pos_set(Evas_Object *obj, Elm_Actionslider_Pos pos)
    Elm_Actionslider_Pos     elm_actionslider_enabled_pos_get(Evas_Object *obj)
