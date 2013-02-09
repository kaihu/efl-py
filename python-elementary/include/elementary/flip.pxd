from evas.c_evas cimport Eina_Bool
from evas.c_evas cimport Evas_Object, Evas_Coord
from object cimport Object

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    ctypedef enum Elm_Flip_Direction:
        ELM_FLIP_DIRECTION_UP
        ELM_FLIP_DIRECTION_DOWN
        ELM_FLIP_DIRECTION_LEFT
        ELM_FLIP_DIRECTION_RIGHT

    ctypedef enum Elm_Flip_Interaction:
        ELM_FLIP_INTERACTION_NONE
        ELM_FLIP_INTERACTION_ROTATE
        ELM_FLIP_INTERACTION_CUBE
        ELM_FLIP_INTERACTION_PAGE

    ctypedef enum Elm_Flip_Mode:
        ELM_FLIP_ROTATE_Y_CENTER_AXIS
        ELM_FLIP_ROTATE_X_CENTER_AXIS
        ELM_FLIP_ROTATE_XZ_CENTER_AXIS
        ELM_FLIP_ROTATE_YZ_CENTER_AXIS
        ELM_FLIP_CUBE_LEFT
        ELM_FLIP_CUBE_RIGHT
        ELM_FLIP_CUBE_UP
        ELM_FLIP_CUBE_DOWN
        ELM_FLIP_PAGE_LEFT
        ELM_FLIP_PAGE_RIGHT
        ELM_FLIP_PAGE_UP
        ELM_FLIP_PAGE_DOWN

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

