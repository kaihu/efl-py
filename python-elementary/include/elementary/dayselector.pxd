from evas.c_evas cimport Eina_Bool
from evas.c_evas cimport Evas_Object
from layout_class cimport LayoutClass
from object cimport Object

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    ctypedef enum Elm_Dayselector_Day:
        ELM_DAYSELECTOR_SUN = 0
        ELM_DAYSELECTOR_MON
        ELM_DAYSELECTOR_TUE
        ELM_DAYSELECTOR_WED
        ELM_DAYSELECTOR_THU
        ELM_DAYSELECTOR_FRI
        ELM_DAYSELECTOR_SAT
        ELM_DAYSELECTOR_MAX

    # Dayselector           (api:DONE  cb:DONE  test:BUG  doc:DONE)
    Evas_Object             *elm_dayselector_add(Evas_Object *parent)
    void                     elm_dayselector_day_selected_set(Evas_Object *obj, Elm_Dayselector_Day day, Eina_Bool selected)
    Eina_Bool                elm_dayselector_day_selected_get(Evas_Object *obj, Elm_Dayselector_Day day)
    void                     elm_dayselector_week_start_set(Evas_Object *obj, Elm_Dayselector_Day day)
    Elm_Dayselector_Day      elm_dayselector_week_start_get(Evas_Object *obj)
    void                     elm_dayselector_weekend_start_set(Evas_Object *obj, Elm_Dayselector_Day day)
    Elm_Dayselector_Day      elm_dayselector_weekend_start_get(Evas_Object *obj)
    void                     elm_dayselector_weekend_length_set(Evas_Object *obj, unsigned int length)
    unsigned int             elm_dayselector_weekend_length_get(Evas_Object *obj)
