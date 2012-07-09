from evas.object cimport Evas_Object, Eina_Bool, Eina_List
from layout_class cimport LayoutClass
from object cimport Object
from object_item cimport Elm_Object_Item, ObjectItem

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Elementary.h":

    # Naviframe             (api:DONE  cb:DONE  test:DONE  doc:DONE  py3:DONE)
    Evas_Object             *elm_naviframe_add(Evas_Object *parent)
    Elm_Object_Item         *elm_naviframe_item_push(Evas_Object *obj, const_char_ptr title_label, Evas_Object *prev_btn, Evas_Object *next_btn, Evas_Object *content, const_char_ptr item_style)
    Elm_Object_Item         *elm_naviframe_item_insert_before(Evas_Object *obj, Elm_Object_Item *before, const_char_ptr title_label, Evas_Object *prev_btn, Evas_Object *next_btn, Evas_Object *content, const_char_ptr item_style)
    Elm_Object_Item         *elm_naviframe_item_insert_after(Evas_Object *obj, Elm_Object_Item *after, const_char_ptr title_label, Evas_Object *prev_btn, Evas_Object *next_btn, Evas_Object *content, const_char_ptr item_style)
    Evas_Object             *elm_naviframe_item_pop(Evas_Object *obj)
    void                     elm_naviframe_item_pop_to(Elm_Object_Item *it)
    void                     elm_naviframe_item_promote(Elm_Object_Item *it)
    void                     elm_naviframe_content_preserve_on_pop_set(Evas_Object *obj, Eina_Bool preserve)
    Eina_Bool                elm_naviframe_content_preserve_on_pop_get(Evas_Object *obj)
    Elm_Object_Item         *elm_naviframe_top_item_get(Evas_Object *obj)
    Elm_Object_Item         *elm_naviframe_bottom_item_get(Evas_Object *obj)
    void                     elm_naviframe_item_style_set(Elm_Object_Item *it, const_char_ptr item_style)
    const_char_ptr           elm_naviframe_item_style_get(Elm_Object_Item *it)
    void                     elm_naviframe_item_title_visible_set(Elm_Object_Item *it, Eina_Bool visible)
    Eina_Bool                elm_naviframe_item_title_visible_get(Elm_Object_Item *it)
    void                     elm_naviframe_prev_btn_auto_pushed_set(Evas_Object *obj, Eina_Bool auto_pushed)
    Eina_Bool                elm_naviframe_prev_btn_auto_pushed_get(Evas_Object *obj)
    Eina_List               *elm_naviframe_items_get(Evas_Object *obj)
    void                     elm_naviframe_event_enabled_set(Evas_Object *obj, Eina_Bool enabled)
    Eina_Bool                elm_naviframe_event_enabled_get(Evas_Object *obj)
    Elm_Object_Item         *elm_naviframe_item_simple_push(Evas_Object *obj, Evas_Object *content)
    void                     elm_naviframe_item_simple_promote(Evas_Object *obj, Evas_Object *content)
