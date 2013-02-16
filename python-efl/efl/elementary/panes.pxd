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

    # Panes                 (api:DONE  cb:DONE  test:TODO  doc:DONE)
    Evas_Object             *elm_panes_add(Evas_Object *parent)
    void                     elm_panes_fixed_set(Evas_Object *obj, Eina_Bool fixed)
    Eina_Bool                elm_panes_fixed_get(Evas_Object *obj)
    double                   elm_panes_content_left_size_get(Evas_Object *obj)
    void                     elm_panes_content_left_size_set(Evas_Object *obj, double size)
    double                   elm_panes_content_right_size_get(Evas_Object *obj)
    void                     elm_panes_content_right_size_set(Evas_Object *obj, double size)
    void                     elm_panes_horizontal_set(Evas_Object *obj, Eina_Bool horizontal)
    Eina_Bool                elm_panes_horizontal_get(Evas_Object *obj)

