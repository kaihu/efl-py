from evas.c_evas cimport Eina_Bool
from evas.c_evas cimport Evas_Object, Evas_Coord
from layout_class cimport LayoutClass
from object cimport Object

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    # Progressbar           (api:DONE  cb:DONE  test:DONE  doc:DONE  py3:DONE)
    Evas_Object             *elm_progressbar_add(Evas_Object *parent)
    void                     elm_progressbar_pulse_set(Evas_Object *obj, Eina_Bool pulse)
    Eina_Bool                elm_progressbar_pulse_get(Evas_Object *obj)
    void                     elm_progressbar_pulse(Evas_Object *obj, Eina_Bool state)
    void                     elm_progressbar_value_set(Evas_Object *obj, double val)
    double                   elm_progressbar_value_get(Evas_Object *obj)
    void                     elm_progressbar_span_size_set(Evas_Object *obj, Evas_Coord size)
    Evas_Coord               elm_progressbar_span_size_get(Evas_Object *obj)
    void                     elm_progressbar_unit_format_set(Evas_Object *obj, const_char_ptr format)
    const_char_ptr           elm_progressbar_unit_format_get(Evas_Object *obj)
    void                     elm_progressbar_horizontal_set(Evas_Object *obj, Eina_Bool horizontal)
    Eina_Bool                elm_progressbar_horizontal_get(Evas_Object *obj)
    void                     elm_progressbar_inverted_set(Evas_Object *obj, Eina_Bool inverted)
    Eina_Bool                elm_progressbar_inverted_get(Evas_Object *obj)

