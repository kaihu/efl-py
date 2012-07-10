from general cimport Eina_List, const_Eina_List, Eina_Bool
from general cimport Evas_Coord, Evas_Modifier, Evas_Button_Flags, Evas_Font_Hinting_Flags
from callbacks cimport *
from events cimport *

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"
    ctypedef void const_void "const void"

cdef extern from "Evas.h":

    ctypedef struct Evas
    ctypedef Evas const_Evas "const Evas"

    ctypedef struct Evas_Object
    ctypedef Evas_Object const_Evas_Object "const Evas_Object"

    ctypedef void (*Evas_Event_Cb)(void *data, Evas *e, void *event_info)

    ####################################################################
    # Canvas (py3:TODO)
    #
    Evas *evas_new()
    void evas_free(Evas *e)

    int evas_render_method_lookup(const_char_ptr name)
    Eina_List *evas_render_method_list()
    void evas_render_method_list_free(Eina_List *list)

    void evas_output_method_set(Evas *e, int render_method)
    int evas_output_method_get(Evas *e)

    void *evas_engine_info_get(Evas *e)
    int evas_engine_info_set(Evas *e, void *info)

    void evas_output_size_set(Evas *e, int w, int h)
    void evas_output_size_get(const_Evas *e, int *w, int *h)
    void evas_output_viewport_set(Evas *e, Evas_Coord x, Evas_Coord y, Evas_Coord w, Evas_Coord h)
    void evas_output_viewport_get(const_Evas *e, Evas_Coord *x, Evas_Coord *y, Evas_Coord *w, Evas_Coord *h)
    Evas_Coord evas_coord_screen_x_to_world(const_Evas *e, int x)
    Evas_Coord evas_coord_screen_y_to_world(const_Evas *e, int y)
    int evas_coord_world_x_to_screen(const_Evas *e, Evas_Coord x)
    int evas_coord_world_y_to_screen(const_Evas *e, Evas_Coord y)

    void evas_pointer_output_xy_get(const_Evas *e, int *x, int *y)
    void evas_pointer_canvas_xy_get(const_Evas *e, Evas_Coord *x, Evas_Coord *y)
    int evas_pointer_button_down_mask_get(const_Evas *e)
    Eina_Bool evas_pointer_inside_get(const_Evas *e)

    Evas_Object *evas_object_top_at_xy_get(const_Evas *e, Evas_Coord x, Evas_Coord y, Eina_Bool include_pass_events_objects, Eina_Bool include_hidden_objects)
    Evas_Object *evas_object_top_at_pointer_get(const_Evas *e)
    Evas_Object *evas_object_top_in_rectangle_get(const_Evas *e, Evas_Coord x, Evas_Coord y, Evas_Coord w, Evas_Coord h, Eina_Bool include_pass_events_objects, Eina_Bool include_hidden_objects)

    Eina_List *evas_objects_at_xy_get(const_Evas *e, Evas_Coord x, Evas_Coord y, Eina_Bool include_pass_events_objects, Eina_Bool include_hidden_objects)
    Eina_List *evas_objects_in_rectangle_get(const_Evas *e, Evas_Coord x, Evas_Coord y, Evas_Coord w, Evas_Coord h, Eina_Bool include_pass_events_objects, Eina_Bool include_hidden_objects)

    void evas_damage_rectangle_add(Evas *e, int x, int y, int w, int h)
    void evas_obscured_rectangle_add(Evas *e, int x, int y, int w, int h)
    void evas_obscured_clear(Evas *e)
    Eina_List *evas_render_updates(Evas *e)
    void evas_render_updates_free(Eina_List *updates)
    void evas_render(Evas *e)
    void evas_norender(Evas *e)
    void *evas_data_attach_get(const_Evas *e)
    void evas_data_attach_set(Evas *e, void *data)

    Evas_Object *evas_focus_get(const_Evas *e)

    Evas_Modifier *evas_key_modifier_get(Evas *e)

    void evas_event_callback_add(Evas *e, Evas_Callback_Type type, Evas_Event_Cb func, const_void *data)
    void *evas_event_callback_del(Evas *e, Evas_Callback_Type type, Evas_Event_Cb func)

    void evas_event_freeze(Evas *e)
    void evas_event_thaw(Evas *e)
    int evas_event_freeze_get(const_Evas *e)

    void evas_event_feed_mouse_down(Evas *e, int b, Evas_Button_Flags flags, unsigned int timestamp, const_void *data)
    void evas_event_feed_mouse_up(Evas *e, int b, Evas_Button_Flags flags, unsigned int timestamp, const_void *data)
    void evas_event_feed_mouse_cancel(Evas *e, unsigned int timestamp, const_void *data)
    void evas_event_feed_mouse_wheel(Evas *e, int direction, int z, unsigned int timestamp, const_void *data)
    void evas_event_feed_mouse_move(Evas *e, int x, int y, unsigned int timestamp, const_void *data)
    void evas_event_feed_mouse_in(Evas *e, unsigned int timestamp, const_void *data)
    void evas_event_feed_mouse_out(Evas *e, unsigned int timestamp, const_void *data)
    void evas_event_feed_multi_down(Evas *e, int d, int x, int y, double rad, double radx, double rady, double pres, double ang, double fx, double fy, Evas_Button_Flags flags, unsigned int timestamp, const_void *data)
    void evas_event_feed_multi_up(Evas *e, int d, int x, int y, double rad, double radx, double rady, double pres, double ang, double fx, double fy, Evas_Button_Flags flags, unsigned int timestamp, const_void *data)
    void evas_event_feed_multi_move(Evas *e, int d, int x, int y, double rad, double radx, double rady, double pres, double ang, double fx, double fy, unsigned int timestamp, const_void *data)
    void evas_event_feed_key_down(Evas *e, const_char_ptr keyname, const_char_ptr key, const_char_ptr string, const_char_ptr compose, unsigned int timestamp, const_void *data)
    void evas_event_feed_key_up(Evas *e, const_char_ptr keyname, const_char_ptr key, const_char_ptr string, const_char_ptr compose, unsigned int timestamp, const_void *data)
    void evas_event_feed_hold(Evas *e, int hold, unsigned int timestamp, const_void *data)

    void evas_font_path_clear(Evas *e)
    void evas_font_path_append(Evas *e, const_char_ptr path)
    void evas_font_path_prepend(Evas *e, const_char_ptr path)
    const_Eina_List *evas_font_path_list(const_Evas *e)

    void evas_font_hinting_set(Evas *e, Evas_Font_Hinting_Flags hinting)
    Evas_Font_Hinting_Flags evas_font_hinting_get(const_Evas *e)
    Eina_Bool evas_font_hinting_can_hint(const_Evas *e, Evas_Font_Hinting_Flags hinting)

    void evas_font_cache_flush(Evas *e)
    void evas_font_cache_set(Evas *e, int size)
    int evas_font_cache_get(const_Evas *e)

    Eina_List *evas_font_available_list(const_Evas *e)
    void evas_font_available_list_free(Evas *e, Eina_List *available)

    void evas_image_cache_flush(Evas *e)
    void evas_image_cache_reload(Evas *e)
    void evas_image_cache_set(Evas *e, int size)
    int evas_image_cache_get(const_Evas *e)

cdef class Canvas(object):
    cdef Evas *obj
    cdef object _callbacks

    cdef int _set_obj(self, Evas *obj) except 0
    cdef int _unset_obj(self) except 0

cdef Canvas Canvas_from_instance(Evas *evas)

cdef int evas_canvas_event_callbacks_len
