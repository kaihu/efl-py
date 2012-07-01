# Copyright (C) 2010 Boris Faure
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

cdef class Box(Object):

    """A box is a convenience smart object that packs children inside it in
    B{sequence}, using a layouting function specified by the user.

    There are a couple of pre-made layouting functions B{built-in in Evas},
    all of them using children size hints to define their size and alignment
    inside their cell space.


    :param canvas: The evas canvas for this object
    :type canvas: L{Canvas}
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

    """

    def __init__(self, Canvas canvas not None, **kargs):
        Object.__init__(self, canvas)
        if self.obj == NULL:
            self._set_obj(evas_object_box_add(self.evas.obj))
        self._set_common_params(**kargs)

    def align_get(self):
        cdef double horizontal, vertical
        evas_object_box_align_get(self.obj, &horizontal, &vertical)
        return (horizontal, vertical)

    def align_set(self, double horizontal, double vertical):
        evas_object_box_align_set(self.obj, horizontal, vertical)

    property align:
        def __get__(self):
            return self.align_get()

        def __set__(self, v):
            (horizontal, vertical) = v
            self.align_set(horizontal, vertical)

    def padding_get(self):
        cdef Evas_Coord horizontal, vertical
        evas_object_box_padding_get(self.obj, &horizontal, &vertical)
        return (horizontal, vertical)

    def padding_set(self, Evas_Coord horizontal, Evas_Coord vertical):
        evas_object_box_padding_set(self.obj, horizontal, vertical)

    property padding:
        def __get__(self):
            return self.padding_get()

        def __set__(self, v):
            (horizontal, vertical) = v
            self.padding_set(horizontal, vertical)

    def append(self, Object child):
        evas_object_box_append(self.obj, child.obj)

    def prepend(self, Object child):
        evas_object_box_prepend(self.obj, child.obj)

    def insert_before(self, Object child, Object reference):
        evas_object_box_insert_before(self.obj, child.obj, reference.obj)

    def insert_after(self, Object child, Object reference):
        evas_object_box_insert_after(self.obj, child.obj, reference.obj)

    def insert_at(self, Object child, unsigned int pos):
        evas_object_box_insert_at(self.obj, child.obj, pos)

    def remove(self, Object child):
        return evas_object_box_remove(self.obj, child.obj)

    def remove_at(self, unsigned int pos):
        return evas_object_box_remove_at(self.obj, pos)

    def remove_all(self, Eina_Bool clear):
        return evas_object_box_remove_all(self.obj, clear)

_install_metaclass(Box)
