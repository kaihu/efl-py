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

    # Slider                (api:TODO  cb:DONE  test:DONE  doc:DONE  py3:DONE)
    Evas_Object             *elm_slider_add(Evas_Object *parent)
    void                     elm_slider_span_size_set(Evas_Object *obj, Evas_Coord size)
    Evas_Coord               elm_slider_span_size_get(Evas_Object *obj)
    void                     elm_slider_unit_format_set(Evas_Object *obj, const_char_ptr format)
    const_char_ptr           elm_slider_unit_format_get(Evas_Object *obj)
    void                     elm_slider_indicator_format_set(Evas_Object *obj, const_char_ptr indicator)
    const_char_ptr           elm_slider_indicator_format_get(Evas_Object *obj)
    #void                     elm_slider_indicator_format_function_set(Evas_Object *obj, const_char_ptr (*func)(double val), void (*free_func)(const_char_ptr str))
    #void                     elm_slider_units_format_function_set(Evas_Object *obj, const_char_ptr (*func)(double val), void (*free_func)(const_char_ptr str))
    void                     elm_slider_horizontal_set(Evas_Object *obj, Eina_Bool horizontal)
    Eina_Bool                elm_slider_horizontal_get(Evas_Object *obj)
    void                     elm_slider_min_max_set(Evas_Object *obj, double min, double max)
    void                     elm_slider_min_max_get(Evas_Object *obj, double *min, double *max)
    void                     elm_slider_value_set(Evas_Object *obj, double val)
    double                   elm_slider_value_get(Evas_Object *obj)
    void                     elm_slider_inverted_set(Evas_Object *obj, Eina_Bool inverted)
    Eina_Bool                elm_slider_inverted_get(Evas_Object *obj)
    void                     elm_slider_indicator_show_set(Evas_Object *obj, Eina_Bool show)
    Eina_Bool                elm_slider_indicator_show_get(Evas_Object *obj)

