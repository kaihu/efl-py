from evas.general cimport Eina_Bool
from evas.object cimport Evas_Object, const_Evas_Object
from object cimport Object
from enums cimport Elm_Illume_Command, Elm_Win_Type, Elm_Win_Indicator_Mode, \
    Elm_Win_Indicator_Opacity_Mode, Elm_Win_Keyboard_Mode

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Ecore_X.h":
    ctypedef unsigned int Ecore_X_ID
    ctypedef Ecore_X_ID Ecore_X_Window

cdef extern from "Elementary.h":

    # Window                (api:DONE  cb:DONE  test:TODO  doc:TODO  py3:DONE)
    Evas_Object             *elm_win_add(Evas_Object *parent, const_char_ptr name, Elm_Win_Type type)
    Evas_Object             *elm_win_util_standard_add(const_char_ptr name, const_char_ptr title)
    void                     elm_win_resize_object_add(Evas_Object *obj, Evas_Object* subobj)
    void                     elm_win_resize_object_del(Evas_Object *obj, Evas_Object* subobj)
    void                     elm_win_title_set(Evas_Object *obj, const_char_ptr title)
    const_char_ptr           elm_win_title_get(Evas_Object *obj)
    void                     elm_win_icon_name_set(Evas_Object *obj, const_char_ptr icon_name)
    const_char_ptr           elm_win_icon_name_get(Evas_Object *obj)
    void                     elm_win_role_set(Evas_Object *obj, const_char_ptr role)
    const_char_ptr           elm_win_role_get(Evas_Object *obj)
    void                     elm_win_icon_object_set(Evas_Object* obj, Evas_Object* icon)
    const_Evas_Object       *elm_win_icon_object_get(Evas_Object*)
    void                     elm_win_autodel_set(Evas_Object *obj, Eina_Bool autodel)
    Eina_Bool                elm_win_autodel_get(Evas_Object *obj)
    void                     elm_win_activate(Evas_Object *obj)
    void                     elm_win_lower(Evas_Object *obj)
    void                     elm_win_raise(Evas_Object *obj)
    void                     elm_win_center(Evas_Object *obj, Eina_Bool h, Eina_Bool v)
    void                     elm_win_borderless_set(Evas_Object *obj, Eina_Bool borderless)
    Eina_Bool                elm_win_borderless_get(Evas_Object *obj)
    void                     elm_win_shaped_set(Evas_Object *obj, Eina_Bool shaped)
    Eina_Bool                elm_win_shaped_get(Evas_Object *obj)
    void                     elm_win_alpha_set(Evas_Object *obj, Eina_Bool alpha)
    Eina_Bool                elm_win_alpha_get(Evas_Object *obj)
    void                     elm_win_override_set(Evas_Object *obj, Eina_Bool override)
    Eina_Bool                elm_win_override_get(Evas_Object *obj)
    void                     elm_win_fullscreen_set(Evas_Object *obj, Eina_Bool fullscreen)
    Eina_Bool                elm_win_fullscreen_get(Evas_Object *obj)
    void                     elm_win_maximized_set(Evas_Object *obj, Eina_Bool maximized)
    Eina_Bool                elm_win_maximized_get(Evas_Object *obj)
    void                     elm_win_iconified_set(Evas_Object *obj, Eina_Bool iconified)
    Eina_Bool                elm_win_iconified_get(Evas_Object *obj)
    void                     elm_win_withdrawn_set(Evas_Object *obj, Eina_Bool withdrawn)
    Eina_Bool                elm_win_withdrawn_get(Evas_Object *obj)
    void                     elm_win_urgent_set(Evas_Object *obj, Eina_Bool urgent)
    Eina_Bool                elm_win_urgent_get(Evas_Object *obj)
    void                     elm_win_demand_attention_set(Evas_Object *obj, Eina_Bool demand_attention)
    Eina_Bool                elm_win_demand_attention_get(Evas_Object *obj)
    void                     elm_win_modal_set(Evas_Object *obj, Eina_Bool modal)
    Eina_Bool                elm_win_modal_get(Evas_Object *obj)
    void                     elm_win_aspect_set(Evas_Object *obj, double aspect)
    double                   elm_win_aspect_get(Evas_Object *obj)
    void                     elm_win_size_base_set(Evas_Object *obj, int w, int h)
    void                     elm_win_size_base_get(Evas_Object *obj, int *w, int *h)
    void                     elm_win_size_step_set(Evas_Object *obj, int w, int h)
    void                     elm_win_size_step_get(Evas_Object *obj, int *w, int *h)
    void                     elm_win_layer_set(Evas_Object *obj, int layer)
    int                      elm_win_layer_get(Evas_Object *obj)
    void                     elm_win_rotation_set(Evas_Object *obj, int rotation)
    void                     elm_win_rotation_with_resize_set(Evas_Object *obj, int rotation)
    int                      elm_win_rotation_get(Evas_Object *obj)
    void                     elm_win_sticky_set(Evas_Object *obj, Eina_Bool sticky)
    Eina_Bool                elm_win_sticky_get(Evas_Object *obj)
    void                     elm_win_conformant_set(Evas_Object *obj, Eina_Bool conformant)
    Eina_Bool                elm_win_conformant_get(Evas_Object *obj)

    void                     elm_win_quickpanel_set(Evas_Object *obj, Eina_Bool quickpanel)
    Eina_Bool                elm_win_quickpanel_get(Evas_Object *obj)
    void                     elm_win_quickpanel_priority_major_set(Evas_Object *obj, int priority)
    int                      elm_win_quickpanel_priority_major_get(Evas_Object *obj)
    void                     elm_win_quickpanel_priority_minor_set(Evas_Object *obj, int priority)
    int                      elm_win_quickpanel_priority_minor_get(Evas_Object *obj)
    void                     elm_win_quickpanel_zone_set(Evas_Object *obj, int zone)
    int                      elm_win_quickpanel_zone_get(Evas_Object *obj)

    void                     elm_win_prop_focus_skip_set(Evas_Object *obj, Eina_Bool skip)
    void                     elm_win_illume_command_send(Evas_Object *obj, Elm_Illume_Command command, params)
    Evas_Object             *elm_win_inlined_image_object_get(Evas_Object *obj)
    Eina_Bool                elm_win_focus_get(Evas_Object *obj)
    void                     elm_win_screen_constrain_set(Evas_Object *obj, Eina_Bool constrain)
    Eina_Bool                elm_win_screen_constrain_get(Evas_Object *obj)
    void                     elm_win_screen_size_get(Evas_Object *obj, int *x, int *y, int *w, int *h)

    void                     elm_win_focus_highlight_enabled_set(Evas_Object *obj, Eina_Bool enabled)
    Eina_Bool                elm_win_focus_highlight_enabled_get(Evas_Object *obj)
    void                     elm_win_focus_highlight_style_set(Evas_Object *obj, const_char_ptr style)
    const_char_ptr           elm_win_focus_highlight_style_get(Evas_Object *obj)

    void                     elm_win_keyboard_mode_set(Evas_Object *obj, Elm_Win_Keyboard_Mode mode)
    Elm_Win_Keyboard_Mode    elm_win_keyboard_mode_get(Evas_Object *obj)
    void                     elm_win_keyboard_win_set(Evas_Object *obj, Eina_Bool is_keyboard)
    Eina_Bool                elm_win_keyboard_win_get(Evas_Object *obj)

    void                     elm_win_indicator_mode_set(Evas_Object *obj, Elm_Win_Indicator_Mode mode)
    Elm_Win_Indicator_Mode   elm_win_indicator_mode_get(Evas_Object *obj)
    void                     elm_win_indicator_opacity_set(Evas_Object *obj, Elm_Win_Indicator_Opacity_Mode mode)
    Elm_Win_Indicator_Opacity_Mode elm_win_indicator_opacity_get(Evas_Object *obj)

    void                     elm_win_screen_position_get(Evas_Object *obj, int *x, int *y)
    Eina_Bool                elm_win_socket_listen(Evas_Object *obj, const_char_ptr svcname, int svcnum, Eina_Bool svcsys)

    # X specific call - wont't work on non-x engines (return 0)
    Ecore_X_Window           elm_win_xwindow_get(Evas_Object *obj)

