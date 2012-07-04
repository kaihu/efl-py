# Copyright (C) 2007-2008 Gustavo Sverzut Barbieri, Ulisses Furquim
#
# This file is part of Python-Edje.
#
# Python-Edje is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# Python-Edje is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this Python-Edje.  If not, see <http://www.gnu.org/licenses/>.

from cpython cimport bool
cimport cpython

from evas.general cimport Eina_Bool, Eina_List, eina_error_get, eina_error_msg_get
from evas.canvas cimport Canvas

from libc.stdlib cimport free

__extra_epydoc_fields__ = (
    ("parm", "Parameter", "Parameters"), # epydoc don't support pyrex properly
    )

include "edit_object.pxi"
include "edit_object_group.pxi"
include "edit_object_color_class.pxi"
include "edit_object_text_style.pxi"
include "edit_object_programs.pxi"
include "edit_object_part.pxi"
include "edit_object_state.pxi"



