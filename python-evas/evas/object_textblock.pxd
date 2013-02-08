from canvas cimport Evas
from object cimport Evas_Object, const_Evas_Object, Object
from general cimport Evas_Coord, Eina_Bool, Eina_List

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"
    ctypedef void const_void "const void"

cdef extern from "Evas.h":

    ctypedef enum Evas_Textblock_Text_Type:
        EVAS_TEXTBLOCK_TEXT_RAW
        EVAS_TEXTBLOCK_TEXT_PLAIN

    ctypedef struct Evas_Textblock_Style
    ctypedef Evas_Textblock_Style const_Evas_Textblock_Style "const Evas_Textblock_Style"
    ctypedef struct Evas_Textblock_Cursor
    ctypedef Evas_Textblock_Cursor const_Evas_Textblock_Cursor "const Evas_Textblock_Cursor"

    ####################################################################
    # Textblock Object (py3:TODO)
    #
    Evas_Object *evas_object_textblock_add(Evas *e)
    Evas_Textblock_Style *evas_textblock_style_new()
    void evas_textblock_style_free(Evas_Textblock_Style *ts)
    void evas_textblock_style_set(Evas_Textblock_Style *ts, const_char_ptr text)
    const_char_ptr evas_textblock_style_get(const_Evas_Textblock_Style *ts)
    void evas_object_textblock_style_set(Evas_Object *obj, Evas_Textblock_Style *ts)
    Evas_Textblock_Style *evas_object_textblock_style_get(const_Evas_Object *obj)
    void evas_object_textblock_replace_char_set(Evas_Object *obj, const_char_ptr ch)
    const_char_ptr evas_object_textblock_replace_char_get(const_Evas_Object *obj)
    const_char_ptr evas_textblock_escape_string_get(const_char_ptr escape)
    const_char_ptr evas_textblock_string_escape_get(const_char_ptr string, int *len_ret)
    void evas_object_textblock_text_markup_set(Evas_Object *obj, const_char_ptr text)
    void evas_object_textblock_text_markup_prepend(Evas_Textblock_Cursor *cur, const_char_ptr text)
    const_char_ptr evas_object_textblock_text_markup_get(const_Evas_Object *obj)
    Evas_Textblock_Cursor *evas_object_textblock_cursor_get(const_Evas_Object *obj)
    Evas_Textblock_Cursor *evas_object_textblock_cursor_new(Evas_Object *obj)
    void evas_textblock_cursor_free(Evas_Textblock_Cursor *cur)
    void evas_textblock_cursor_node_first(Evas_Textblock_Cursor *cur)
    void evas_textblock_cursor_node_last(Evas_Textblock_Cursor *cur)
    Eina_Bool evas_textblock_cursor_node_next(Evas_Textblock_Cursor *cur)
    Eina_Bool evas_textblock_cursor_node_prev(Evas_Textblock_Cursor *cur)
    Eina_Bool evas_textblock_cursor_char_next(Evas_Textblock_Cursor *cur)
    Eina_Bool evas_textblock_cursor_char_prev(Evas_Textblock_Cursor *cur)
    void evas_textblock_cursor_char_first(Evas_Textblock_Cursor *cur)
    void evas_textblock_cursor_char_last(Evas_Textblock_Cursor *cur)
    void evas_textblock_cursor_line_first(Evas_Textblock_Cursor *cur)
    void evas_textblock_cursor_line_last(Evas_Textblock_Cursor *cur)
    int evas_textblock_cursor_pos_get(const_Evas_Textblock_Cursor *cur)
    void evas_textblock_cursor_pos_set(Evas_Textblock_Cursor *cur, int pos)
    Eina_Bool evas_textblock_cursor_line_set(Evas_Textblock_Cursor *cur, int line)
    int evas_textblock_cursor_compare(Evas_Textblock_Cursor *cur1, Evas_Textblock_Cursor *cur2)
    void evas_textblock_cursor_copy(Evas_Textblock_Cursor *cur, Evas_Textblock_Cursor *cur_dest)
    void evas_textblock_cursor_text_append(Evas_Textblock_Cursor *cur, const_char_ptr text)
    void evas_textblock_cursor_text_prepend(Evas_Textblock_Cursor *cur, const_char_ptr text)
    void evas_textblock_cursor_format_append(Evas_Textblock_Cursor *cur, const_char_ptr format)
    void evas_textblock_cursor_format_prepend(Evas_Textblock_Cursor *cur, const_char_ptr format)
    void evas_textblock_cursor_node_delete(Evas_Textblock_Cursor *cur)
    void evas_textblock_cursor_char_delete(Evas_Textblock_Cursor *cur)
    void evas_textblock_cursor_range_delete(Evas_Textblock_Cursor *cur1, Evas_Textblock_Cursor *cur2)
    const_char_ptr evas_textblock_cursor_node_text_get(const_Evas_Textblock_Cursor *cur)
    int evas_textblock_cursor_node_text_length_get(const_Evas_Textblock_Cursor *cur)
    const_char_ptr evas_textblock_cursor_node_format_get(const_Evas_Textblock_Cursor *cur)
    Eina_Bool evas_textblock_cursor_node_format_is_visible_get(const_Evas_Textblock_Cursor *cur)
    const_char_ptr evas_textblock_cursor_range_text_get(const_Evas_Textblock_Cursor *cur1, Evas_Textblock_Cursor *cur2, Evas_Textblock_Text_Type format)
    int evas_textblock_cursor_char_geometry_get(const_Evas_Textblock_Cursor *cur, Evas_Coord *cx, Evas_Coord *cy, Evas_Coord *cw, Evas_Coord *ch)
    int evas_textblock_cursor_line_geometry_get(const_Evas_Textblock_Cursor *cur, Evas_Coord *cx, Evas_Coord *cy, Evas_Coord *cw, Evas_Coord *ch)
    Eina_Bool evas_textblock_cursor_char_coord_set(Evas_Textblock_Cursor *cur, Evas_Coord x, Evas_Coord y)
    int evas_textblock_cursor_line_coord_set(Evas_Textblock_Cursor *cur, Evas_Coord y)
    Eina_List *evas_textblock_cursor_range_geometry_get(const_Evas_Textblock_Cursor *cur1, Evas_Textblock_Cursor *cur2)
    Eina_Bool evas_object_textblock_line_number_geometry_get(const_Evas_Object *obj, int line, Evas_Coord *cx, Evas_Coord *cy, Evas_Coord *cw, Evas_Coord *ch)
    void evas_object_textblock_clear(Evas_Object *obj)
    void evas_object_textblock_size_formatted_get(const_Evas_Object *obj, Evas_Coord *w, Evas_Coord *h)
    void evas_object_textblock_size_native_get(const_Evas_Object *obj, Evas_Coord *w, Evas_Coord *h)
    void evas_object_textblock_style_insets_get(const_Evas_Object *obj, Evas_Coord *l, Evas_Coord *r, Evas_Coord *t, Evas_Coord *b)

cdef class Textblock(Object):
    pass
