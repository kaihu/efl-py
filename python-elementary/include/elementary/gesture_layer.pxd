from evas.c_evas cimport Eina_Bool
from evas.c_evas cimport Evas_Object, Evas_Coord
from evas.c_evas cimport Evas_Event_Flags
from object cimport Object

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    ctypedef enum Elm_Gesture_State:
        ELM_GESTURE_STATE_UNDEFINED
        ELM_GESTURE_STATE_START
        ELM_GESTURE_STATE_MOVE
        ELM_GESTURE_STATE_END
        ELM_GESTURE_STATE_ABORT

    ctypedef enum Elm_Gesture_Type:
        ELM_GESTURE_FIRST
        ELM_GESTURE_N_TAPS
        ELM_GESTURE_N_LONG_TAPS
        ELM_GESTURE_N_DOUBLE_TAPS
        ELM_GESTURE_N_TRIPLE_TAPS
        ELM_GESTURE_MOMENTUM
        ELM_GESTURE_N_LINES
        ELM_GESTURE_N_FLICKS
        ELM_GESTURE_ZOOM
        ELM_GESTURE_ROTATE
        ELM_GESTURE_LAST

    #gesture layer
    ctypedef struct Elm_Gesture_Taps_Info:
        Evas_Coord   x, y
        unsigned int n
        unsigned int timestamp

    ctypedef struct Elm_Gesture_Momentum_Info:
        Evas_Coord   x1
        Evas_Coord   y1
        Evas_Coord   x2
        Evas_Coord   y2

        unsigned int tx
        unsigned int ty

        Evas_Coord   mx
        Evas_Coord   my

        unsigned int n

    ctypedef struct _Elm_Gesture_Line_Info:
        Elm_Gesture_Momentum_Info momentum
        double                    angle

    ctypedef struct _Elm_Gesture_Zoom_Info:
        Evas_Coord x, y
        Evas_Coord radius
        double     zoom
        double     momentum

    ctypedef struct _Elm_Gesture_Rotate_Info:
        Evas_Coord x, y
        Evas_Coord radius
        double     base_angle
        double     angle
        double     momentum

    ctypedef Evas_Event_Flags (*Elm_Gesture_Event_Cb)(void *data, void *event_info)

    # Gesture layer
    void                     elm_gesture_layer_cb_set(Evas_Object *obj, Elm_Gesture_Type idx, Elm_Gesture_State cb_type, Elm_Gesture_Event_Cb cb, void *data)
    Eina_Bool                elm_gesture_layer_hold_events_get(Evas_Object *obj)
    void                     elm_gesture_layer_hold_events_set(Evas_Object *obj, Eina_Bool hold_events)
    void                     elm_gesture_layer_zoom_step_set(Evas_Object *obj, double step)
    double                   elm_gesture_layer_zoom_step_get(Evas_Object *obj)
    void                     elm_gesture_layer_rotate_step_set(Evas_Object *obj, double step)
    double                   elm_gesture_layer_rotate_step_get(Evas_Object *obj)
    Eina_Bool                elm_gesture_layer_attach(Evas_Object *obj, Evas_Object *target)
    Evas_Object             *elm_gesture_layer_add(Evas_Object *parent)

