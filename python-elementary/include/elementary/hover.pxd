from evas.c_evas cimport Evas_Object
from layout_class cimport LayoutClass
from object cimport Object

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Elementary.h":

    ctypedef enum Elm_Hover_Axis:
        ELM_HOVER_AXIS_NONE
        ELM_HOVER_AXIS_HORIZONTAL
        ELM_HOVER_AXIS_VERTICAL
        ELM_HOVER_AXIS_BOTH

    # Hover                 (api:DONE  cb:DONE  test:DONE  doc:DONE)
    Evas_Object             *elm_hover_add(Evas_Object *parent)
    void                     elm_hover_target_set(Evas_Object *obj, Evas_Object *target)
    Evas_Object             *elm_hover_target_get(Evas_Object *obj)
    void                     elm_hover_parent_set(Evas_Object *obj, Evas_Object *parent)
    Evas_Object             *elm_hover_parent_get(Evas_Object *obj)
    char                    *elm_hover_best_content_location_get(Evas_Object *obj, Elm_Hover_Axis pref_axis)
    void                     elm_hover_dismiss(Evas_Object *obj)

cdef class Hover(LayoutClass):
    pass
