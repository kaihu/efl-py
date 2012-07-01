from evas.general cimport Eina_Bool
from evas.object cimport Evas_Object, Evas_Coord
from object cimport Object

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    # Fileselector Entry    (api:DONE  cb:DONE  test:DONE  doc:DONE  py3:DONE)
    Evas_Object             *elm_fileselector_entry_add(Evas_Object *parent)
    void                     elm_fileselector_entry_window_title_set(Evas_Object *obj, const_char_ptr title)
    const_char_ptr           elm_fileselector_entry_window_title_get(Evas_Object *obj)
    void                     elm_fileselector_entry_window_size_set(Evas_Object *obj, Evas_Coord width, Evas_Coord height)
    void                     elm_fileselector_entry_window_size_get(Evas_Object *obj, Evas_Coord *width, Evas_Coord *height)
    void                     elm_fileselector_entry_path_set(Evas_Object *obj, const_char_ptr path)
    const_char_ptr           elm_fileselector_entry_path_get(Evas_Object *obj)
    void                     elm_fileselector_entry_expandable_set(Evas_Object *obj, Eina_Bool value)
    Eina_Bool                elm_fileselector_entry_expandable_get(Evas_Object *obj)
    void                     elm_fileselector_entry_folder_only_set(Evas_Object *obj, Eina_Bool value)
    Eina_Bool                elm_fileselector_entry_folder_only_get(Evas_Object *obj)
    void                     elm_fileselector_entry_is_save_set(Evas_Object *obj, Eina_Bool value)
    Eina_Bool                elm_fileselector_entry_is_save_get(Evas_Object *obj)
    void                     elm_fileselector_entry_inwin_mode_set(Evas_Object *obj, Eina_Bool value)
    Eina_Bool                elm_fileselector_entry_inwin_mode_get(Evas_Object *obj)
    void                     elm_fileselector_entry_selected_set(Evas_Object *obj, const_char_ptr path)
    const_char_ptr           elm_fileselector_entry_selected_get(Evas_Object *obj)

