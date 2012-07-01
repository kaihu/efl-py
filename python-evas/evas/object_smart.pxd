from canvas cimport Evas
from object cimport Evas_Object, const_Evas_Object, Object, Evas_Smart_Cb
from general cimport Eina_Bool, Eina_List
from object_rectangle cimport Rectangle

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"
    ctypedef void const_void "const void"

cdef extern from "Evas.h":

    ctypedef enum Evas_Smart_Class_Version:
        EVAS_SMART_CLASS_VERSION

    ctypedef struct Evas_Smart

    ctypedef struct Evas_Smart_Class
    ctypedef Evas_Smart_Class const_Evas_Smart_Class "const Evas_Smart_Class"
    ctypedef struct Evas_Smart_Class:
        const_char_ptr name
        int version
        void (*add)(Evas_Object *o)
        void (*delete "del")(Evas_Object *o)
        void (*move)(Evas_Object *o, int x, int y)
        void (*resize)(Evas_Object *o, int w, int h)
        void (*show)(Evas_Object *o)
        void (*hide)(Evas_Object *o)
        void (*color_set)(Evas_Object *o, int r, int g, int b, int a)
        void (*clip_set)(Evas_Object *o, Evas_Object *clip)
        void (*clip_unset)(Evas_Object *o)
        void (*calculate)(Evas_Object *o)
        void (*member_add)(Evas_Object *o, Evas_Object *child)
        void (*member_del)(Evas_Object *o, Evas_Object *child)
        const_Evas_Smart_Class *parent
        Evas_Smart_Cb_Description *callbacks
        const_void *data

    ctypedef struct Evas_Smart_Cb_Description:
        const_char_ptr name
        const_char_ptr type
    ctypedef Evas_Smart_Cb_Description const_Evas_Smart_Cb_Description "const Evas_Smart_Cb_Description"

    ####################################################################
    # Smart Object (py3:TODO)
    #
    void evas_smart_free(Evas_Smart *s)
    Evas_Smart *evas_smart_class_new(Evas_Smart_Class *sc)
    Evas_Smart_Class *evas_smart_class_get(Evas_Smart *s)

    void *evas_smart_data_get(Evas_Smart *s)

    Evas_Object *evas_object_smart_add(Evas *e, Evas_Smart *s)
    void evas_object_smart_member_add(Evas_Object *obj, Evas_Object *smart_obj)
    void evas_object_smart_member_del(Evas_Object *obj)
    Evas_Object *evas_object_smart_parent_get(const_Evas_Object *obj)
    Eina_List *evas_object_smart_members_get(const_Evas_Object *obj)
    Evas_Smart *evas_object_smart_smart_get(const_Evas_Object *obj)
    void *evas_object_smart_data_get(const_Evas_Object *obj)
    void evas_object_smart_data_set(Evas_Object *obj, void *data)
    void evas_object_smart_callback_add(Evas_Object *obj, const_char_ptr event, Evas_Smart_Cb func, const_void *data)
    void *evas_object_smart_callback_del(Evas_Object *obj, const_char_ptr event, Evas_Smart_Cb func)
    void evas_object_smart_callback_call(Evas_Object *obj, const_char_ptr event, void *event_info)
    void evas_object_smart_changed(Evas_Object *obj)
    void evas_object_smart_need_recalculate_set(Evas_Object *obj, int value)
    int evas_object_smart_need_recalculate_get(const_Evas_Object *obj)
    void evas_object_smart_calculate(Evas_Object *obj)
    void evas_object_smart_move_children_relative(Evas_Object *obj, int dx, int dy)

cdef public class SmartObject(Object) [object PyEvasSmartObject,
                                       type PyEvasSmartObject_Type]:
    cdef object _smart_callbacks
    cdef object _m_delete
    cdef object _m_move
    cdef object _m_resize
    cdef object _m_show
    cdef object _m_hide
    cdef object _m_color_set
    cdef object _m_clip_set
    cdef object _m_clip_unset
    cdef object _m_calculate

cdef public class ClippedSmartObject(SmartObject) \
         [object PyEvasClippedSmartObject, type PyEvasClippedSmartObject_Type]:
    cdef readonly Rectangle clipper
