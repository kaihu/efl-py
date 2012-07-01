from canvas cimport Evas
from general cimport Evas_Point, Evas_Coord, Evas_Modifier, Evas_Lock, \
    Evas_Device, Evas_Coord_Point, Evas_Button_Flags, Evas_Position, \
    Evas_Coord_Precision_Point, Evas_Precision_Position, Eina_Bool

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"
    ctypedef void const_void "const void"

cdef extern from "Evas.h":

    ctypedef enum Evas_Event_Flags:
        EVAS_EVENT_FLAG_NONE
        EVAS_EVENT_FLAG_ON_HOLD

    ctypedef struct Evas_Object
    ctypedef Evas_Object const_Evas_Object "const Evas_Object"

    ctypedef struct Evas_Event_Mouse_In:
        int buttons
        Evas_Point output
        Evas_Coord_Point canvas
        void *data
        Evas_Modifier *modifiers
        Evas_Lock *locks
        unsigned int timestamp
        Evas_Event_Flags event_flags
        Evas_Device *dev

    ctypedef struct Evas_Event_Mouse_Out:
        int buttons
        Evas_Point output
        Evas_Coord_Point canvas
        void *data
        Evas_Modifier *modifiers
        Evas_Lock *locks
        unsigned int timestamp
        Evas_Event_Flags event_flags
        Evas_Device *dev

    ctypedef struct Evas_Event_Mouse_Down:
        int button
        Evas_Point output
        Evas_Coord_Point canvas
        void *data
        Evas_Modifier *modifiers
        Evas_Lock *locks
        Evas_Button_Flags flags
        unsigned int timestamp
        Evas_Event_Flags event_flags
        Evas_Device *dev

    ctypedef struct Evas_Event_Mouse_Up:
        int button
        Evas_Point output
        Evas_Coord_Point canvas
        void *data
        Evas_Modifier *modifiers
        Evas_Lock *locks
        Evas_Button_Flags flags
        unsigned int timestamp
        Evas_Event_Flags event_flags
        Evas_Device *dev

    ctypedef struct Evas_Event_Mouse_Move:
        int buttons
        Evas_Position cur
        Evas_Position prev
        void *data
        Evas_Modifier *modifiers
        Evas_Lock *locks
        unsigned int timestamp
        Evas_Event_Flags event_flags
        Evas_Device *dev


    ctypedef struct Evas_Event_Multi_Down:
        int device
        double radius
        double radius_x
        double radius_y
        double pressure
        double angle
        Evas_Point output
        Evas_Coord_Precision_Point canvas
        void *data
        Evas_Modifier *modifiers
        Evas_Lock *locks
        Evas_Button_Flags flags
        unsigned int timestamp
        Evas_Event_Flags event_flags
        Evas_Device *dev

    ctypedef struct Evas_Event_Multi_Up:
        int device
        double radius
        double radius_x
        double radius_y
        double pressure
        double angle
        Evas_Point output
        Evas_Coord_Precision_Point canvas
        void *data
        Evas_Modifier *modifiers
        Evas_Lock *locks
        Evas_Button_Flags flags
        unsigned int timestamp
        Evas_Event_Flags event_flags
        Evas_Device *dev

    ctypedef struct Evas_Event_Multi_Move:
        double radius
        double radius_x
        double radius_y
        double pressure
        double angle
        Evas_Precision_Position cur
        void *data
        Evas_Modifier *modifiers
        Evas_Lock *locks
        unsigned int timestamp
        Evas_Event_Flags event_flags
        Evas_Device *dev

    ctypedef struct Evas_Event_Mouse_Wheel:
        int direction # 0 = default up/down wheel
        int z         # ...,-2,-1 = down, 1,2,... = up */
        Evas_Point output
        Evas_Coord_Point canvas
        void *data
        Evas_Modifier *modifiers
        Evas_Lock *locks
        unsigned int timestamp
        Evas_Event_Flags event_flags
        Evas_Device *dev

    ctypedef struct Evas_Event_Key_Down:
        char *keyname
        void *data
        Evas_Modifier *modifiers
        Evas_Lock *locks
        const_char_ptr key
        const_char_ptr string
        const_char_ptr compose
        unsigned int timestamp
        Evas_Event_Flags event_flags
        Evas_Device *dev

    ctypedef struct Evas_Event_Key_Up:
        char *keyname
        void *data
        Evas_Modifier *modifiers
        Evas_Lock *locks
        const_char_ptr key
        const_char_ptr string
        const_char_ptr compose
        unsigned int timestamp
        Evas_Event_Flags event_flags
        Evas_Device *dev

    ctypedef struct Evas_Event_Hold:
        int hold
        void *data
        unsigned int timestamp
        Evas_Event_Flags event_flags
        Evas_Device *dev

    ctypedef void (*Evas_Event_Cb)(void *data, Evas *e, void *event_info)

    Eina_Bool evas_key_modifier_is_set(Evas_Modifier *m, const_char_ptr keyname)
    int evas_async_events_fd_get()
    int evas_async_events_process()


