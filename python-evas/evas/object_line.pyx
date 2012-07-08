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

include "object_header.pxi"

cdef class Line(Object):
    """

    A straight line.

    :param canvas: Evas canvas for this object
    :type canvas: Canvas
    :keyword size: Width and height
    :type size: tuple of ints
    :keyword pos: X and Y
    :type pos: tuple of ints
    :keyword geometry: X, Y, width, height
    :type geometry: tuple of ints
    :keyword color: R, G, B, A
    :type color: tuple of ints
    :keyword name: Object name
    :type name: string
    :keyword start: Start coordinates
    :type file: tuple of ints
    :keyword end: End coordinates
    :type end: tuple of ints

    """
    def __init__(self, Canvas canvas not None, **kargs):
        Object.__init__(self, canvas)
        if self.obj == NULL:
            self._set_obj(evas_object_line_add(self.evas.obj))
        self._set_common_params(**kargs)

    def _set_common_params(self, start=None, end=None, geometry=None,
                           size=None, pos=None, **kargs):
        if start and end:
            x1 = start[0]
            y1 = start[1]
            x2 = end[0]
            y2 = end[1]

            w = x2 - x1
            h = y2 - y1
            if w < 0:
                w = -w
                x = x2
            else:
                x = x1

            if h < 0:
                h = -h
                y = y2
            else:
                y = y1

            self.xy_set(x1, y1, x2, y2)

            if not geometry:
                if not size:
                    self.size_set(w, h)
                if not pos:
                    self.pos_set(x, y)

        elif start:
            self.start = start
        elif end:
            self.end = end
        Object._set_common_params(self, geometry=geometry, size=size,
                                  pos=pos, **kargs)

    property xy:
        def __set__(self, value):
            x1, y1, x2, y2 = value
            evas_object_line_xy_set(self.obj, x1, y1, x2, y2)

        def __get__(self):
            cdef int x1, y1, x2, y2
            evas_object_line_xy_get(self.obj, &x1, &y1, &x2, &y2)
            return (x1, y1, x2, y2)

    def xy_set(self, int x1, int y1, int x2, int y2):
        evas_object_line_xy_set(self.obj, x1, y1, x2, y2)
    def xy_get(self):
        cdef int x1, y1, x2, y2
        evas_object_line_xy_get(self.obj, &x1, &y1, &x2, &y2)
        return (x1, y1, x2, y2)

    property start:
        def __set__(self, spec):
            cdef int x1, y1, x2, y2
            x1, y1 = spec
            evas_object_line_xy_get(self.obj, NULL, NULL, &x2, &y2)
            evas_object_line_xy_set(self.obj, x1, y1, x2, y2)

        def __get__(self):
            cdef int x1, y1
            evas_object_line_xy_get(self.obj, &x1, &y1, NULL, NULL)
            return (x1, y1)

    def start_set(self, x1, y1):
        cdef int x2, y2
        evas_object_line_xy_get(self.obj, NULL, NULL, &x2, &y2)
        evas_object_line_xy_set(self.obj, x1, y1, x2, y2)
    def start_get(self):
        cdef int x1, y1
        evas_object_line_xy_get(self.obj, &x1, &y1, NULL, NULL)
        return (x1, y1)

    property end:
        def __set__(self, spec):
            cdef int x1, y1, x2, y2
            x2, y2 = spec
            evas_object_line_xy_get(self.obj, &x1, &y1, NULL, NULL)
            evas_object_line_xy_set(self.obj, x1, y1, x2, y2)

        def __get__(self):
            cdef int x2, y2
            evas_object_line_xy_get(self.obj, NULL, NULL, &x2, &y2)
            return (x2, y2)

    def end_set(self, x2, y2):
        cdef int x1, y1
        evas_object_line_xy_get(self.obj, &x1, &y1, NULL, NULL)
        evas_object_line_xy_set(self.obj, x1, y1, x2, y2)
    def end_get(self):
        cdef int x2, y2
        evas_object_line_xy_get(self.obj, NULL, NULL, &x2, &y2)
        return (x2, y2)

_install_metaclass(Line)
