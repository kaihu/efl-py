# Copyright (C) 2007-2008 Gustavo Sverzut Barbieri, Caio Marcelo de Oliveira Filho, Ulisses Furquim
#
# This file is part of Python-Evas.
#
# Python-Evas is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# Python-Evas is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this Python-Evas.  If not, see <http://www.gnu.org/licenses/>.

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"
    ctypedef void const_void "const void"

cdef extern from "Evas.h":
    ####################################################################
    # Basic Types
    #

    ctypedef unsigned char Eina_Bool
    ctypedef int Evas_Coord
    ctypedef int Evas_Angle


    ####################################################################
    # Enumerations
    #

    ctypedef enum Evas_Layer:
        EVAS_LAYER_MIN = -32768
        EVAS_LAYER_MAX =  32767


    ctypedef enum Evas_Pixel_Format:
        EVAS_PIXEL_FORMAT_NONE        = 0
        EVAS_PIXEL_FORMAT_ARGB32      = 1
        EVAS_PIXEL_FORMAT_YUV420P_601 = 2


    ctypedef enum Evas_Color_Space:
        EVAS_COLOR_SPACE_ARGB = 0
        EVAS_COLOR_SPACE_AHSV = 1


    ctypedef enum Evas_Texture:
        EVAS_TEXTURE_REFLECT          = 0
        EVAS_TEXTURE_REPEAT           = 1
        EVAS_TEXTURE_RESTRICT         = 2
        EVAS_TEXTURE_RESTRICT_REFLECT = 3
        EVAS_TEXTURE_RESTRICT_REPEAT  = 4
        EVAS_TEXTURE_PAD              = 5


    cdef enum Evas_Alloc_Error:
        EVAS_ALLOC_ERROR_NONE      = 0
        EVAS_ALLOC_ERROR_FATAL     = 1
        EVAS_ALLOC_ERROR_RECOVERED = 2


    cdef enum Evas_Load_Error:
        EVAS_LOAD_ERROR_NONE = 0
        EVAS_LOAD_ERROR_GENERIC = 1
        EVAS_LOAD_ERROR_DOES_NOT_EXIST = 2
        EVAS_LOAD_ERROR_PERMISSION_DENIED = 3
        EVAS_LOAD_ERROR_RESOURCE_ALLOCATION_FAILED = 4
        EVAS_LOAD_ERROR_CORRUPT_FILE = 5
        EVAS_LOAD_ERROR_UNKNOWN_FORMAT = 6


    ctypedef enum Evas_Button_Flags:
        EVAS_BUTTON_NONE
        EVAS_BUTTON_DOUBLE_CLICK
        EVAS_BUTTON_TRIPLE_CLICK

    ctypedef enum Evas_Font_Hinting_Flags:
        EVAS_FONT_HINTING_NONE
        EVAS_FONT_HINTING_AUTO
        EVAS_FONT_HINTING_BYTECODE


    ctypedef enum Evas_Render_Op:
        EVAS_RENDER_BLEND
        EVAS_RENDER_BLEND_REL
        EVAS_RENDER_COPY
        EVAS_RENDER_COPY_REL
        EVAS_RENDER_ADD
        EVAS_RENDER_ADD_REL
        EVAS_RENDER_SUB
        EVAS_RENDER_SUB_REL
        EVAS_RENDER_TINT
        EVAS_RENDER_TINT_REL
        EVAS_RENDER_MASK
        EVAS_RENDER_MUL


    ctypedef enum Evas_Aspect_Control:
        EVAS_ASPECT_CONTROL_NONE
        EVAS_ASPECT_CONTROL_NEITHER
        EVAS_ASPECT_CONTROL_HORIZONTAL
        EVAS_ASPECT_CONTROL_VERTICAL
        EVAS_ASPECT_CONTROL_BOTH


    ####################################################################
    # Structures
    #
    ctypedef struct Eina_List:
        void      *data
        Eina_List *next
        Eina_List *prev
        void      *accounting
    ctypedef Eina_List const_Eina_List "const Eina_List"


    ctypedef struct Eina_Rectangle:
        int x
        int y
        int w
        int h

    ctypedef int Eina_Error

    ctypedef struct Evas_Point:
        int x
        int y

    ctypedef struct Evas_Coord_Point: # Evas_Coord is int now
        Evas_Coord x
        Evas_Coord y

    ctypedef struct Evas_Coord_Precision_Point: # Evas_Coord is int now
        Evas_Coord x
        Evas_Coord y
        double xsub
        double ysub

    ctypedef struct Evas_Position:
        Evas_Point output
        Evas_Coord_Point canvas

    ctypedef struct Evas_Precision_Position:
        Evas_Point output
        Evas_Coord_Precision_Point canvas

    ctypedef struct Evas_Hash
    ctypedef struct Evas_Modifier
    ctypedef struct Evas_Lock

    ctypedef struct Evas_Device

    ####################################################################
    # Engine
    #
    int evas_init()
    int evas_shutdown()

    ctypedef int (*Eina_Compare_Cb)(const_void *data1, const_void *data2)

    Eina_List *eina_list_free(Eina_List *list)
    Eina_List *eina_list_append(Eina_List *list, void *data)
    Eina_List *eina_list_prepend(Eina_List *list, void *data)
    Eina_List *eina_list_append(Eina_List *list, void *data)
    Eina_List *eina_list_prepend(Eina_List *list, void *data)
    Eina_List *eina_list_append_relative(Eina_List *list, void *data, void *relative)
    Eina_List *eina_list_append_relative_list(Eina_List *list, void *data, Eina_List *relative)
    Eina_List *eina_list_prepend_relative(Eina_List *list, void *data, void *relative)
    Eina_List *eina_list_prepend_relative_list(Eina_List *list, void *data, Eina_List *relative)
    Eina_List *eina_list_sorted_insert(Eina_List *list, Eina_Compare_Cb func, void *data)
    Eina_List *eina_list_remove(Eina_List *list, void *data)
    Eina_List *eina_list_remove_list(Eina_List *list, Eina_List *remove_list)
    Eina_List *eina_list_promote_list(Eina_List *list, Eina_List *move_list)
    Eina_List *eina_list_demote_list(Eina_List *list, Eina_List *move_list)
    void *eina_list_data_find(Eina_List *list, void *data)
    Eina_List *eina_list_data_find_list(Eina_List *list, void *data)
    Eina_List *eina_list_free(Eina_List *list)
    void *eina_list_nth(Eina_List *list, unsigned int n)
    Eina_List *eina_list_nth_list(Eina_List *list, unsigned int n)
    Eina_List *eina_list_reverse(Eina_List *list)
    Eina_List *eina_list_reverse_clone(Eina_List *list)
    Eina_List *eina_list_clone(Eina_List *list)
    Eina_List *eina_list_sort(Eina_List *list, unsigned int size, Eina_Compare_Cb func)
    Eina_List *eina_list_merge(Eina_List *left, Eina_List *right)
    Eina_List *eina_list_sorted_merge(Eina_List *left, Eina_List *right, Eina_Compare_Cb func)
    Eina_List *eina_list_split_list(Eina_List *list, Eina_List *relative, Eina_List **right)
    Eina_List *eina_list_search_sorted_near_list(Eina_List *list, Eina_Compare_Cb func, void *data, int *result_cmp)
    Eina_List *eina_list_search_sorted_list(Eina_List *list, Eina_Compare_Cb func, void *data)
    void *eina_list_search_sorted(Eina_List *list, Eina_Compare_Cb func, void *data)
    Eina_List *eina_list_search_unsorted_list(Eina_List *list, Eina_Compare_Cb func, void *data)
    void *eina_list_search_unsorted(Eina_List *list, Eina_Compare_Cb func, void *data)
    Eina_List *eina_list_last(Eina_List *list)
    Eina_List *eina_list_next(Eina_List *list)
    Eina_List *eina_list_prev(Eina_List *list)
    void *eina_list_data_get(Eina_List *list)
    unsigned int eina_list_count(Eina_List *list)

    ####################################################################
    # Eina Iterator
    #
    ctypedef struct Eina_Iterator:
        Eina_Bool (*next)(Eina_Iterator *it, void **data)
        void *(*get_container)(Eina_Iterator *it)
        void (*free)(Eina_Iterator *it)

    Eina_Bool eina_iterator_next(Eina_Iterator *iterator, void **data)
    void eina_iterator_free(Eina_Iterator *iterator)

    ctypedef struct Eina_Hash_Tuple:
        void *key
        void *data
        unsigned int key_length
    ctypedef Eina_Hash_Tuple const_Eina_Hash_Tuple "const Eina_Hash_Tuple"

    ####################################################################
    # Eina Error
    #

    Eina_Error eina_error_get()
    void eina_error_set(Eina_Error err)
    const_char_ptr eina_error_msg_get(Eina_Error error)

    void evas_color_argb_premul(int a, int *r, int *g, int *b)
    void evas_color_argb_unpremul(int a, int *r, int *g, int *b)

    void evas_color_hsv_to_rgb(float h, float s, float v, int *r, int *g, int *b)
    void evas_color_rgb_to_hsv(int r, int g, int b, float *h, float *s, float *v)


cdef unicode _touni(char* s)
cdef unicode _ctouni(const_char_ptr s)
cdef char* _fruni(s)
cdef const_char_ptr _cfruni(s)

#cdef color_parse(desc, is_premul)
