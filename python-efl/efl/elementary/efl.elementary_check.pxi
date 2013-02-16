# Copyright (c) 2008-2009 Simon Busch
#
# This file is part of python-elementary.
#
# python-elementary is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# python-elementary is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with python-elementary.  If not, see <http://www.gnu.org/licenses/>.
#

cdef class Check(LayoutClass):

    def __init__(self, evasObject parent):
        self._set_obj(elm_check_add(parent.obj))

    def state_set(self, value):
        if value:
            elm_check_state_set(self.obj, 1)
        else:
            elm_check_state_set(self.obj, 0)

    def state_get(self):
        cdef Eina_Bool state
        state = elm_check_state_get(self.obj)
        if state == 0:
            return False
        else:
            return True

    property state:
        def __get__(self):
            return bool(elm_check_state_get(self.obj))

        def __set__(self, value):
            elm_check_state_set(self.obj, value)

    def callback_changed_add(self, func, *args, **kwargs):
        self._callback_add("changed", func, *args, **kwargs)

    def callback_changed_del(self, func):
        self._callback_del("changed", func)


_object_mapping_register("elm_check", Check)
