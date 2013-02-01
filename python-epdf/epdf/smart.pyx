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

from evas.c_evas cimport Object
from general cimport _ctouni, _cfruni

cdef class ESmartPDF(Object):
    def __init__(self, Object parent):
        self.obj = esmart_pdf_add(parent.evas.obj)

    def init(self):
        return bool(esmart_pdf_init(self.obj))

    property file:
        def __set__(self, filename):
            r = esmart_pdf_file_set(self.obj, _cfruni(filename))
            if not r:
                raise RuntimeError("Setting file failed")

        def __get__(self):
            return _ctouni(esmart_pdf_file_get(self.obj))

    property page:
        def __set__(self, int page):
            esmart_pdf_page_set(self.obj, page)

        def __get__(self):
            return esmart_pdf_page_get(self.obj)

    property size:
        def __get__(self):
            cdef int width, height
            esmart_pdf_size_get(self.obj, &width, &height)
            return width, height

    property orientation:
        def __set__(self, o):
            esmart_pdf_orientation_set(self.obj, o)

        def __get__(self):
            return esmart_pdf_orientation_get(self.obj)

    property page_scale:
        def __set__(self, scale):
            hscale, vscale = scale
            esmart_pdf_scale_set(self.obj, hscale, vscale)

        def __get__(self):
            cdef double hscale, vscale
            esmart_pdf_scale_get(self.obj, &hscale, &vscale)
            return hscale, vscale

    def page_next(self):
        esmart_pdf_page_next(self.obj)

    def page_previous(self):
        esmart_pdf_page_previous(self.obj)

    def render(self):
        esmart_pdf_render(self.obj)

    property epdf_document:
        def __get__(self):
            # TODO: Epdf_Document *         esmart_pdf_pdf_document_get(self.obj)
            return None

    property epdf_page:
        def __get__(self):
            # TODO: Epdf_Page *             esmart_pdf_pdf_page_get(self.obj)
            return None

    property epdf_index:
        def __get__(self):
            # TODO: Eina_List *             esmart_pdf_pdf_index_get(self.obj)
            return None
