from evas.c_evas cimport Eina_Bool, Eina_List, const_Eina_List, Evas_Coord
from evas.c_evas cimport Evas_Object
from evas.c_evas cimport Evas_Font_Size

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Elementary.h":

    #font
    ctypedef struct Elm_Font_Overlay:
        const_char_ptr text_class
        const_char_ptr font
        Evas_Font_Size size

    #text
    ctypedef struct Elm_Text_Class:
        const_char_ptr name
        const_char_ptr desc

    # Config                (py3: TODO)
    Eina_Bool                elm_config_save()
    void                     elm_config_reload()
    void                     elm_config_all_flush()
    const_char_ptr           elm_config_profile_get()
    const_char_ptr           elm_config_profile_dir_get(const_char_ptr profile, Eina_Bool is_user)
    void                     elm_config_profile_dir_free(const_char_ptr p_dir)
    Eina_List               *elm_config_profile_list_get()
    void                     elm_config_profile_list_free(Eina_List *l)
    void                     elm_config_profile_set(const_char_ptr profile)
    Eina_Bool                elm_config_scroll_bounce_enabled_get()
    void                     elm_config_scroll_bounce_enabled_set(Eina_Bool enabled)
    double                   elm_config_scroll_bounce_friction_get()
    void                     elm_config_scroll_bounce_friction_set(double friction)
    double                   elm_config_scroll_page_scroll_friction_get()
    void                     elm_config_scroll_page_scroll_friction_set(double friction)
    double                   elm_config_scroll_bring_in_scroll_friction_get()
    void                     elm_config_scroll_bring_in_scroll_friction_set(double friction)
    double                   elm_config_scroll_zoom_friction_get()
    void                     elm_config_scroll_zoom_friction_set(double friction)
    Eina_Bool                elm_config_scroll_thumbscroll_enabled_get()
    void                     elm_config_scroll_thumbscroll_enabled_set(Eina_Bool enabled)
    unsigned int             elm_config_scroll_thumbscroll_threshold_get()
    void                     elm_config_scroll_thumbscroll_threshold_set(unsigned int threshold)
    double                   elm_config_scroll_thumbscroll_momentum_threshold_get()
    void                     elm_config_scroll_thumbscroll_momentum_threshold_set(double threshold)
    double                   elm_config_scroll_thumbscroll_friction_get()
    void                     elm_config_scroll_thumbscroll_friction_set(double friction)
    double                   elm_config_scroll_thumbscroll_border_friction_get()
    void                     elm_config_scroll_thumbscroll_border_friction_set(double friction)
    double                   elm_config_scroll_thumbscroll_sensitivity_friction_get()
    void                     elm_config_scroll_thumbscroll_sensitivity_friction_set(double friction)
    double                   elm_config_longpress_timeout_get()
    void                     elm_config_longpress_timeout_set(double longpress_timeout)
    double                   elm_config_tooltip_delay_get()
    Eina_Bool                elm_config_tooltip_delay_set(double delay)
    int                      elm_config_cursor_engine_only_get()
    Eina_Bool                elm_config_cursor_engine_only_set(int engine_only)
    double                   elm_config_scale_get()
    void                     elm_config_scale_set(double scale)
    Eina_Bool                elm_config_password_show_last_get()
    void                     elm_config_password_show_last_set(Eina_Bool password_show_last)
    double                   elm_config_password_show_last_timeout_get()
    void                     elm_config_password_show_last_timeout_set(double password_show_last_timeout)
    const_char_ptr           elm_config_engine_get()
    void                     elm_config_engine_set(const_char_ptr engine)
    const_char_ptr           elm_config_preferred_engine_get()
    void                     elm_config_preferred_engine_set(const_char_ptr engine)
    Eina_List               *elm_config_text_classes_list_get()
    void                     elm_config_text_classes_list_free(Eina_List *list)
    Eina_List               *elm_config_font_overlay_list_get()
    void                     elm_config_font_overlay_set(const_char_ptr text_class, const_char_ptr font, Evas_Font_Size size)
    void                     elm_config_font_overlay_unset(const_char_ptr text_class)
    void                     elm_config_font_overlay_apply()
    Evas_Coord               elm_config_finger_size_get()
    void                     elm_config_finger_size_set(Evas_Coord size)
    int                      elm_config_cache_flush_interval_get()
    void                     elm_config_cache_flush_interval_set(int size)
    Eina_Bool                elm_config_cache_flush_enabled_get()
    void                     elm_config_cache_flush_enabled_set(Eina_Bool enabled)
    int                      elm_config_cache_font_cache_size_get()
    void                     elm_config_cache_font_cache_size_set(int size)
    int                      elm_config_cache_image_cache_size_get()
    void                     elm_config_cache_image_cache_size_set(int size)
    int                      elm_config_cache_edje_file_cache_size_get()
    void                     elm_config_cache_edje_file_cache_size_set(int size)
    int                      elm_config_cache_edje_collection_cache_size_get()
    void                     elm_config_cache_edje_collection_cache_size_set(int size)
    Eina_Bool                elm_config_focus_highlight_enabled_get()
    void                     elm_config_focus_highlight_enabled_set(Eina_Bool enable)
    Eina_Bool                elm_config_focus_highlight_animate_get()
    void                     elm_config_focus_highlight_animate_set(Eina_Bool animate)
    Eina_Bool                elm_config_mirrored_get()
    void                     elm_config_mirrored_set(Eina_Bool mirrored)

