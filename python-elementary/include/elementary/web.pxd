from evas.c_evas cimport Eina_Bool, Eina_List
from evas.c_evas cimport Evas_Object, Evas_Coord
from object cimport Object

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    ctypedef enum Elm_Web_Window_Feature_Flag:
        ELM_WEB_WINDOW_FEATURE_TOOLBAR
        ELM_WEB_WINDOW_FEATURE_STATUSBAR
        ELM_WEB_WINDOW_FEATURE_SCROLLBARS
        ELM_WEB_WINDOW_FEATURE_MENUBAR
        ELM_WEB_WINDOW_FEATURE_LOCATIONBAR
        ELM_WEB_WINDOW_FEATURE_FULLSCREEN

    ctypedef enum Elm_Web_Zoom_Mode:
        ELM_WEB_ZOOM_MODE_MANUAL 	#Zoom controlled normally by elm_web_zoom_set.
        ELM_WEB_ZOOM_MODE_AUTO_FIT 	#Zoom until content fits in web object
        ELM_WEB_ZOOM_MODE_AUTO_FILL	#Zoom until content fills web object.

    #web
    ctypedef struct Elm_Web_Frame_Load_Error:
        int code
        Eina_Bool is_cancellation
        const_char_ptr domain
        const_char_ptr description
        const_char_ptr failing_url
        Evas_Object *frame

    ctypedef struct Elm_Web_Window_Features

    ctypedef Evas_Object    *(*Elm_Web_Window_Open)         (void *data, Evas_Object *obj, Eina_Bool js, Elm_Web_Window_Features *window_features)
    ctypedef Evas_Object    *(*Elm_Web_Dialog_Alert)        (void *data, Evas_Object *obj, const_char_ptr message)
    ctypedef Evas_Object    *(*Elm_Web_Dialog_Confirm)      (void *data, Evas_Object *obj, const_char_ptr message, Eina_Bool *ret)
    ctypedef Evas_Object    *(*Elm_Web_Dialog_Prompt)       (void *data, Evas_Object *obj, const_char_ptr message, const_char_ptr def_value, char **value, Eina_Bool *ret)
    ctypedef Evas_Object    *(*Elm_Web_Dialog_File_Selector)(void *data, Evas_Object *obj, Eina_Bool allows_multiple, Eina_List *accept_types, Eina_List **selected, Eina_Bool *ret)
    ctypedef void            (*Elm_Web_Console_Message)     (void *data, Evas_Object *obj, const_char_ptr message, unsigned int line_number, const_char_ptr source_id)


    # Web                   (api:TODO  cb:TODO  test:DONE  doc:TODO  py3:TODO)
    Evas_Object             *elm_web_add(Evas_Object *parent)
    void                     elm_web_useragent_set(Evas_Object *obj, const_char_ptr user_agent)
    const_char_ptr           elm_web_useragent_get(Evas_Object *obj)
    Evas_Object             *elm_web_webkit_view_get(Evas_Object *obj)

    void                     elm_web_window_create_hook_set(Evas_Object *obj, Elm_Web_Window_Open func, void *data)
    void                     elm_web_dialog_alert_hook_set(Evas_Object *obj, Elm_Web_Dialog_Alert func, void *data)
    void                     elm_web_dialog_confirm_hook_set(Evas_Object *obj, Elm_Web_Dialog_Confirm func, void *data)
    void                     elm_web_dialog_prompt_hook_set(Evas_Object *obj, Elm_Web_Dialog_Prompt func, void *data)
    void                     elm_web_dialog_file_selector_hook_set(Evas_Object *obj, Elm_Web_Dialog_File_Selector func, void *data)
    void                     elm_web_console_message_hook_set(Evas_Object *obj, Elm_Web_Console_Message func, void *data)

    Eina_Bool                elm_web_tab_propagate_get(Evas_Object *obj)
    void                     elm_web_tab_propagate_set(Evas_Object *obj, Eina_Bool propagate)
    Eina_Bool                elm_web_uri_set(Evas_Object *obj,char *uri)
    const_char_ptr           elm_web_uri_get(Evas_Object *obj)
    const_char_ptr           elm_web_title_get(Evas_Object *obj)
    void                     elm_web_bg_color_set(Evas_Object *obj, int r, int g, int b, int a)
    void                     elm_web_bg_color_get(Evas_Object *obj, int *r, int *g, int *b, int *a)

    char                    *elm_web_selection_get(Evas_Object *obj)
    void                     elm_web_popup_selected_set(Evas_Object *obj, int index)
    Eina_Bool                elm_web_popup_destroy(Evas_Object *obj)

    Eina_Bool                elm_web_text_search(Evas_Object *obj, const_char_ptr string, Eina_Bool case_sensitive, Eina_Bool forward, Eina_Bool wrap)
    unsigned int             elm_web_text_matches_mark(Evas_Object *obj, const_char_ptr string, Eina_Bool case_sensitive, Eina_Bool highlight, unsigned int limit)
    Eina_Bool                elm_web_text_matches_unmark_all(Evas_Object *obj)
    Eina_Bool                elm_web_text_matches_highlight_set(Evas_Object *obj, Eina_Bool highlight)
    Eina_Bool                elm_web_text_matches_highlight_get(Evas_Object *obj)

    double                   elm_web_load_progress_get(Evas_Object *obj)
    Eina_Bool                elm_web_stop(Evas_Object *obj)
    Eina_Bool                elm_web_reload(Evas_Object *obj)
    Eina_Bool                elm_web_reload_full(Evas_Object *obj)
    Eina_Bool                elm_web_back(Evas_Object *obj)
    Eina_Bool                elm_web_forward(Evas_Object *obj)
    Eina_Bool                elm_web_navigate(Evas_Object *obj, int steps)

    Eina_Bool                elm_web_back_possible_get(Evas_Object *obj)
    Eina_Bool                elm_web_forward_possible_get(Evas_Object *obj)
    Eina_Bool                elm_web_navigate_possible_get(Evas_Object *obj, int steps)
    Eina_Bool                elm_web_history_enabled_get(Evas_Object *obj)
    void                     elm_web_history_enabled_set(Evas_Object *obj, Eina_Bool enabled)

    void                     elm_web_zoom_set(Evas_Object *obj, double zoom)
    double                   elm_web_zoom_get(Evas_Object *obj)
    void                     elm_web_zoom_mode_set(Evas_Object *obj, Elm_Web_Zoom_Mode mode)
    Elm_Web_Zoom_Mode        elm_web_zoom_mode_get(Evas_Object *obj)

    void                     elm_web_region_show(Evas_Object *obj, int x, int y, int w, int h)
    void                     elm_web_region_bring_in(Evas_Object *obj, int x, int y, int w, int h)
    void                     elm_web_inwin_mode_set(Evas_Object *obj, Eina_Bool value)
    Eina_Bool                elm_web_inwin_mode_get(Evas_Object *obj)

    Eina_Bool                elm_web_window_features_property_get(Elm_Web_Window_Features *wf, Elm_Web_Window_Feature_Flag flag)
    void                     elm_web_window_features_region_get(Elm_Web_Window_Features *wf, Evas_Coord *x, Evas_Coord *y, Evas_Coord *w, Evas_Coord *h)

