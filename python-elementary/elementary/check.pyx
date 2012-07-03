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

include "widget_header.pxi"

cdef class Check(LayoutClass):

    """The check widget allows for toggling a value between true and false.

    Check objects are a lot like radio objects in layout and functionality,
    except they do not work as a group, but independently, and only toggle
    the value of a boolean between false and true. :py:attr:`state` sets the
    boolean state and :py:attr:`state` returns the current state.

    This widget emits the following signals, besides the ones sent from
    :py:class:`elementary.layout.Layout`:

    - ``changed`` - This is called whenever the user changes the state of
      the check objects.

    Default content parts of the check widget that you can use for are:

    - "icon" - An icon of the check

    Default text parts of the check widget that you can use for are:

    - "default" - A label of the check
    - "on" - On state label of the check
    - "off" - Off state label of the check

    """

    def __init__(self, evasObject parent):
        Object.__init__(self, parent.evas)
        self._set_obj(elm_check_add(parent.obj))

    property state:
        """The of/off state of the check object

        This property reflects the state of the check. Setting it **doesn't**
        cause the "changed" signal to be emitted.

        :type: bool

        """
        def __get__(self):
            return bool(elm_check_state_get(self.obj))

        def __set__(self, value):
            elm_check_state_set(self.obj, value)

    def state_set(self, value):
        elm_check_state_set(self.obj, value)
    def state_get(self):
        return bool(elm_check_state_get(self.obj))

    def callback_changed_add(self, func, *args, **kwargs):
        """This is called whenever the user changes the state of the check
        objects."""
        self._callback_add("changed", func, *args, **kwargs)

    def callback_changed_del(self, func):
        self._callback_del("changed", func)

_elm_widget_type_register("check", Check)

_install_metaclass(Check)
