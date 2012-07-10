from canvas cimport Evas
from object cimport Evas_Object, const_Evas_Object, Object
from general cimport Evas_Coord

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"
    ctypedef void const_void "const void"

cdef extern from "Evas.h":

    ctypedef enum Evas_Text_Style_Type:
        EVAS_TEXT_STYLE_PLAIN
        EVAS_TEXT_STYLE_SHADOW
        EVAS_TEXT_STYLE_OUTLINE
        EVAS_TEXT_STYLE_SOFT_OUTLINE
        EVAS_TEXT_STYLE_GLOW
        EVAS_TEXT_STYLE_OUTLINE_SHADOW
        EVAS_TEXT_STYLE_FAR_SHADOW
        EVAS_TEXT_STYLE_OUTLINE_SOFT_SHADOW
        EVAS_TEXT_STYLE_SOFT_SHADOW
        EVAS_TEXT_STYLE_FAR_SOFT_SHADOW

    ctypedef enum Evas_Text:
        EVAS_TEXT_INVALID = -1
        EVAS_TEXT_SPECIAL = -2

    ctypedef int Evas_Font_Size

    ####################################################################
    # Text Object (py3:TODO)
    #
    Evas_Object *evas_object_text_add(Evas *e)
    void evas_object_text_font_source_set(Evas_Object *obj, const_char_ptr font)
    const_char_ptr evas_object_text_font_source_get(const_Evas_Object *obj)
    void evas_object_text_font_set(Evas_Object *obj, const_char_ptr font, Evas_Font_Size size)
    void evas_object_text_font_get(const_Evas_Object *obj, const_char_ptr *font, Evas_Font_Size *size)
    void evas_object_text_text_set(Evas_Object *obj, const_char_ptr text)
    const_char_ptr evas_object_text_text_get(const_Evas_Object *obj)
    Evas_Coord evas_object_text_ascent_get(const_Evas_Object *obj)
    Evas_Coord evas_object_text_descent_get(const_Evas_Object *obj)
    Evas_Coord evas_object_text_max_ascent_get(const_Evas_Object *obj)
    Evas_Coord evas_object_text_max_descent_get(const_Evas_Object *obj)
    Evas_Coord evas_object_text_horiz_advance_get(const_Evas_Object *obj)
    Evas_Coord evas_object_text_vert_advance_get(const_Evas_Object *obj)
    Evas_Coord evas_object_text_inset_get(const_Evas_Object *obj)
    int evas_object_text_char_pos_get(const_Evas_Object *obj, int pos, Evas_Coord *cx, Evas_Coord *cy, Evas_Coord *cw, Evas_Coord *ch)
    int evas_object_text_char_coords_get(const_Evas_Object *obj, Evas_Coord x, Evas_Coord y, Evas_Coord *cx, Evas_Coord *cy, Evas_Coord *cw, Evas_Coord *ch)
    Evas_Text_Style_Type evas_object_text_style_get(const_Evas_Object *obj)
    void evas_object_text_style_set(Evas_Object *obj, Evas_Text_Style_Type type)
    void evas_object_text_shadow_color_set(Evas_Object *obj, int r, int g, int b, int a)
    void evas_object_text_shadow_color_get(const_Evas_Object *obj, int *r, int *g, int *b, int *a)
    void evas_object_text_glow_color_set(Evas_Object *obj, int r, int g, int b, int a)
    void evas_object_text_glow_color_get(const_Evas_Object *obj, int *r, int *g, int *b, int *a)
    void evas_object_text_glow2_color_set(Evas_Object *obj, int r, int g, int b, int a)
    void evas_object_text_glow2_color_get(const_Evas_Object *obj, int *r, int *g, int *b, int *a)
    void evas_object_text_outline_color_set(Evas_Object *obj, int r, int g, int b, int a)
    void evas_object_text_outline_color_get(const_Evas_Object *obj, int *r, int *g, int *b, int *a)
    void evas_object_text_style_pad_get(const_Evas_Object *obj, int *l, int *r, int *t, int *b)

cdef class Text(Object):
    pass
