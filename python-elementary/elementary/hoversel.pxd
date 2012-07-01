from evas.general cimport Eina_Bool, Eina_List
from evas.object cimport Evas_Object, Evas_Smart_Cb
from button cimport Button
from object cimport Object
from object_item cimport Elm_Object_Item, ObjectItem
from icon cimport Elm_Icon_Type

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Elementary.h":

    # Hoversel              (api:DONE  cb:DONE  test:DONE  doc:DONE  py3:DONE)
    Evas_Object             *elm_hoversel_add(Evas_Object *parent)
    void                     elm_hoversel_horizontal_set(Evas_Object *obj, Eina_Bool horizontal)
    Eina_Bool                elm_hoversel_horizontal_get(Evas_Object *obj)
    void                     elm_hoversel_hover_parent_set(Evas_Object *obj, Evas_Object *parent)
    Evas_Object             *elm_hoversel_hover_parent_get(Evas_Object *obj)
    void                     elm_hoversel_hover_begin(Evas_Object *obj)
    void                     elm_hoversel_hover_end(Evas_Object *obj)
    Eina_Bool                elm_hoversel_expanded_get(Evas_Object *obj)
    void                     elm_hoversel_clear(Evas_Object *obj)
    Eina_List               *elm_hoversel_items_get(Evas_Object *obj)
    Elm_Object_Item         *elm_hoversel_item_add(Evas_Object *obj, const_char_ptr label, const_char_ptr icon_file, Elm_Icon_Type icon_type, Evas_Smart_Cb func, void *data)
    void                     elm_hoversel_item_icon_set(Elm_Object_Item *it, const_char_ptr icon_file, const_char_ptr icon_group, Elm_Icon_Type icon_type)
    void                     elm_hoversel_item_icon_get(Elm_Object_Item *it, const_char_ptr *icon_file, const_char_ptr *icon_group, Elm_Icon_Type *icon_type)

