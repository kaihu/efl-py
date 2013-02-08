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

from evas.c_evas cimport Eina_Bool, Eina_List

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Epdf.h":
    int             epdf_init                   ()
    int             epdf_shutdown               ()
    const_char_ptr  epdf_backend_version_get    ()
    Eina_Bool       epdf_fonts_antialias_get    ()
    void            epdf_fonts_antialias_set    (Eina_Bool on)
    Eina_Bool       epdf_lines_antialias_get    ()
    void            epdf_lines_antialias_set    (Eina_Bool on)

cdef inline unicode _touni(char* s)
cdef inline unicode _ctouni(const_char_ptr s)
cdef inline char* _fruni(s)
cdef inline const_char_ptr _cfruni(s)
cdef _strings_to_python(Eina_List *lst)
cdef _ints_to_python(Eina_List *lst)
