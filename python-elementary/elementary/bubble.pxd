from evas.object cimport Evas_Object
from layout_class cimport LayoutClass
from object cimport Object
from enums cimport Elm_Bubble_Pos

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    # Bubble                (api:DONE  cb:DONE  test:DONE  doc:DONE)
    Evas_Object             *elm_bubble_add(Evas_Object *parent)
    void                     elm_bubble_pos_set(Evas_Object *obj, Elm_Bubble_Pos pos)
    Elm_Bubble_Pos           elm_bubble_pos_get(Evas_Object *obj)

