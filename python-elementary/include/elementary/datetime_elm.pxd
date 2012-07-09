from evas.object cimport Evas_Object
from evas.general cimport Eina_Bool
from object cimport Object
from general cimport tm

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    ctypedef enum Elm_Datetime_Field_Type:
        ELM_DATETIME_YEAR    = 0
        ELM_DATETIME_MONTH   = 1
        ELM_DATETIME_DATE    = 2
        ELM_DATETIME_HOUR    = 3
        ELM_DATETIME_MINUTE  = 4
        ELM_DATETIME_AMPM    = 5

    # Datetime              (api: DONE  cb:DONE  test:TODO  doc:DONE  py3:DONE)
    Evas_Object             *elm_datetime_add(Evas_Object *parent)
    const_char_ptr           elm_datetime_format_get(Evas_Object *obj)
    void                     elm_datetime_format_set(Evas_Object *obj, const_char_ptr fmt)
    Eina_Bool                elm_datetime_value_max_get(Evas_Object *obj, tm *maxtime)
    Eina_Bool                elm_datetime_value_max_set(Evas_Object *obj, tm *maxtime)
    Eina_Bool                elm_datetime_value_min_get(Evas_Object *obj, tm *mintime)
    Eina_Bool                elm_datetime_value_min_set(Evas_Object *obj, tm *mintime)
    void                     elm_datetime_field_limit_get(Evas_Object *obj, Elm_Datetime_Field_Type fieldtype, int *min, int *max)
    void                     elm_datetime_field_limit_set(Evas_Object *obj, Elm_Datetime_Field_Type fieldtype, int min, int max)
    Eina_Bool                elm_datetime_value_get(Evas_Object *obj, tm *currtime)
    Eina_Bool                elm_datetime_value_set(Evas_Object *obj, tm *newtime)
    Eina_Bool                elm_datetime_field_visible_get(Evas_Object *obj, Elm_Datetime_Field_Type fieldtype)
    void                     elm_datetime_field_visible_set(Evas_Object *obj, Elm_Datetime_Field_Type fieldtype, Eina_Bool visible)

