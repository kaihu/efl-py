# Copyright (C) 2007-2008 Gustavo Sverzut Barbieri, Ulisses Furquim
#
# This file is part of Python-Evas.
#
# Python-Evas is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# Python-Evas is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this Python-Evas.  If not, see <http://www.gnu.org/licenses/>.

# This file is included verbatim by c_evas.pyx


cdef class Polygon(Object):

    def __init__(self, Canvas canvas not None, **kargs):
        self._set_obj(evas_object_polygon_add(canvas.obj))
        self._set_common_params(**kargs)

    def _set_common_params(self, points=None, **kargs):
        Object._set_common_params(self, **kargs)
        if points:
            for x, y in points:
                self.point_add(x, y)

    def point_add(self, int x, int y):
        evas_object_polygon_point_add(self.obj, x, y)

    def points_clear(self):
        evas_object_polygon_points_clear(self.obj)


_object_mapping_register("Evas_Object_Polygon", Polygon)
