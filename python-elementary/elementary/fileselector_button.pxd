from evas.general cimport Eina_Bool
from evas.object cimport Evas_Object, Evas_Coord
from button cimport Button
from object cimport Object
from enums cimport Elm_Fileselector_Mode

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    # Fileselector Button   (api:DONE  cb:DONE  test:DONE  doc:DONE  py3:DONE)
    Evas_Object             *elm_fileselector_button_add(Evas_Object *parent)
    void                     elm_fileselector_button_window_title_set(Evas_Object *obj, const_char_ptr title)
    const_char_ptr           elm_fileselector_button_window_title_get(Evas_Object *obj)
    void                     elm_fileselector_button_window_size_set(Evas_Object *obj, Evas_Coord width, Evas_Coord height)
    void                     elm_fileselector_button_window_size_get(Evas_Object *obj, Evas_Coord *width, Evas_Coord *height)
    void                     elm_fileselector_button_folder_only_set(Evas_Object *obj, Eina_Bool value)
    Eina_Bool                elm_fileselector_button_folder_only_get(Evas_Object *obj)
    void                     elm_fileselector_button_inwin_mode_set(Evas_Object *obj, Eina_Bool value)
    Eina_Bool                elm_fileselector_button_inwin_mode_get(Evas_Object *obj)
    void                     elm_fileselector_button_is_save_set(Evas_Object *obj, Eina_Bool value)
    Eina_Bool                elm_fileselector_button_is_save_get(Evas_Object *obj)
    void                     elm_fileselector_button_path_set(Evas_Object *obj, const_char_ptr path)
    const_char_ptr           elm_fileselector_button_path_get(Evas_Object *obj)
    void                     elm_fileselector_button_expandable_set(Evas_Object *obj, Eina_Bool value)
    Eina_Bool                elm_fileselector_button_expandable_get(Evas_Object *obj)

