from evas.c_evas cimport Eina_Bool
from evas.c_evas cimport Evas_Object, Evas_Coord
from layout_class cimport LayoutClass
from object cimport Object

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Elementary.h":

    ctypedef enum Elm_Bg_Option:
        ELM_BG_OPTION_CENTER
        ELM_BG_OPTION_SCALE
        ELM_BG_OPTION_STRETCH
        ELM_BG_OPTION_TILE
        ELM_BG_OPTION_LAST

    # Background            (api:DONE  cb:N/A   test:DONE  doc:DONE  py3:DONE)
    Evas_Object             *elm_bg_add(Evas_Object *parent)
    Eina_Bool                elm_bg_file_set(Evas_Object *obj, const_char_ptr file, const_char_ptr group)
    void                     elm_bg_file_get(Evas_Object *obj, const_char_ptr *file, const_char_ptr *group)
    void                     elm_bg_option_set(Evas_Object *obj, Elm_Bg_Option option)
    Elm_Bg_Option            elm_bg_option_get(Evas_Object *obj)
    void                     elm_bg_color_set(Evas_Object *obj, int r, int g, int b)
    void                     elm_bg_color_get(Evas_Object *obj, int *r, int *g, int *b)
    void                     elm_bg_load_size_set(Evas_Object *obj, Evas_Coord w, Evas_Coord h)

