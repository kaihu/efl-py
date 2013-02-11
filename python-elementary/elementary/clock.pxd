from evas.object cimport Evas_Object
from evas.general cimport Eina_Bool
from layout_class cimport LayoutClass
from object cimport Object
from enums cimport Elm_Clock_Edit_Mode

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    # Clock                 (api:DONE  cb:DONE  test:DONE  doc:DONE)
    Evas_Object             *elm_clock_add(Evas_Object *parent)
    void                     elm_clock_time_set(Evas_Object *obj, int hrs, int min, int sec)
    void                     elm_clock_time_get(Evas_Object *obj, int *hrs, int *min, int *sec)
    void                     elm_clock_edit_set(Evas_Object *obj, Eina_Bool edit)
    Eina_Bool                elm_clock_edit_get(Evas_Object *obj)
    void                     elm_clock_edit_mode_set(Evas_Object *obj, Elm_Clock_Edit_Mode mode)
    Elm_Clock_Edit_Mode      elm_clock_edit_mode_get(Evas_Object *obj)
    void                     elm_clock_show_am_pm_set(Evas_Object *obj, Eina_Bool am_pm)
    Eina_Bool                elm_clock_show_am_pm_get(Evas_Object *obj)
    void                     elm_clock_show_seconds_set(Evas_Object *obj, Eina_Bool seconds)
    Eina_Bool                elm_clock_show_seconds_get(Evas_Object *obj)
    void                     elm_clock_first_interval_set(Evas_Object *obj, double interval)
    double                   elm_clock_first_interval_get(Evas_Object *obj)
