from evas.c_evas cimport Eina_Bool
from evas.c_evas cimport Evas_Object
from object cimport Object

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    ctypedef enum Elm_Panel_Orient:
        ELM_PANEL_ORIENT_TOP
        ELM_PANEL_ORIENT_BOTTOM
        ELM_PANEL_ORIENT_LEFT
        ELM_PANEL_ORIENT_RIGHT

    # Panel                 (api:DONE  cb:N/A   test:DONE  doc:DONE)
    Evas_Object             *elm_panel_add(Evas_Object *parent)
    void                     elm_panel_orient_set(Evas_Object *obj, Elm_Panel_Orient orient)
    Elm_Panel_Orient         elm_panel_orient_get(Evas_Object *obj)
    void                     elm_panel_hidden_set(Evas_Object *obj, Eina_Bool hidden)
    Eina_Bool                elm_panel_hidden_get(Evas_Object *obj)
    void                     elm_panel_toggle(Evas_Object *obj)

