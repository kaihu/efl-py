from canvas cimport Evas, Canvas
from general cimport Eina_Bool, Eina_List, const_Eina_List
from general cimport Evas_Coord, Evas_Aspect_Control, Evas_Render_Op
from events cimport Evas_Event_Cb
from callbacks cimport Evas_Callback_Type
from map cimport Evas_Map

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"
    ctypedef void const_void "const void"

cdef extern from "Evas.h":

    ctypedef Evas const_Evas "const Evas"

    ctypedef Evas_Map const_Evas_Map "const Evas_Map"

    ctypedef enum Evas_Object_Pointer_Mode:
        EVAS_OBJECT_POINTER_MODE_AUTOGRAB
        EVAS_OBJECT_POINTER_MODE_NOGRAB

    ctypedef struct Evas_Object
    ctypedef Evas_Object const_Evas_Object "const Evas_Object"

    ctypedef void (*Evas_Object_Event_Cb)(void *data, Evas *e, Evas_Object *obj, void *event_info)
    ctypedef void (*Evas_Smart_Cb)(void *data, Evas_Object *obj, void *event_info)

    ####################################################################
    # Base Object (py3:TODO)
    #
    void evas_object_del(Evas_Object *obj)
    Evas *evas_object_evas_get(const_Evas_Object *obj)

    void evas_object_data_set(Evas_Object *obj, const_char_ptr key, const_void *data)
    void *evas_object_data_get(const_Evas_Object *obj, const_char_ptr key)
    void *evas_object_data_del(Evas_Object *obj, const_char_ptr key)

    const_char_ptr evas_object_type_get(const_Evas_Object *obj)

    void evas_object_layer_set(Evas_Object *obj, int l)
    int evas_object_layer_get(const_Evas_Object *obj)

    void evas_object_raise(Evas_Object *obj)
    void evas_object_lower(Evas_Object *obj)
    void evas_object_stack_above(Evas_Object *obj, Evas_Object *above)
    void evas_object_stack_below(Evas_Object *obj, Evas_Object *below)
    Evas_Object *evas_object_above_get(const_Evas_Object *obj)
    Evas_Object *evas_object_below_get(const_Evas_Object *obj)
    Evas_Object *evas_object_bottom_get(const_Evas *e)
    Evas_Object *evas_object_top_get(const_Evas *e)

    void evas_object_move(Evas_Object *obj, Evas_Coord x, Evas_Coord y)
    void evas_object_resize(Evas_Object *obj, Evas_Coord w, Evas_Coord h)
    void evas_object_geometry_get(const_Evas_Object *obj, Evas_Coord *x, Evas_Coord *y, Evas_Coord *w, Evas_Coord *h)

    void evas_object_size_hint_min_get(const_Evas_Object *obj, Evas_Coord *w, Evas_Coord *h)
    void evas_object_size_hint_min_set(Evas_Object *obj, Evas_Coord w, Evas_Coord h)
    void evas_object_size_hint_max_get(const_Evas_Object *obj, Evas_Coord *w, Evas_Coord *h)
    void evas_object_size_hint_max_set(Evas_Object *obj, Evas_Coord w, Evas_Coord h)
    void evas_object_size_hint_request_get(const_Evas_Object *obj, Evas_Coord *w, Evas_Coord *h)
    void evas_object_size_hint_request_set(Evas_Object *obj, Evas_Coord w, Evas_Coord h)
    void evas_object_size_hint_aspect_get(const_Evas_Object *obj, Evas_Aspect_Control *aspect, Evas_Coord *w, Evas_Coord *h)
    void evas_object_size_hint_aspect_set(Evas_Object *obj, Evas_Aspect_Control aspect, Evas_Coord w, Evas_Coord h)
    void evas_object_size_hint_align_get(const_Evas_Object *obj, double *x, double *y)
    void evas_object_size_hint_align_set(Evas_Object *obj, double x, double y)
    void evas_object_size_hint_weight_get(const_Evas_Object *obj, double *x, double *y)
    void evas_object_size_hint_weight_set(Evas_Object *obj, double x, double y)
    void evas_object_size_hint_padding_get(const_Evas_Object *obj, Evas_Coord *l, Evas_Coord *r, Evas_Coord *t, Evas_Coord *b)
    void evas_object_size_hint_padding_set(Evas_Object *obj, Evas_Coord l, Evas_Coord r, Evas_Coord t, Evas_Coord b)

    void evas_object_show(Evas_Object *obj)
    void evas_object_hide(Evas_Object *obj)
    Eina_Bool evas_object_visible_get(const_Evas_Object *obj)

    void evas_object_static_clip_set(Evas_Object *obj, Eina_Bool is_static_clip)
    Eina_Bool evas_object_static_clip_get(Evas_Object *obj)

    void evas_object_render_op_set(Evas_Object *obj, Evas_Render_Op op)
    Evas_Render_Op evas_object_render_op_get(const_Evas_Object *obj)

    void evas_object_anti_alias_set(Evas_Object *obj, Eina_Bool antialias)
    Eina_Bool evas_object_anti_alias_get(const_Evas_Object *obj)

    void evas_object_color_set(Evas_Object *obj, int r, int g, int b, int a)
    void evas_object_color_get(const_Evas_Object *obj, int *r, int *g, int *b, int *a)

    void evas_object_clip_set(Evas_Object *obj, Evas_Object *clip)
    Evas_Object *evas_object_clip_get(const_Evas_Object *obj)
    void evas_object_clip_unset(Evas_Object *obj)
    const_Eina_List *evas_object_clipees_get(const_Evas_Object *obj)

    void evas_object_name_set(Evas_Object *obj, const_char_ptr name)
    const_char_ptr evas_object_name_get(const_Evas_Object *obj)
    Evas_Object *evas_object_name_find(const_Evas *e, const_char_ptr name)

    void evas_object_event_callback_add(Evas_Object *obj, Evas_Callback_Type type, Evas_Object_Event_Cb func, const_void *data)
    void *evas_object_event_callback_del(Evas_Object *obj, Evas_Callback_Type type, Evas_Object_Event_Cb func)

    void evas_object_pass_events_set(Evas_Object *obj, Eina_Bool p)
    Eina_Bool evas_object_pass_events_get(const_Evas_Object *obj)
    void evas_object_repeat_events_set(Evas_Object *obj, Eina_Bool repeat)
    Eina_Bool evas_object_repeat_events_get(const_Evas_Object *obj)
    void evas_object_propagate_events_set(Evas_Object *obj, Eina_Bool prop)
    Eina_Bool evas_object_propagate_events_get(const_Evas_Object *obj)
    void evas_object_pointer_mode_set(Evas_Object *obj, Evas_Object_Pointer_Mode setting)
    Evas_Object_Pointer_Mode evas_object_pointer_mode_get(const_Evas_Object *obj)

    void evas_object_focus_set(Evas_Object *obj, Eina_Bool focus)
    Eina_Bool evas_object_focus_get(const_Evas_Object *obj)

    Evas_Object *evas_object_smart_parent_get(const_Evas_Object *obj)

    void            evas_object_map_enable_set(Evas_Object *obj, Eina_Bool enabled)
    Eina_Bool       evas_object_map_enable_get(const_Evas_Object *obj)
    void            evas_object_map_set(Evas_Object *obj, const_Evas_Map *map)
    const_Evas_Map *evas_object_map_get(const_Evas_Object *obj)


cdef public class Object [object PyEvasObject, type PyEvasObject_Type]:
    cdef Evas_Object *obj
    cdef readonly Canvas evas
    cdef readonly data
    cdef object _callbacks

    cdef int _unset_obj(self) except 0
    cdef int _set_obj(self, Evas_Object *obj) except 0

cdef Object Object_from_instance(Evas_Object *obj)

cdef int evas_object_event_callbacks_len
