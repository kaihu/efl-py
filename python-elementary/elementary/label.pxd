from evas.general cimport Eina_Bool
from evas.object cimport Evas_Object, Evas_Coord
from layout_class cimport LayoutClass
from object cimport Object
from general cimport Elm_Wrap_Type

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    # Label                 (api:DONE  cb:DONE  test:DONE  doc:DONE)
    Evas_Object             *elm_label_add(Evas_Object *parent)
    void                     elm_label_line_wrap_set(Evas_Object *obj, Elm_Wrap_Type wrap)
    Elm_Wrap_Type            elm_label_line_wrap_get(Evas_Object *obj)
    void                     elm_label_wrap_width_set(Evas_Object *obj, Evas_Coord w)
    Evas_Coord               elm_label_wrap_width_get(Evas_Object *obj)
    void                     elm_label_ellipsis_set(Evas_Object *obj, Eina_Bool ellipsis)
    Eina_Bool                elm_label_ellipsis_get(Evas_Object *obj)
    void                     elm_label_slide_set(Evas_Object *obj, Eina_Bool slide)
    Eina_Bool                elm_label_slide_get(Evas_Object *obj)
    void                     elm_label_slide_duration_set(Evas_Object *obj, double duration)
    double                   elm_label_slide_duration_get(Evas_Object *obj)

