from evas.object cimport Evas_Object
from layout_class cimport LayoutClass
from object cimport Object
from object_item cimport Elm_Object_Item

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    ctypedef enum Elm_Colorselector_Mode:
        ELM_COLORSELECTOR_PALETTE
        ELM_COLORSELECTOR_COMPONENTS
        ELM_COLORSELECTOR_BOTH

    # Colorselector         (api:DONE  cb:DONE  test:DONE  doc:DONE  py3:DONE)
    Evas_Object             *elm_colorselector_add(Evas_Object *parent)
    void                     elm_colorselector_color_set(Evas_Object *obj, int r, int g, int b, int a)
    void                     elm_colorselector_color_get(Evas_Object *obj, int *r, int *g, int *b, int *a)
    void                     elm_colorselector_mode_set(Evas_Object *obj, Elm_Colorselector_Mode mode)
    Elm_Colorselector_Mode   elm_colorselector_mode_get(Evas_Object *obj)
    void                     elm_colorselector_palette_item_color_get(Elm_Object_Item *it, int *r, int *g, int *b, int *a)
    void                     elm_colorselector_palette_item_color_set(Elm_Object_Item *it, int r, int g, int b, int a)
    Elm_Object_Item         *elm_colorselector_palette_color_add(Evas_Object *obj, int r, int g, int b, int a)
    void                     elm_colorselector_palette_clear(Evas_Object *obj)
    void                     elm_colorselector_palette_name_set(Evas_Object *obj, const_char_ptr palette_name)
    const_char_ptr           elm_colorselector_palette_name_get(Evas_Object *obj)

