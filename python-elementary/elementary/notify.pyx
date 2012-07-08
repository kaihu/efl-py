# Copyright (c) 2008-2009 ProFUSION embedded systems
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with python-elementary. If not, see <http://www.gnu.org/licenses/>.

include "widget_header.pxi"

cdef class Notify(Object):

    """

    Display a container in a particular region of the parent.

    A timeout can be set to automatically hide the notify. This is so that,
    after an :py:func:`show()` on a notify object, if a timeout was set on it,
    it will **automatically** get hidden after that time.

    Signals that you can add callbacks for are:
        - "timeout" - when timeout happens on notify and it's hidden
        - "block,clicked" - when a click outside of the notify happens

    Default content parts of the notify widget that you can use are:
        - ``"default"`` - The main content of the notify

    """

    def __init__(self, evasObject parent):
        Object.__init__(self, parent.evas)
        self._set_obj(elm_notify_add(parent.obj))

    property parent:
        """The notify parent.

        Once the parent object is set, a previously set one will be disconnected
        and replaced.

        :type: :py:class:`Object`

        """
        def __get__(self):
            return Object_from_instance(elm_notify_parent_get(self.obj))

        def __set__(self, evasObject parent):
            elm_notify_parent_set(self.obj, parent.obj if parent is not None else NULL)

    def parent_set(self, evasObject parent):
        elm_notify_parent_set(self.obj, parent.obj if parent is not None else NULL)
    def parent_get(self):
        return Object_from_instance(elm_notify_parent_get(self.obj))

    property orient:
        """The position in which the notify will appear in its parent.

        :type: Elm_Notify_Orient

        """
        def __get__(self):
            return elm_notify_orient_get(self.obj)

        def __set__(self, orient):
            elm_notify_orient_set(self.obj, orient)

    def orient_set(self, int orient):
        elm_notify_orient_set(self.obj, orient)
    def orient_get(self):
        return elm_notify_orient_get(self.obj)

    property timeout:
        """The time interval after which the notify window is going to be
        hidden.

        Setting this starts the timer controlling when the
        notify is hidden. Since calling :py:func:`show()` on a notify restarts
        the timer controlling when the notify is hidden, setting this before the
        notify is shown will in effect mean starting the timer when the notify is
        shown.

        .. note:: Set a value <= 0.0 to disable a running timer.

        .. note:: If the value > 0.0 and the notify is previously visible, the
            timer will be started with this value, canceling any running timer.

        :type: float

        """
        def __get__(self):
            return elm_notify_timeout_get(self.obj)

        def __set__(self, timeout):
            elm_notify_timeout_set(self.obj, timeout)

    def timeout_set(self, double timeout):
        elm_notify_timeout_set(self.obj, timeout)
    def timeout_get(self):
        return elm_notify_timeout_get(self.obj)

    property allow_events:
        """Whether events should be passed to by a click outside its area.

        When True if the user clicks outside the window the events will be caught
        by the others widgets, else the events are blocked.

        .. note:: The default value is True.

        :type: bool

        """
        def __get__(self):
            return bool(elm_notify_allow_events_get(self.obj))

        def __set__(self, allow_events):
            elm_notify_allow_events_set(self.obj, allow_events)

    def allow_events_set(self, repeat):
        elm_notify_allow_events_set(self.obj, repeat)
    def allow_events_get(self):
        return bool(elm_notify_allow_events_get(self.obj))

    def callback_timeout_add(self, func, *args, **kwargs):
        """When timeout happens on notify and it's hidden."""
        self._callback_add("timeout", func, *args, **kwargs)

    def callback_timeout_del(self, func):
        self._callback_del("timeout", func)

    def callback_block_clicked_add(self, func, *args, **kwargs):
        """When a click outside of the notify happens."""
        self._callback_add("block,clicked", func, *args, **kwargs)

    def callback_block_clicked_del(self, func):
        self._callback_del("block,clicked", func)

_elm_widget_type_register("notify", Notify)

_install_metaclass(Notify)
