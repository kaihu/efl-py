from evas.general cimport Eina_Bool, Eina_List
from evas.object cimport Evas_Object, Evas_Coord, Evas_Smart_Cb
from object cimport Object
from object_item cimport Elm_Object_Item, ObjectItem

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    # Menu                  (api:DONE  cb:DONE  test:DONE  doc:DONE  py3:DONE)
    Evas_Object             *elm_menu_add(Evas_Object *parent)
    void                     elm_menu_parent_set(Evas_Object *obj, Evas_Object *parent)
    Evas_Object             *elm_menu_parent_get(Evas_Object *obj)
    void                     elm_menu_move(Evas_Object *obj, Evas_Coord x, Evas_Coord y)
    void                     elm_menu_close(Evas_Object *obj)
    Eina_List               *elm_menu_items_get(Evas_Object *obj)
    Evas_Object             *elm_menu_item_object_get(Elm_Object_Item *it)
    Elm_Object_Item         *elm_menu_item_add(Evas_Object *obj, Elm_Object_Item *parent, const_char_ptr icon, const_char_ptr label, Evas_Smart_Cb func, void *data)
    void                     elm_menu_item_icon_name_set(Elm_Object_Item *it, const_char_ptr icon)
    const_char_ptr           elm_menu_item_icon_name_get(Elm_Object_Item *it)
    void                     elm_menu_item_selected_set(Elm_Object_Item *it, Eina_Bool selected)
    Eina_Bool                elm_menu_item_selected_get(Elm_Object_Item *it)
    Elm_Object_Item         *elm_menu_item_separator_add(Evas_Object *obj, Elm_Object_Item *parent)
    Eina_Bool                elm_menu_item_is_separator(Elm_Object_Item *it)
    Eina_List               *elm_menu_item_subitems_get(Elm_Object_Item *it)
    int                      elm_menu_item_index_get(Elm_Object_Item *it)
    Elm_Object_Item         *elm_menu_selected_item_get(Evas_Object *obj)
    Elm_Object_Item         *elm_menu_last_item_get(Evas_Object *obj)
    Elm_Object_Item         *elm_menu_first_item_get(Evas_Object *obj)
    Elm_Object_Item         *elm_menu_item_next_get(Elm_Object_Item *it)
    Elm_Object_Item         *elm_menu_item_prev_get(Elm_Object_Item *it)

cdef class Menu(Object):
    pass
