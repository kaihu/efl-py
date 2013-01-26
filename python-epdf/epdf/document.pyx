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

from general cimport *

cdef class Document(object):
    def __cinit__(self, *a, **ka):
        self.obj = NULL

    def __init__(self, unicode filename):
        """Return a newly created Epdf_Document object
        @param filename The file name
        @return A pointer to a newly created Epdf_Document
        Return a newly created Epdf_Document object built from the
        PDF file whose name is @p filename. The result must be freed with
        epdf_document_delete().
        """
        self.obj = epdf_document_new(filename)

    def delete(self):
        """Delete an Epdf_Document object
        @param document The document to delete
        Delete the Epdf_Document @p document that has been created
        with epdf_document_new().
        """
        epdf_document_delete(self.obj)

    property page_count:
        """Return the count of the pages of the document
        @param document The document
        @return The count of the pages
        Return the count of the pages of the document @p document
        """
        def __get__(self):
            return epdf_document_page_count_get(self.obj)

#~     property page_mode:
#~         """Return the page mode of the document
#~         @param document The document
#~         @return The page mode
#~         Return the page mode of the document @p document
#~         """
#~         def __get__(self):
#~             return epdf_document_page_mode_get(self.obj)

    def unlock(self, unicode password):
        """Unlock the document
        @param document The document
        @param password
        @return 1 if the document has been unlocked, 0 otherwise
        Unlock the document @p document with the password @p password
        """
        return bool(epdf_document_unlock(self.obj, password))

    property is_locked:
        """Return whether the document is locked
        @param document The document
        @return 1 if the document is locked, 0 otherwise
        Return whether the document @p document is locked
        """
        def __get__(self):
            return bool(epdf_document_is_locked(self.obj))

    def document_info_get(self, unicode data):
        """To be implemented
        @param document The document
        @param data data
        @return @c NULL
        Return NULL
        """
        return epdf_document_info_get(self.obj, data)

    property is_encrypted:
        """Return wheter the document is encrypted
        @param document The document
        @return 1 if the document is encrypted, 0 otherwise
        Return wheter the document @p document is encrypted
        """
        def __get__(self):
            return bool(epdf_document_is_encrypted(self.obj))

    property is_linearized:
        """Return wheter the document is linearized
        @param document The document
        @return 1 if the document is linearized, 0 otherwise
        Return wheter the document @p document is linearized
        """
        def __get__(self):
            return bool(epdf_document_is_linearized(self.obj))

    property is_printable:
        """Return wheter the document is printable
        @param document The document
        @return 1 if the document is printable, 0 otherwise
        Return wheter the document @p document is printable
        """
        def __get__(self):
            return bool(epdf_document_is_printable(self.obj))

    property is_changeable:
        """Return wheter the document is changeable
        @param document The document
        @return 1 if the document is changeable, 0 otherwise
        Return wheter the document @p document is changeable
        """
        def __get__(self):
            return bool(epdf_document_is_changeable(self.obj))

    property is_copyable:
        """Return wheter the document is copyable
        @param document The document
        @return 1 if the document is copyable, 0 otherwise
        Return wheter the document @p document is copyable
        """
        def __get__(self):
            return bool(epdf_document_is_copyable(self.obj))

    property is_notable:
        """Return wheter the document is notable
        @param document The document
        @return 1 if the document is notable, 0 otherwise
        Return wheter the document @p document is notable
        """
        def __get__(self):
            return bool(epdf_document_is_notable(self.obj))

    property pdf_version:
        """Return the version of the pdf used in the document
        @param document The document
        @param major The major version of the pdf document
        @param minor The minor version of the pdf document
        Return the major and minor version of the pdf used in the document
        @p document respectively in @p major and @p minor.
        """
        def __get__(self):
            cdef int major, minor
            epdf_document_pdf_version_get(self.obj, &major, &minor)
            return major, minor

#~     property fonts:
#~         """Return a list of the fonts used in the document
#~         @param document The document
#~         @return The list of the fonts
#~         Return a list of the fonts used in the document @p document
#~         """
#~         def __get__(self):
#~             return _strings_to_python(epdf_document_fonts_get(self.obj))
#~
#~     def scan_for_fonts(self, int page_count):
#~         """Return a list of the fonts used in a page of the document
#~         @param document The document
#~         @param page_count The page count
#~         @return The list of the fonts
#~         Return a list of the fonts used in the document @p document in the
#~         page number @p page_count
#~         """
#~         return _strings_to_python(epdf_document_scan_for_fonts(self.obj, page_count))
