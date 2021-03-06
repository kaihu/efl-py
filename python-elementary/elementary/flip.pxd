from evas.general cimport Eina_Bool
from evas.object cimport Evas_Object, Evas_Coord
from object cimport Object
from enums cimport Elm_Flip_Direction, Elm_Flip_Interaction, Elm_Flip_Mode

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    # Flip                  (api:DONE  cb:DONE  test:DONE  doc:DONE)
    Evas_Object             *elm_flip_add(Evas_Object *parent)
    Eina_Bool                elm_flip_front_visible_get(Evas_Object *obj)
    void                     elm_flip_perspective_set(Evas_Object *obj, Evas_Coord foc, Evas_Coord x, Evas_Coord y)
    void                     elm_flip_go(Evas_Object *obj, Elm_Flip_Mode mode)
    void                     elm_flip_interaction_set(Evas_Object *obj, Elm_Flip_Interaction mode)
    Elm_Flip_Interaction     elm_flip_interaction_get(Evas_Object *obj)
    void                     elm_flip_interaction_direction_enabled_set(Evas_Object *obj, Elm_Flip_Direction dir, Eina_Bool enabled)
    Eina_Bool                elm_flip_interaction_direction_enabled_get(Evas_Object *obj, Elm_Flip_Direction dir)
    void                     elm_flip_interaction_direction_hitsize_set(Evas_Object *obj, Elm_Flip_Direction dir, double hitsize)
    double                   elm_flip_interaction_direction_hitsize_get(Evas_Object *obj, Elm_Flip_Direction dir)

