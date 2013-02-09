from evas.c_evas cimport Eina_Bool
from evas.c_evas cimport Evas_Object
from layout_class cimport LayoutClass
from object cimport Object

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    ctypedef enum Elm_Fileselector_Mode:
        ELM_FILESELECTOR_LIST
        ELM_FILESELECTOR_GRID

    # Fileselector          (api:DONE  cb:DONE  test:DONE  doc:DONE  py3:DONE)
    Evas_Object             *elm_fileselector_add(Evas_Object *parent)
    void                     elm_fileselector_is_save_set(Evas_Object *obj, Eina_Bool is_save)
    Eina_Bool                elm_fileselector_is_save_get(Evas_Object *obj)
    void                     elm_fileselector_folder_only_set(Evas_Object *obj, Eina_Bool value)
    Eina_Bool                elm_fileselector_folder_only_get(Evas_Object *obj)
    void                     elm_fileselector_buttons_ok_cancel_set(Evas_Object *obj, Eina_Bool value)
    Eina_Bool                elm_fileselector_buttons_ok_cancel_get(Evas_Object *obj)
    void                     elm_fileselector_expandable_set(Evas_Object *obj, Eina_Bool value)
    Eina_Bool                elm_fileselector_expandable_get(Evas_Object *obj)
    void                     elm_fileselector_path_set(Evas_Object *obj, const_char_ptr path)
    const_char_ptr           elm_fileselector_path_get(Evas_Object *obj)
    Eina_Bool                elm_fileselector_selected_set(Evas_Object *obj, const_char_ptr path)
    const_char_ptr           elm_fileselector_selected_get(Evas_Object *obj)
    void                     elm_fileselector_mode_set(Evas_Object *obj, Elm_Fileselector_Mode mode)
    Elm_Fileselector_Mode    elm_fileselector_mode_get(Evas_Object *obj)

