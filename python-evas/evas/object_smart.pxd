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

    ctypedef struct Evas_Smart_Interface
    ctypedef Evas_Smart_Interface const_Evas_Smart_Interface "const Evas_Smart_Interface"

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
        const_Evas_Smart_Interface **interfaces
        const_void *data

    ctypedef struct Evas_Smart_Cb_Description:
        const_char_ptr name
        const_char_ptr type
    ctypedef Evas_Smart_Cb_Description const_Evas_Smart_Cb_Description "const Evas_Smart_Cb_Description"

    ####################################################################
    # Smart Object (py3:TODO)
    #
    void                evas_smart_free(Evas_Smart *s)
    Evas_Smart          *evas_smart_class_new(Evas_Smart_Class *sc)
    Evas_Smart_Class    *evas_smart_class_get(Evas_Smart *s)

    void                *evas_smart_data_get(Evas_Smart *s)

#~ EAPI const Evas_Smart_Cb_Description **evas_smart_callbacks_descriptions_get(const Evas_Smart *s, unsigned int *count) EINA_ARG_NONNULL(1, 1);
#~ EAPI const Evas_Smart_Cb_Description  *evas_smart_callback_description_find(const Evas_Smart *s, const char *name) EINA_ARG_NONNULL(1, 2);
#~ EAPI Eina_Bool                         evas_smart_class_inherit_full(Evas_Smart_Class *sc, const Evas_Smart_Class *parent_sc, unsigned int parent_sc_size) EINA_ARG_NONNULL(1, 2);
#~ EAPI int                               evas_smart_usage_get(const Evas_Smart *s);
#define evas_smart_class_inherit(sc, parent_sc) evas_smart_class_inherit_full(sc, (Evas_Smart_Class *)parent_sc, sizeof(*parent_sc))

    Evas_Object         *evas_object_smart_add(Evas *e, Evas_Smart *s)
    void                evas_object_smart_member_add(Evas_Object *obj, Evas_Object *smart_obj)
    void                evas_object_smart_member_del(Evas_Object *obj)
    Eina_List           *evas_object_smart_members_get(const_Evas_Object *obj)
    Evas_Object         *evas_object_smart_parent_get(const_Evas_Object *obj)
#~ EAPI Eina_Bool    evas_object_smart_type_check(const Evas_Object *obj, const char *type) EINA_WARN_UNUSED_RESULT EINA_ARG_NONNULL(1, 2);
#~ EAPI Eina_Bool    evas_object_smart_type_check_ptr(const Evas_Object *obj, const char *type) EINA_WARN_UNUSED_RESULT EINA_ARG_NONNULL(1, 2);
    Evas_Smart          *evas_object_smart_smart_get(const_Evas_Object *obj)
    void                *evas_object_smart_data_get(const_Evas_Object *obj)
    void                evas_object_smart_data_set(Evas_Object *obj, void *data)
    void                evas_object_smart_callback_add(Evas_Object *obj, const_char_ptr event, Evas_Smart_Cb func, const_void *data)
#~ EAPI void         evas_object_smart_callback_priority_add(Evas_Object *obj, const char *event, Evas_Callback_Priority priority, Evas_Smart_Cb func, const void *data);
    void                *evas_object_smart_callback_del(Evas_Object *obj, const_char_ptr event, Evas_Smart_Cb func)
#~ EAPI void        *evas_object_smart_callback_del_full(Evas_Object *obj, const char *event, Evas_Smart_Cb func, const void *data) EINA_ARG_NONNULL(1, 2, 3);
    void                evas_object_smart_callback_call(Evas_Object *obj, const_char_ptr event, void *event_info)
#~ EAPI Eina_Bool    evas_object_smart_callbacks_descriptions_set(Evas_Object *obj, const Evas_Smart_Cb_Description *descriptions) EINA_ARG_NONNULL(1);
#~ EAPI void         evas_object_smart_callbacks_descriptions_get(const Evas_Object *obj, const Evas_Smart_Cb_Description ***class_descriptions, unsigned int *class_count, const Evas_Smart_Cb_Description ***instance_descriptions, unsigned int *instance_count) EINA_ARG_NONNULL(1);
#~ EAPI void         evas_object_smart_callback_description_find(const Evas_Object *obj, const char *name, const Evas_Smart_Cb_Description **class_description, const Evas_Smart_Cb_Description **instance_description) EINA_ARG_NONNULL(1, 2);
#~ const void       *evas_object_smart_interface_get(const Evas_Object *obj, const char *name);
#~ void             *evas_object_smart_interface_data_get(const Evas_Object *obj, const Evas_Smart_Interface *iface);
    void                evas_object_smart_changed(Evas_Object *obj)
    void                evas_object_smart_need_recalculate_set(Evas_Object *obj, int value)
    int                 evas_object_smart_need_recalculate_get(const_Evas_Object *obj)
    void                evas_object_smart_calculate(Evas_Object *obj)
#~ EAPI void         evas_smart_objects_calculate(Evas *e);
#~ EAPI int          evas_smart_objects_calculate_count_get(const Evas *e);
    void                evas_object_smart_move_children_relative(Evas_Object *obj, int dx, int dy)

    # Clipped
#~ EAPI Evas_Object            *evas_object_smart_clipped_clipper_get(Evas_Object *obj) EINA_WARN_UNUSED_RESULT EINA_ARG_NONNULL(1);
#~ EAPI void                    evas_object_smart_clipped_smart_set(Evas_Smart_Class *sc) EINA_ARG_NONNULL(1);
#~ EAPI const Evas_Smart_Class *evas_object_smart_clipped_class_get(void) EINA_CONST;

cdef class SmartObject(Object):
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

cdef class ClippedSmartObject(SmartObject):
    cdef readonly Rectangle clipper
