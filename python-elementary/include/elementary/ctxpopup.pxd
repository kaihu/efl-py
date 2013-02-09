from evas.c_evas cimport Eina_Bool
from evas.c_evas cimport Evas_Object, Evas_Smart_Cb
from object cimport Object
from object_item cimport Elm_Object_Item

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    ctypedef enum Elm_Ctxpopup_Direction:
        ELM_CTXPOPUP_DIRECTION_DOWN
        ELM_CTXPOPUP_DIRECTION_RIGHT
        ELM_CTXPOPUP_DIRECTION_LEFT
        ELM_CTXPOPUP_DIRECTION_UP
        ELM_CTXPOPUP_DIRECTION_UNKNOWN

    # Ctxpopup              (api:DONE  cb:DONE  test:DONE  doc:DONE  py3:DONE)
    Evas_Object             *elm_ctxpopup_add(Evas_Object *parent)
    void                     elm_ctxpopup_hover_parent_set(Evas_Object *obj, Evas_Object *parent)
    Evas_Object             *elm_ctxpopup_hover_parent_get(Evas_Object *obj)
    void                     elm_ctxpopup_clear(Evas_Object *obj)
    void                     elm_ctxpopup_horizontal_set(Evas_Object *obj, Eina_Bool horizontal)
    Eina_Bool                elm_ctxpopup_horizontal_get(Evas_Object *obj)
    Elm_Object_Item         *elm_ctxpopup_item_append(Evas_Object *obj, const_char_ptr label, Evas_Object *icon, Evas_Smart_Cb func, void *data)
    void                     elm_ctxpopup_direction_priority_set(Evas_Object *obj, Elm_Ctxpopup_Direction first, Elm_Ctxpopup_Direction second, Elm_Ctxpopup_Direction third, Elm_Ctxpopup_Direction fourth)
    void                     elm_ctxpopup_direction_priority_get(Evas_Object *obj, Elm_Ctxpopup_Direction *first, Elm_Ctxpopup_Direction *second, Elm_Ctxpopup_Direction *third, Elm_Ctxpopup_Direction *fourth)
    Elm_Ctxpopup_Direction   elm_ctxpopup_direction_get(Evas_Object *obj)
    void                     elm_ctxpopup_dismiss(Evas_Object *obj)

