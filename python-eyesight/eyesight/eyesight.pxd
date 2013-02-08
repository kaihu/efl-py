# Copyright 2013 Kai Huuhko <kai.huuhko@gmail.com>
#
# This file is part of Python-Eyesight.
#
# Python-Eyesight is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# Python-Eyesight is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this Python-Eyesight.  If not, see <http://www.gnu.org/licenses/>.

from evas.c_evas cimport Eina_Bool, Eina_List, Evas_Object, Evas, Eina_Rectangle

from enums cimport *

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Eyesight.h":
    ctypedef struct Eyesight_Index_Item
    ctypedef struct Eyesight_Link

    ctypedef struct Eyesight_Link_Action_Unknown
    ctypedef struct Eyesight_Link_Action_Goto
    ctypedef struct Eyesight_Link_Action_Goto_Remote_File
    ctypedef struct Eyesight_Link_Action_Launch
    ctypedef struct Eyesight_Link_Action_Uri
    ctypedef struct Eyesight_Link_Action_Named
    ctypedef struct Eyesight_Link_Action_Movie
    ctypedef struct Eyesight_Link_Action_Rendition
    ctypedef struct Eyesight_Link_Action_Sound
    ctypedef struct Eyesight_Link_Action_Javascript
    ctypedef struct Eyesight_Link_Action_OCG_State

    int eyesight_init()
    int eyesight_shutdown()

    Evas_Object *               eyesight_object_add(Evas *evas)
    Eina_Bool                   eyesight_object_file_set(Evas_Object *obj, const_char_ptr filename)
    const_char_ptr              eyesight_object_file_get(Evas_Object *obj)
    Eina_Bool                   eyesight_object_document_is_locked(Evas_Object *obj)
    Eina_Bool                   eyesight_object_document_password_set(Evas_Object *obj, const_char_ptr password)
    void *                      eyesight_object_document_get(Evas_Object *obj)
    Eina_List *                 eyesight_object_toc_get(Evas_Object *obj)
    int                         eyesight_object_page_count(Evas_Object *obj)

    void                        eyesight_object_page_set(Evas_Object *obj, int page)
    int                         eyesight_object_page_get(Evas_Object *obj)
    void                        eyesight_object_page_scale_set(Evas_Object *obj, double hscale, double vscale)
    void                        eyesight_object_page_scale_get(Evas_Object *obj, double *hscale, double *vscale)
    void                        eyesight_object_page_orientation_set(Evas_Object *obj, Eyesight_Orientation orientation)
    Eyesight_Orientation        eyesight_object_page_orientation_get(Evas_Object *obj)
    void                        eyesight_object_page_size_get(Evas_Object *obj, int *width, int *height)
    void                        eyesight_object_page_render(Evas_Object *obj)
    char *                      eyesight_object_page_text_get(Evas_Object *obj, Eina_Rectangle rect)
    Eina_List *                 eyesight_object_page_text_find(Evas_Object *obj, const_char_ptr text, Eina_Bool is_case_sensitive, Eina_Bool backward)
    Eina_List *                 eyesight_object_page_links_get(Evas_Object *obj)

    const_char_ptr              eyesight_index_item_title_get(Eyesight_Index_Item *item)
    Eyesight_Link_Action_Kind   eyesight_index_item_action_kind_get(Eyesight_Index_Item *item)
    int                         eyesight_index_item_page_get(Eyesight_Index_Item *item)
    Eina_List *                 eyesight_index_item_children_get(Eyesight_Index_Item *item)
    Eina_Bool                   eyesight_index_item_is_open (Eyesight_Index_Item *item)
