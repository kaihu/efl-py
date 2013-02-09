# Copyright 2012 Kai Huuhko <kai.huuhko@gmail.com>
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
import traceback

from evas.c_evas cimport EVAS_EVENT_FLAG_NONE

cdef Evas_Event_Flags _gesture_layer_event_cb(void *data, void *event_info) with gil:
    (callback, args, kwargs) = <object>data
    try:
        ret = callback(args, kwargs)
        if ret is not None:
            return <Evas_Event_Flags>ret
        else:
            return EVAS_EVENT_FLAG_NONE
    except Exception as e:
        traceback.print_exc()

cdef class GestureLayer(Object):

    """

    Use the GestureLayer to detect gestures. The advantage is that you don't
    have to implement gesture detection, just set callbacks for gesture states.

    In order to use Gesture Layer you start with instantiating this class
    with a parent object parameter. Next 'activate' gesture layer with a
    :py:func:`attach()` call. Usually with same object as target (2nd
    parameter).

    Now you need to tell gesture layer what gestures you follow. This is
    done with :py:func:`cb_set()` call. By setting the callback you actually
    saying to gesture layer: I would like to know when the gesture
    ``Elm_Gesture_Type`` switches to state ``Elm_Gesture_State``.

    Next, you need to implement the actual action that follows the input in
    your callback.

    Note that if you like to stop being reported about a gesture, just set
    all callbacks referring this gesture to None. (again with
    :py:func:`cb_set()`)

    The information reported by gesture layer to your callback is depending
    on ``Elm_Gesture_Type``:

    - ``Elm_Gesture_Taps_Info`` is the info reported for tap gestures:

        - ``ELM_GESTURE_N_TAPS``
        - ``ELM_GESTURE_N_LONG_TAPS``
        - ``ELM_GESTURE_N_DOUBLE_TAPS``
        - ``ELM_GESTURE_N_TRIPLE_TAPS``

    - ``Elm_Gesture_Momentum_Info`` is info reported for momentum gestures:

        - ``ELM_GESTURE_MOMENTUM``

    - ``Elm_Gesture_Line_Info`` is the info reported for line gestures
      (this also contains ``Elm_Gesture_Momentum_Info`` internal structure):

        - ``ELM_GESTURE_N_LINES``
        - ``ELM_GESTURE_N_FLICKS``

    Note that we consider a flick as a line-gesture that should be completed
    in flick-time-limit as defined in
    :py:class:`elementary.configuration.Configuration`.

    ``Elm_Gesture_Zoom_Info`` is the info reported for ``ELM_GESTURE_ZOOM``
    gesture.

    ``Elm_Gesture_Rotate_Info`` is the info reported for
    ``ELM_GESTURE_ROTATE`` gesture.

    Gesture Layer Tweaks:

    Note that line, flick, gestures can start without the need to remove
    fingers from surface. When user fingers rests on same-spot gesture is
    ended and starts again when fingers moved.

    Setting glayer_continues_enable to false in
    :py:class:`elementary.configuration.Configuration` will change this
    behavior so gesture starts when user touches (a *DOWN* event)
    touch-surface and ends when no fingers touches surface (a *UP* event).

    """

    def __init__(self, evasObject parent):
        """Call this function to construct a new gesture-layer object.

        This does not activate the gesture layer. You have to call
        :py:func:`attach()` in order to 'activate' gesture-layer.

        :param parent: The gesture layer's parent widget.
        :type parent: :py:class:`evas.object.Object`

        :return: A new gesture layer object.
        :rtype: :py:class:`GestureLayer`

        """
        Object.__init__(self, parent.evas)
        self._set_obj(elm_gesture_layer_add(parent.obj))

    def cb_set(self, Elm_Gesture_Type idx, callback, Elm_Gesture_State cb_type, *args, **kwargs):
        """Use this function to set callbacks to be notified about change of
        state of gesture. When a user registers a callback with this function
        this means this gesture has to be tested.

        When ALL callbacks for a gesture are set to None it means user isn't
        interested in gesture-state and it will not be tested.

        .. note:: You should return either EVAS_EVENT_FLAG_NONE or
            EVAS_EVENT_FLAG_ON_HOLD from this callback.

        :param idx: The gesture you would like to track its state.
        :type idx: Elm_Gesture_Type
        :param callback: Callback function.
        :type callback: function
        :param cb_type: what event this callback tracks: START, MOVE, END, ABORT.
        :type cb_type: Elm_Gesture_State

        """
        cdef Elm_Gesture_Event_Cb cb = NULL

        if callback:
            if not callable(callback):
                raise TypeError("callback is not callable")
            cb = _gesture_layer_event_cb

        data = (callback, args, kwargs)

        elm_gesture_layer_cb_set(   self.obj,
                                    idx,
                                    cb_type,
                                    cb,
                                    <void *>data)

    property hold_events:
        """Gesture-layer repeat events. Set to True if you like to get the
        raw events only if gestures were not detected. Set to false if you
        like gesture layer to forward events as testing gestures.

        :type: bool

        """
        def __get__(self):
            return bool(elm_gesture_layer_hold_events_get(self.obj))

        def __set__(self, hold_events):
            elm_gesture_layer_hold_events_set(self.obj, hold_events)

    property zoom_step:
        """Step-value for zoom action. Set step to any positive value.
        Cancel step setting by setting to 0.0

        :type: float

        """
        def __set__(self, step):
            elm_gesture_layer_zoom_step_set(self.obj, step)

        def __get__(self):
            return elm_gesture_layer_zoom_step_get(self.obj)

    property rotate_step:
        """This function sets step-value for rotate action. Set step to any
        positive value. Cancel step setting by setting to 0

        :type: float

        """
        def __set__(self, step):
            elm_gesture_layer_rotate_step_set(self.obj, step)

        def __get__(self):
            return elm_gesture_layer_rotate_step_get(self.obj)

    def attach(self, evasObject target):
        """Attach a given gesture layer widget to an Evas object, thus setting
        the widget's **target**.

        A gesture layer target may be whichever Evas object one chooses.
        This will be object ``obj`` will listen all mouse and key events
        from, to report the gestures made upon it back.

        :param target: The target object to attach to this object.
        :type target: :py:class:`evas.object.Object`

        :return: ``True``, on success, ``False`` otherwise.
        :rtype: bool

        """
        return bool(elm_gesture_layer_attach(self.obj, target.obj))

_elm_widget_type_register("gesture_layer", GestureLayer)

_install_metaclass(GestureLayer)
