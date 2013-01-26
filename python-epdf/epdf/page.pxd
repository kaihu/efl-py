# Copyright 2013 Kai Huuhko <kai.huuhko@gmail.com>
#
# This file is part of Python-Epdf.
#
# Python-Epdf is free software you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation either
# version 2.1 of the License, or (at your option) any later version.
#
# Python-Epdf is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this Python-Epdf.  If not, see <http://www.gnu.org/licenses/>.

from evas.c_evas cimport Eina_List, Evas_Object
from enums cimport *

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Epdf.h":

    ctypedef struct Epdf_Page
    ctypedef struct Epdf_Document
    ctypedef struct Epdf_Page_Transition

    ctypedef struct Epdf_Rectangle:
        double x1
        double y1
        double x2
        double y2

    Epdf_Page *             epdf_page_new (Epdf_Document *doc)
    void                    epdf_page_delete (Epdf_Page *page)
    void                    epdf_page_render (Epdf_Page   *page, Evas_Object *o)
    void                    epdf_page_render_slice (Epdf_Page *page, Evas_Object *o, int x, int y, int w, int h)
    void                    epdf_page_page_set (Epdf_Page *page, int p)
    int                     epdf_page_page_get (Epdf_Page *page)
    #char *                  epdf_page_text_get (Epdf_Page *page, Epdf_Rectangle r)
    Eina_List *             epdf_page_text_find (Epdf_Page *page, const_char_ptr text, unsigned char is_case_sensitive)
    Epdf_Page_Transition *  epdf_page_transition_get (Epdf_Page *page)
    void                    epdf_page_size_get (Epdf_Page *page, int *width, int *height)
    void                    epdf_page_scale_set (Epdf_Page *page, double hscale, double vscale)
    void                    epdf_page_scale_get (Epdf_Page *page, double *hscale, double *vscale)
    void                    epdf_page_orientation_set (Epdf_Page *page, Epdf_Page_Orientation orientation)
    Epdf_Page_Orientation   epdf_page_orientation_get (Epdf_Page *page)
