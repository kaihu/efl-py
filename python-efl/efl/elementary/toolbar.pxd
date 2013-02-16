from evas.general cimport Eina_Bool
from evas.object cimport Evas_Object, Evas_Smart_Cb
from object cimport Object
from object_item cimport Elm_Object_Item, ObjectItem
from enums cimport Elm_Object_Select_Mode, Elm_Toolbar_Shrink_Mode, Elm_Icon_Lookup_Order

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    #toolbar
    ctypedef struct Elm_Toolbar_Item_State:
        char *icon
        char *label
        Evas_Smart_Cb func
        void *data

    # Toolbar               (api:TODO  cb:DONE  test:DONE  doc:TODO  py3:DONE)
    Evas_Object             *elm_toolbar_add(Evas_Object *parent)
    void                     elm_toolbar_icon_size_set(Evas_Object *obj, int icon_size)
    int                      elm_toolbar_icon_size_get(Evas_Object *obj)
    void                     elm_toolbar_icon_order_lookup_set(Evas_Object *obj, Elm_Icon_Lookup_Order order)
    Elm_Icon_Lookup_Order    elm_toolbar_icon_order_lookup_get(Evas_Object *obj)
    Elm_Object_Item         *elm_toolbar_item_append(Evas_Object *obj, const_char_ptr icon, const_char_ptr label, Evas_Smart_Cb func, void *data)
    Elm_Object_Item         *elm_toolbar_item_prepend(Evas_Object *obj, const_char_ptr icon, const_char_ptr label, Evas_Smart_Cb func, void *data)
    Elm_Object_Item         *elm_toolbar_item_insert_before(Evas_Object *obj, Elm_Object_Item *before, const_char_ptr icon, const_char_ptr label, Evas_Smart_Cb func, void *data)
    Elm_Object_Item         *elm_toolbar_item_insert_after(Evas_Object *obj, Elm_Object_Item *after, const_char_ptr icon, const_char_ptr label, Evas_Smart_Cb func, void *data)
    Elm_Object_Item         *elm_toolbar_first_item_get(Evas_Object *obj)
    Elm_Object_Item         *elm_toolbar_last_item_get(Evas_Object *obj)
    Elm_Object_Item         *elm_toolbar_item_next_get(Elm_Object_Item *item)
    Elm_Object_Item         *elm_toolbar_item_prev_get(Elm_Object_Item *item)
    void                     elm_toolbar_item_priority_set(Elm_Object_Item *item, int priority)
    int                      elm_toolbar_item_priority_get(Elm_Object_Item *item)
    Elm_Object_Item         *elm_toolbar_item_find_by_label(Evas_Object *obj, const_char_ptr label)
    Eina_Bool                elm_toolbar_item_selected_get(Elm_Object_Item *item)
    void                     elm_toolbar_item_selected_set(Elm_Object_Item *item, Eina_Bool selected)
    Elm_Object_Item         *elm_toolbar_selected_item_get(Evas_Object *obj)
    Elm_Object_Item         *elm_toolbar_more_item_get(Evas_Object *obj)
    void                     elm_toolbar_item_icon_set(Elm_Object_Item *item, const_char_ptr icon)
    const_char_ptr elm_toolbar_item_icon_get(Elm_Object_Item *item)
    Evas_Object             *elm_toolbar_item_object_get(Elm_Object_Item *item)
    Evas_Object             *elm_toolbar_item_icon_object_get(Elm_Object_Item *item)
    Eina_Bool                elm_toolbar_item_icon_memfile_set(Elm_Object_Item *item, const_char_ptr img, const_char_ptr size, const_char_ptr format, const_char_ptr key)
    Eina_Bool                elm_toolbar_item_icon_file_set(Elm_Object_Item *item, const_char_ptr file, const_char_ptr key)
    void                     elm_toolbar_item_separator_set(Elm_Object_Item *item, Eina_Bool separator)
    Eina_Bool                elm_toolbar_item_separator_get(Elm_Object_Item *item)
    void                     elm_toolbar_shrink_mode_set(Evas_Object *obj, Elm_Toolbar_Shrink_Mode shrink_mode)
    Elm_Toolbar_Shrink_Mode  elm_toolbar_shrink_mode_get(Evas_Object *obj)
    void                     elm_toolbar_homogeneous_set(Evas_Object *obj, Eina_Bool homogeneous)
    Eina_Bool                elm_toolbar_homogeneous_get(Evas_Object *obj)
    void                     elm_toolbar_menu_parent_set(Evas_Object *obj, Evas_Object *parent)
    Evas_Object             *elm_toolbar_menu_parent_get(Evas_Object *obj)
    void                     elm_toolbar_align_set(Evas_Object *obj, double align)
    double                   elm_toolbar_align_get(Evas_Object *obj)
    void                     elm_toolbar_item_menu_set(Elm_Object_Item *item, Eina_Bool menu)
    Evas_Object             *elm_toolbar_item_menu_get(Elm_Object_Item *item)
    Elm_Toolbar_Item_State  *elm_toolbar_item_state_add(Elm_Object_Item *item, const_char_ptr icon, const_char_ptr label, Evas_Smart_Cb func, void *data)
    Eina_Bool                elm_toolbar_item_state_del(Elm_Object_Item *item, Elm_Toolbar_Item_State *state)
    Eina_Bool                elm_toolbar_item_state_set(Elm_Object_Item *item, Elm_Toolbar_Item_State *state)
    void                     elm_toolbar_item_state_unset(Elm_Object_Item *item)
    Elm_Toolbar_Item_State  *elm_toolbar_item_state_get(Elm_Object_Item *item)
    Elm_Toolbar_Item_State  *elm_toolbar_item_state_next(Elm_Object_Item *item)
    Elm_Toolbar_Item_State  *elm_toolbar_item_state_prev(Elm_Object_Item *item)
    void                     elm_toolbar_horizontal_set(Evas_Object *obj, Eina_Bool horizontal)
    Eina_Bool                elm_toolbar_horizontal_get(Evas_Object *obj)
    unsigned int             elm_toolbar_items_count(Evas_Object *obj)
    void                     elm_toolbar_standard_priority_set(Evas_Object *obj, int priority)
    int                      elm_toolbar_standard_priority_get(Evas_Object *obj)
    void                     elm_toolbar_select_mode_set(Evas_Object *obj, Elm_Object_Select_Mode mode)
    Elm_Object_Select_Mode   elm_toolbar_select_mode_get(Evas_Object *obj)

