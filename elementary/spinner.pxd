from evas.general cimport Eina_Bool
from evas.object cimport Evas_Object
from layout_class cimport LayoutClass
from object cimport Object

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    # Spinner               (api:DONE  cb:DONE  test:DONE  doc:DONE  py3:DONE)
    Evas_Object             *elm_spinner_add(Evas_Object *parent)
    void                     elm_spinner_label_format_set(Evas_Object *obj, const_char_ptr format)
    const_char_ptr           elm_spinner_label_format_get(Evas_Object *obj)
    void                     elm_spinner_min_max_set(Evas_Object *obj, double min, double max)
    void                     elm_spinner_min_max_get(Evas_Object *obj, double *min, double *max)
    void                     elm_spinner_step_set(Evas_Object *obj, double step)
    double                   elm_spinner_step_get(Evas_Object *obj)
    void                     elm_spinner_value_set(Evas_Object *obj, double val)
    double                   elm_spinner_value_get(Evas_Object *obj)
    void                     elm_spinner_wrap_set(Evas_Object *obj, Eina_Bool wrap)
    Eina_Bool                elm_spinner_wrap_get(Evas_Object *obj)
    void                     elm_spinner_editable_set(Evas_Object *obj, Eina_Bool editable)
    Eina_Bool                elm_spinner_editable_get(Evas_Object *obj)
    void                     elm_spinner_special_value_add(Evas_Object *obj, double value, const_char_ptr label)
    void                     elm_spinner_interval_set(Evas_Object *obj, double interval)
    double                   elm_spinner_interval_get(Evas_Object *obj)
    void                     elm_spinner_base_set(Evas_Object *obj, double base)
    double                   elm_spinner_base_get(Evas_Object *obj)
    void                     elm_spinner_round_set(Evas_Object *obj, int rnd)
    int                      elm_spinner_round_get(Evas_Object *obj)

