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

from evas.c_evas cimport Object, Canvas

cdef unicode _touni(char* s):
    return s.decode('UTF-8', 'strict')

cdef unicode _ctouni(const_char_ptr s):
    return s.decode('UTF-8', 'strict')

cdef char* _fruni(s):
    cdef char* c_string
    if not s:
        return NULL
    if isinstance(s, unicode):
        string = s.encode('UTF-8')
        c_string = string
    elif isinstance(s, str):
        c_string = s
    else:
        raise TypeError("Expected str or unicode object, got %s" % (type(s).__name__))
    return c_string

cdef const_char_ptr _cfruni(s):
    cdef const_char_ptr c_string
    if not s:
        return NULL
    if isinstance(s, unicode):
        string = s.encode('UTF-8')
        c_string = string
    elif isinstance(s, str):
        c_string = s
    else:
        raise TypeError("Expected str or unicode object, got %s" % (type(s).__name__))
    return c_string

def init():
    return bool(eyesight_init())

def shutdown():
    return bool(eyesight_shutdown())

cdef class Eyesight(Object):
    def __init__(self, Object parent, *a, **ka):
        Object.__init__(self, parent.evas)
        self.obj = eyesight_object_add(parent.evas.obj)

    property file:
        def __set__(self, filename):
            r = bool(eyesight_object_file_set(self.obj, _cfruni(filename)))
            if not r:
                raise RuntimeError("File %s could not be set" % filename)

        def __get__(self):
            return _ctouni(eyesight_object_file_get(self.obj))

    property is_locked:
        def __get__(self):
            return bool(eyesight_object_document_is_locked(self.obj))

    property password:
        def __set__(self, password):
            r = bool(eyesight_object_document_password_set(self.obj, _cfruni(password)))
            if not r:
                raise RuntimeError("Password could not be set." % password)

    property document:
        def __get__(self):
            return None
            # TODO: void * eyesight_object_document_get(self.obj)

    property toc:
        def __get__(self):
            return None
            # TODO: Eina_List * eyesight_object_toc_get(self.obj)

    property page_count:
        def __get__(self):
            return eyesight_object_page_count(self.obj)

    property page:
        def __set__(self, int page):
            eyesight_object_page_set(self.obj, page)

        def __get__(self):
            return eyesight_object_page_get(self.obj)

    property page_scale:
        def __set__(self, scale):
            hscale, vscale = scale
            eyesight_object_page_scale_set(self.obj, hscale, vscale)

        def __get__(self):
            cdef double hscale, vscale
            eyesight_object_page_scale_get(self.obj, &hscale, &vscale)
            return hscale, vscale

    property page_orientation:
        def __set__(self, orientation):
            eyesight_object_page_orientation_set(self.obj, orientation)

        def __get__(self):
            return eyesight_object_page_orientation_get(self.obj)

    property page_size:
        def __get__(self):
            cdef int width, height
            eyesight_object_page_size_get(self.obj, &width, &height)
            return width, height

    def render(self):
        eyesight_object_page_render(self.obj)

    def text_get(self, rect):
        return None
        # TODO: return _touni(eyesight_object_page_text_get(self.obj, rect))

    def text_find(self, text, is_case_sensitive, backward):
        return None
        # TODO: Eina_List * eyesight_object_page_text_find(self.obj, const_char_ptr text, Eina_Bool is_case_sensitive, Eina_Bool backward)

    property links:
        def __get__(self):
            return None
            # TODO:
            #Eina_List * eyesight_object_page_links_get(self.obj)

# TODO: Is this implemented yet?
#~ cdef class EyesightItem(object):
#~     cdef Eyesight_Index_Item * item
#~     def __cinit__(self, *a, **ka):
#~         self.item = NULL
#~     def __init__(self, *a, **ka):
#~
#~     property title:
#~         def __get__(self):
#~             return eyesight_index_item_title_get(self.item)
#~
#~     property action_kind:
#~         def __get__(self):
#~     Eyesight_Link_Action_Kind   eyesight_index_item_action_kind_get(self.item)
#~
#~     property page:
#~         def __get__(self):
#~     int                         eyesight_index_item_page_get(self.item)
#~
#~     property children:
#~         def __get__(self):
#~     Eina_List *                 eyesight_index_item_children_get(self.item)
#~
#~     property is_open:
#~         def __get__(self):
#~     Eina_Bool                   eyesight_index_item_is_open (self.item)
