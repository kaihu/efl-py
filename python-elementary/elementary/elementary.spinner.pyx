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

cdef class Spinner(LayoutClass):

    """

    A spinner is a widget which allows the user to increase or decrease
    numeric values using arrow buttons, or edit values directly, clicking
    over it and typing the new value.

    By default the spinner will not wrap and has a label
    of "%.0f" (just showing the integer value of the double).

    A spinner has a label that is formatted with floating
    point values and thus accepts a printf-style format string, like
    "%1.2f units".

    It also allows specific values to be replaced by pre-defined labels.

    This widget emits the following signals, besides the ones sent from
    :py:class:`elementary.layout.Layout`:

    - ``"changed"`` - Whenever the spinner value is changed.
    - ``"delay,changed"`` - A short time after the value is changed by
        the user.  This will be called only when the user stops dragging
        for a very short period or when they release their finger/mouse,
        so it avoids possibly expensive reactions to the value change.

    Available styles for it:

    - ``"default"``: Default style
    - ``"vertical"``: up/down buttons at the right side and text left aligned.

    """

    def __init__(self, evasObject parent):
        Object.__init__(self, parent.evas)
        self._set_obj(elm_spinner_add(parent.obj))

    property label_format:
        """The format string of the displayed label.

        If set to ``None``, the format is set to "%.0f". If not it sets the
        format string for the label text. The label text is provided a
        floating point value, so the label text can display up to 1 floating
        point value. Note that this is optional.

        Use a format string such as "%1.2f meters" for example, and it will
        display values like: "3.14 meters" for a value equal to 3.14159.

        Default is "%0.f".

        :type: string

        """
        def __get__(self):
            return _ctouni(elm_spinner_label_format_get(self.obj))

        def __set__(self, format):
            elm_spinner_label_format_set(self.obj, _cfruni(format))

    def label_format_set(self, format):
        elm_spinner_label_format_set(self.obj, _cfruni(format))
    def label_format_get(self):
        return _ctouni(elm_spinner_label_format_get(self.obj))

    property min_max:
        """The minimum and maximum values for the spinner.

        If actual value is less than ``min``, it will be updated to ``min``.
        If it is bigger then ``max``, will be updated to ``max``. Actual value
        can be get with :py:attr:`value`.

        By default, min is equal to 0, and max is equal to 100.

        .. warning:: Maximum must be greater than minimum.

        :type: (float, float)

        """
        def __get__(self):
            cdef double min, max
            elm_spinner_min_max_get(self.obj, &min, &max)
            return (min, max)

        def __set__(self, value):
            min, max = value
            elm_spinner_min_max_set(self.obj, min, max)

    def min_max_set(self, min, max):
        elm_spinner_min_max_set(self.obj, min, max)
    def min_max_get(self):
        cdef double min, max
        elm_spinner_min_max_get(self.obj, &min, &max)
        return (min, max)

    property step:
        """The step used to increment or decrement the spinner value.

        This value will be incremented or decremented to the displayed value.
        It will be incremented while the user keep right or top arrow
        pressed, and will be decremented while the user keep left or bottom
        arrow pressed.

        The interval to increment / decrement can be set with
        :py:attr:`interval`.

        By default step value is equal to 1.

        :type: float

        """
        def __get__(self):
            return elm_spinner_step_get(self.obj)

        def __set__(self, step):
            elm_spinner_step_set(self.obj, step)

    def step_set(self, step):
        elm_spinner_step_set(self.obj, step)
    def step_get(self):
        return elm_spinner_step_get(self.obj)

    property value:
        """The value the spinner displays.

        Value will be presented on the label following format specified with
        :py:attr:`format`.

        .. warning:: The value must to be between min and max values. This values
            are set by :py:attr:`min_max`.

        .. seealso:: :py:attr:`format`
        .. seealso:: :py:attr:`min_max`

        :type: float

        """
        def __get__(self):
            return elm_spinner_value_get(self.obj)
        def __set__(self, value):
            elm_spinner_value_set(self.obj, value)

    def value_set(self, value):
        elm_spinner_value_set(self.obj, value)
    def value_get(self):
        return elm_spinner_value_get(self.obj)

    property wrap:
        """Whether the spinner should wrap when it reaches its minimum or
        maximum value.

        Disabled by default. If disabled, when the user tries to increment
        the value, but displayed value plus step value is bigger than
        maximum value, the spinner won't allow it. The same happens when the
        user tries to decrement it, but the value less step is less than
        minimum value.

        When wrap is enabled, in such situations it will allow these changes,
        but will get the value that would be less than minimum and subtracts
        from maximum. Or add the value that would be more than maximum to
        the minimum.

        E.g.:
            - min value = 10
            - max value = 50
            - step value = 20
            - displayed value = 20

        When the user decrement value (using left or bottom arrow), it will
        display ``40``, because max - (min - (displayed - step)) is
        ``50`` - (``10`` - (``20`` - ``20``)) = ``40``.

        :type: bool

        """
        def __get__(self):
            return elm_spinner_wrap_get(self.obj)
        def __set__(self, wrap):
            elm_spinner_wrap_set(self.obj, wrap)

    def wrap_set(self, wrap):
        elm_spinner_wrap_set(self.obj, wrap)
    def wrap_get(self):
        return elm_spinner_wrap_get(self.obj)

    property editable:
        """Whether the spinner can be directly edited by the user or not.

        Spinner objects can have edition **disabled**, in which state they
        will be changed only by arrows. Useful for contexts where you don't
        want your users to interact with it writing the value. Specially
        when using special values, the user can see real value instead of
        special label on edition.

        It's enabled by default.

        :type: bool

        """
        def __get__(self):
            return elm_spinner_editable_get(self.obj)
        def __set__(self, editable):
            elm_spinner_editable_set(self.obj, editable)

    def editable_set(self, editable):
        elm_spinner_editable_set(self.obj, editable)
    def editable_get(self):
        return elm_spinner_editable_get(self.obj)

    def special_value_add(self, value, label):
        """Set a special string to display in the place of the numerical value.

        It's useful for cases when a user should select an item that is
        better indicated by a label than a value. For example, weekdays or months.

        E.g.::
            sp = Spinner(win)
            sp.min_max_set(1, 3)
            sp.special_value_add(1, "January")
            sp.special_value_add(2, "February")
            sp.special_value_add(3, "March")
            sp.show()

        :param value: The value to be replaced.
        :type value: float
        :param label: The label to be used.
        :type label: string

        """
        elm_spinner_special_value_add(self.obj, value, _cfruni(label))

    property interval:
        """The interval on time updates for an user mouse button hold
        on spinner widgets' arrows.

        This interval value is **decreased** while the user holds the
        mouse pointer either incrementing or decrementing spinner's value.

        This helps the user to get to a given value distant from the
        current one easier/faster, as it will start to change quicker and
        quicker on mouse button holds.

        The calculation for the next change interval value, starting from
        the one set with this call, is the previous interval divided by
        ``1.05``, so it decreases a little bit.

        The default starting interval value for automatic changes is
        ``0.85`` seconds.

        :type: float

        """
        def __get__(self):
            return elm_spinner_interval_get(self.obj)

        def __set__(self, interval):
            elm_spinner_interval_set(self.obj, interval)

    def interval_set(self, interval):
        elm_spinner_interval_set(self.obj, interval)
    def interval_get(self):
        return elm_spinner_interval_get(self.obj)

    property base:
        """The base for rounding

        Rounding works as follows:

        ``rounded_val = base + (double)(((value - base) / round) round)``

        Where rounded_val, value and base are doubles, and round is an integer.

        This means that things will be rounded to increments (or decrements)
        of "round" starting from the value of this property. The default
        base for rounding is 0.

        Example: round = 3, base = 2
        Values:  3, 6, 9, 12, 15, ...

        Example: round = 2, base = 5.5
        Values: 5.5, 7.5, 9.5, 11.5, ...

        .. seealso:: :py:attr:`round`

        :type: float

        """
        def __get__(self):
            return elm_spinner_base_get(self.obj)

        def __set__(self, base):
            elm_spinner_base_set(self.obj, base)

    def base_set(self, base):
        elm_spinner_base_set(self.obj, base)
    def base_get(self):
        return elm_spinner_base_get(self.obj)

    property round:
        """The rounding value used for value rounding in the spinner.

        .. seealso:: :py:attr:`base`

        :type: float

        """
        def __get__(self):
            return elm_spinner_round_get(self.obj)

        def __set__(self, rnd):
            elm_spinner_round_set(self.obj, rnd)

    def round_set(self, rnd):
        elm_spinner_round_set(self.obj, rnd)
    def round_get(self):
        return elm_spinner_round_get(self.obj)

    def callback_changed_add(self, func, *args, **kwargs):
        """Whenever the spinner value is changed."""
        self._callback_add("changed", func, *args, **kwargs)

    def callback_changed_del(self, func):
        self._callback_del("changed", func)

    def callback_delay_changed_add(self, func, *args, **kwargs):
        """A short time after the value is changed by the user.  This will
        be called only when the user stops dragging for a very short period
        or when they release their finger/mouse, so it avoids possibly
        expensive reactions to the value change.

        """
        self._callback_add("delay,changed", func, *args, **kwargs)

    def callback_delay_changed_del(self, func):
        self._callback_del("delay,changed", func)

_elm_widget_type_register("spinner", Spinner)

_install_metaclass(Spinner)