cdef class EventPoint:
    cdef Evas_Point *obj

    cdef void _set_obj(self, Evas_Point *obj)
    cdef void _unset_obj(self)
    cdef void _check_validity(self) except *


cdef class EventCoordPoint:
    cdef Evas_Coord_Point *obj

    cdef void _set_obj(self, Evas_Coord_Point *obj)
    cdef void _unset_obj(self)
    cdef void _check_validity(self) except *


cdef class EventPrecisionPoint:
    cdef Evas_Coord_Precision_Point *obj

    cdef void _set_obj(self, Evas_Coord_Precision_Point *obj)
    cdef void _unset_obj(self)
    cdef void _check_validity(self) except *


cdef class EventPosition:
    cdef readonly EventPoint output
    cdef readonly EventCoordPoint canvas

    cdef void _set_objs(self, Evas_Point *output, Evas_Coord_Point *canvas)
    cdef void _unset_objs(self)


cdef class EventPrecisionPosition:
    cdef readonly EventPoint output
    cdef readonly EventPrecisionPoint canvas

    cdef void _set_objs(self, Evas_Point *output, Evas_Coord_Precision_Point *canvas)
    cdef void _unset_objs(self)


cdef class EventMouseIn:
    cdef Evas_Event_Mouse_In *obj
    cdef readonly EventPosition position

    cdef void _set_obj(self, void *ptr)
    cdef void _unset_obj(self)
    cdef void _check_validity(self) except *


cdef class EventMouseOut:
    cdef Evas_Event_Mouse_Out *obj
    cdef readonly EventPosition position

    cdef void _set_obj(self, void *ptr)
    cdef void _unset_obj(self)
    cdef void _check_validity(self) except *


cdef class EventMouseDown:
    cdef Evas_Event_Mouse_Down *obj
    cdef readonly EventPosition position

    cdef void _set_obj(self, void *ptr)
    cdef void _unset_obj(self)
    cdef void _check_validity(self) except *


cdef class EventMouseUp:
    cdef Evas_Event_Mouse_Up *obj
    cdef readonly EventPosition position

    cdef void _set_obj(self, void *ptr)
    cdef void _unset_obj(self)
    cdef void _check_validity(self) except *


cdef class EventMouseMove:
    cdef Evas_Event_Mouse_Move *obj
    cdef readonly EventPosition position
    cdef readonly EventPosition prev_position

    cdef void _set_obj(self, void *ptr)
    cdef void _unset_obj(self)
    cdef void _check_validity(self) except *


cdef class EventMultiDown:
    cdef Evas_Event_Multi_Down *obj
    cdef readonly EventPrecisionPosition position

    cdef void _set_obj(self, void *ptr)
    cdef void _unset_obj(self)
    cdef void _check_validity(self) except *


cdef class EventMultiUp:
    cdef Evas_Event_Multi_Up *obj
    cdef readonly EventPrecisionPosition position

    cdef void _set_obj(self, void *ptr)
    cdef void _unset_obj(self)
    cdef void _check_validity(self) except *


cdef class EventMultiMove:
    cdef Evas_Event_Multi_Move *obj
    cdef readonly EventPrecisionPosition position

    cdef void _set_obj(self, void *ptr)
    cdef void _unset_obj(self)
    cdef void _check_validity(self) except *


cdef class EventMouseWheel:
    cdef Evas_Event_Mouse_Wheel *obj
    cdef readonly EventPosition position

    cdef void _set_obj(self, void *ptr)
    cdef void _unset_obj(self)
    cdef void _check_validity(self) except *


cdef class EventKeyDown:
    cdef Evas_Event_Key_Down *obj

    cdef void _set_obj(self, void *ptr)
    cdef void _unset_obj(self)
    cdef void _check_validity(self) except *


cdef class EventKeyUp:
    cdef Evas_Event_Key_Up *obj

    cdef void _set_obj(self, void *ptr)
    cdef void _unset_obj(self)
    cdef void _check_validity(self) except *


cdef class EventHold:
    cdef Evas_Event_Hold *obj

    cdef void _set_obj(self, void *ptr)
    cdef void _unset_obj(self)
    cdef void _check_validity(self) except *

