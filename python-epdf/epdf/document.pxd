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

from evas.c_evas cimport Eina_List

from enums cimport *

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "epdf_document.h":
    ctypedef struct Epdf_Document

    Epdf_Document *         epdf_document_new               (const_char_ptr filename)
    void                    epdf_document_delete            (Epdf_Document *document)
    int                     epdf_document_page_count_get    (Epdf_Document *document)
    #Epdf_Document_Page_Mode epdf_document_page_mode_get     (Epdf_Document *document)
    unsigned char           epdf_document_unlock            (Epdf_Document *document, const_char_ptr password)
    unsigned char           epdf_document_is_locked         (Epdf_Document *document)
    const_char_ptr          epdf_document_info_get          (Epdf_Document *document, const_char_ptr data)
    unsigned char           epdf_document_is_encrypted      (Epdf_Document *document)
    unsigned char           epdf_document_is_linearized     (Epdf_Document *document)
    unsigned char           epdf_document_is_printable      (Epdf_Document *document)
    unsigned char           epdf_document_is_changeable     (Epdf_Document *document)
    unsigned char           epdf_document_is_copyable       (Epdf_Document *document)
    unsigned char           epdf_document_is_notable        (Epdf_Document *document)
    void                    epdf_document_pdf_version_get   (Epdf_Document *document, int *major, int *minor)
    #Eina_List *             epdf_document_fonts_get         (Epdf_Document *document)
    #Eina_List *             epdf_document_scan_for_fonts    (Epdf_Document *document, int page_count)

# TODO: Metadata functions


cdef class Document(object):
    cdef Epdf_Document * obj
