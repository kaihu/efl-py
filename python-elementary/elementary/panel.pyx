# Copyright (c) 2010 Boris Faure
#               2010 Sebastian Krzyszkowiak
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

include "widget_header.pxi"

cdef class Panel(Object):

    """

    A panel is a type of animated container that contains subobjects.

    It can be expanded or contracted by clicking the button on it's edge.

    Orientations are as follows:

    - ELM_PANEL_ORIENT_TOP
    - ELM_PANEL_ORIENT_LEFT
    - ELM_PANEL_ORIENT_RIGHT

    Default content parts of the panel widget that you can use for are:

    - "default" - A content of the panel

    """

    def __init__(self, evasObject parent):
        Object.__init__(self, parent.evas)
        self._set_obj(elm_panel_add(parent.obj))

    property orient:
        """The orientation of the panel.

        Tells from where the panel will (dis)appear.

        This has value ELM_PANEL_ORIENT_LEFT on failure

        :type: Elm_Panel_Orient

        """
        def __set__(self, orient):
            elm_panel_orient_set(self.obj, orient)
        def __get__(self):
            return elm_panel_orient_get(self.obj)

    def orient_set(self, orient):
        elm_panel_orient_set(self.obj, orient)
    def orient_get(self):
        return elm_panel_orient_get(self.obj)

    property hidden:
        """The hidden state of the panel.

        :type: bool

        """
        def __set__(self, hidden):
            elm_panel_hidden_set(self.obj, hidden)
        def __get__(self):
            return elm_panel_hidden_get(self.obj)

    def hidden_set(self, hidden):
        elm_panel_orient_set(self.obj, hidden)
    def hidden_get(self):
        return elm_panel_hidden_get(self.obj)

    def toggle(self):
        """Toggle the hidden state of the panel from code."""
        elm_panel_toggle(self.obj)

_elm_widget_type_register("panel", Panel)

_install_metaclass(Panel)
