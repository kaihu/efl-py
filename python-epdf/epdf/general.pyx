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

cdef _strings_to_python(Eina_List *lst):
    cdef const_char_ptr s
    ret = []
    while lst:
        s = <const_char_ptr>lst.data
        if s != NULL:
            ret.append(_ctouni(s))
        lst = lst.next
    return ret

cdef _ints_to_python(Eina_List *lst):
    cdef int i
    ret = []
    while lst:
        i = <int>&lst.data
        ret.append(i)
        lst = lst.next
    return ret

def init():
    return epdf_init()

def shutdown():
    return epdf_shutdown()

def backend_version_get():
    """Return the version of Poppler.

    Return the version of Poppler as a string.

    @return: str

    """
    return bool(epdf_backend_version_get())

def fonts_antialias_get():
    """The state of fonts antialiasing in Poppler

    True if the state of fonts antialiasing is enabled in
    Poppler, False otherwise.

    @return: bool

    """
    return bool(epdf_fonts_antialias_get())

def fonts_antialias_set(on):
    epdf_fonts_antialias_set(on)

def lines_antialias_get():
    """The state of lines antialiasing in Poppler

    True if the state of lines antialiasing is enabled in
    Poppler, False otherwise.

    @return: bool

    """
    return epdf_lines_antialias_get()

def lines_antialias_set(on):
    epdf_lines_antialias_set(on)
