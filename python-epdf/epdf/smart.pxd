# Copyright 2013 Kai Huuhko <kai.huuhko@gmail.com>
#
# This file is part of Python-Epdf.
#
# Python-Epdf is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# Python-Epdf is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this Python-Epdf.  If not, see <http://www.gnu.org/licenses/>.

from evas.c_evas cimport Evas, Evas_Object, Eina_List, Eina_Bool

from enums cimport *

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Epdf.h":
    ctypedef struct Epdf_Document
    ctypedef struct Epdf_Page
    ctypedef struct Smart_Pdf

    Evas_Object *           esmart_pdf_add(Evas *evas)
    Eina_Bool               esmart_pdf_init(Evas_Object *obj)

    int                     esmart_pdf_file_set(Evas_Object *obj, const_char_ptr filename)
    const_char_ptr          esmart_pdf_file_get(Evas_Object *obj)

    void                    esmart_pdf_page_set(Evas_Object *obj, int page)
    int                     esmart_pdf_page_get(Evas_Object *obj)

    void                    esmart_pdf_size_get(Evas_Object *obj, int *width, int *height)

    void                    esmart_pdf_orientation_set(Evas_Object *obj, Epdf_Page_Orientation o)
    Epdf_Page_Orientation   esmart_pdf_orientation_get(Evas_Object *obj)

    void                    esmart_pdf_scale_set(Evas_Object *obj, double hscale, double vscale)
    void                    esmart_pdf_scale_get(Evas_Object *obj, double *hscale, double *vscale)

    void                    esmart_pdf_page_next(Evas_Object *obj)
    void                    esmart_pdf_page_previous(Evas_Object *obj)

    void                    esmart_pdf_render(Evas_Object *obj)

    Epdf_Document *         esmart_pdf_pdf_document_get(Evas_Object *obj)
    Epdf_Page *             esmart_pdf_pdf_page_get(Evas_Object *obj)
    Eina_List *             esmart_pdf_pdf_index_get(Evas_Object *obj)

