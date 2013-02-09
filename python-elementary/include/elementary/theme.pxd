# Copyright 2012 Kai Huuhko <kai.huuhko@gmail.com>
#
# This file is part of python-elementary.
#
# python-elementary is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# python-elementary is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with python-elementary.  If not, see <http://www.gnu.org/licenses/>.
#

from evas.c_evas cimport Eina_Bool, Eina_List

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Elementary.h":

    #theme
    ctypedef struct Elm_Theme

    # Theme
    Elm_Theme               *elm_theme_new()
    void                     elm_theme_free(Elm_Theme *th)
    void                     elm_theme_copy(Elm_Theme *th, Elm_Theme *thdst)
    void                     elm_theme_ref_set(Elm_Theme *th, Elm_Theme *thref)
    Elm_Theme               *elm_theme_ref_get(Elm_Theme *th)
    Elm_Theme               *elm_theme_default_get()
    void                     elm_theme_overlay_add(Elm_Theme *th, char *item)
    void                     elm_theme_overlay_del(Elm_Theme *th, char *item)
    Eina_List               *elm_theme_overlay_list_get(Elm_Theme *th)
    void                     elm_theme_extension_add(Elm_Theme *th, char *item)
    void                     elm_theme_extension_del(Elm_Theme *th, char *item)
    Eina_List               *elm_theme_extension_list_get(Elm_Theme *th)
    void                     elm_theme_set(Elm_Theme *th, char *theme)
    char                    *elm_theme_get(Elm_Theme *th)
    Eina_List               *elm_theme_list_get(Elm_Theme *th)
    char                    *elm_theme_list_item_path_get(char *f, Eina_Bool *in_search_path)
    void                     elm_theme_flush(Elm_Theme *th)
    void                     elm_theme_full_flush()
    Eina_List               *elm_theme_name_available_list_new()
    void                     elm_theme_name_available_list_free(Eina_List *list)
    char                    *elm_theme_data_get(Elm_Theme *th, char *key)

cdef class Theme(object):
    cdef Elm_Theme *th
