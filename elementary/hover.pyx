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

cdef class Hover(LayoutClass):

    """A Hover object will hover over its ``parent} object at the C{target``
    location.

    Anything in the background will be given a darker coloring to indicate
    that the hover object is on top (at the default theme). When the hover
    is clicked it is dismissed(hidden), if the contents of the hover are
    clicked that **doesn't** cause the hover to be dismissed.

    A Hover object has two parents. One parent that owns it during creation
    and the other parent being the one over which the hover object spans.

    Elementary has the following styles for the hover widget:

    - default
    - popout
    - menu
    - hoversel_vertical

    This widget emits the following signals, besides the ones sent from
    :py:class:`elementary.layout.Layout`:

    - ``"clicked"`` - the user clicked the empty space in the hover to
        dismiss
    - ``"smart,changed"`` - a content object placed under the "smart"
        policy was replaced to a new slot direction.

    Default content parts of the hover widget that you can use for are:

    - ``"left"``
    - ``"top-left"``
    - ``"top"``
    - ``"top-right"``
    - ``"right"``
    - ``"bottom-right"``
    - ``"bottom"``
    - ``"bottom-left"``
    - ``"middle"``
    - ``"smart"``

    All directions may have contents at the same time, except for "smart".
    This is a special placement hint and its use case depends of the
    calculations coming from :py:func:`best_content_location_get()`. Its use is for
    cases when one desires only one hover content, but with a dynamic special
    placement within the hover area. The content's geometry, whenever it
    changes, will be used to decide on a best location, not extrapolating
    the hover's parent object view to show it in (still being the hover's
    target determinant of its medium part -- move and resize it to simulate
    finger sizes, for example). If one of the directions other than "smart"
    are used, a previously content set using it will be deleted, and
    vice-versa.

    .. note:: The hover object will take up the entire space of ``target``
        object.

    .. note:: The content parts listed indicate the direction that the content
        will be displayed

    """

    def __init__(self, evasObject parent, obj = None):
        if obj is None:
            Object.__init__(self, parent.evas)
            self._set_obj(elm_hover_add(parent.obj))
        else:
            self._set_obj(<Evas_Object*>obj)

    def target_set(self, evasObject target):
        """Sets the target object for the hover.

        This function will cause the hover to be centered on the target object.

        :param target: The object to center the hover onto.
        :type target: :py:class:`elementary.object.Object`

        """
        elm_hover_target_set(self.obj, target.obj)

    def target_get(self):
        """Gets the target object for the hover.

        .. seealso:: target_set()

        :return: The target object for the hover.
        :rtype: :py:class:`elementary.object.Object`

        """
        return Object_from_instance(elm_hover_target_get(self.obj))

    property target:
        """The target object for the hover.

        Setting this will cause the hover to be centered on the target object.

        :type: :py:class:`elementary.object.Object`

        """
        def __get__(self):
            return Object_from_instance(elm_hover_target_get(self.obj))
        def __set__(self, evasObject target):
            elm_hover_target_set(self.obj, target.obj)

    def parent_set(self, evasObject parent):
        """Sets the parent object for the hover.

        This function will cause the hover to take up the entire space that the
        parent object fills.

        :param parent: The object to locate the hover over.
        :type parent: :py:class:`elementary.object.Object`

        """
        elm_hover_parent_set(self.obj, parent.obj)

    def parent_get(self):
        """Gets the parent object for the hover.

        .. seealso:: parent_set()

        :return: The parent object to locate the hover over.
        :rtype: :py:class:`elementary.object.Object`

        """
        return Object_from_instance(elm_hover_parent_get(self.obj))

    property parent:
        """The parent object for the hover.

        This will cause the hover to take up the entire space that the
        parent object fills.

        :type: :py:class:`elementary.object.Object`

        """
        def __set__(self, evasObject parent):
            elm_hover_parent_set(self.obj, parent.obj)

        def __get__(self):
            return Object_from_instance(elm_hover_parent_get(self.obj))

    def best_content_location_get(self, axis):
        """best_content_location_get(axis)

        Returns the best swallow location for content in the hover.

        Best is defined here as the location at which there is the most
        available space.

        ``pref_axis`` may be one of

        - ``ELM_HOVER_AXIS_NONE`` -- no preferred orientation
        - ``ELM_HOVER_AXIS_HORIZONTAL`` -- horizontal
        - ``ELM_HOVER_AXIS_VERTICAL`` -- vertical
        - ``ELM_HOVER_AXIS_BOTH`` -- both

        If ELM_HOVER_AXIS_HORIZONTAL is chosen the returned position will
        necessarily be along the horizontal axis("left" or "right"). If
        ELM_HOVER_AXIS_VERTICAL is chosen the returned position will
        necessarily be along the vertical axis("top" or "bottom"). Choosing
        ELM_HOVER_AXIS_BOTH or ELM_HOVER_AXIS_NONE has the same effect and
        the returned position may be in either axis.

        .. seealso:: Object.part_content_set()

        :param axis: The preferred orientation axis for the hover
            object to use
        :type axis: Elm_Hover_Axis

        :return: The edje location to place content into the hover or *None*,
            on errors.
        :rtype: string

        """
        return _ctouni(elm_hover_best_content_location_get(self.obj, axis))

    def dismiss(self):
        """dismiss()

        Dismiss a hover object

        Use this function to simulate clicking outside the hover to dismiss
        it. In this way, the hover will be hidden and the "clicked" signal
        will be emitted.

        """
        elm_hover_dismiss(self.obj)

    def callback_clicked_add(self, func, *args, **kwargs):
        """the user clicked the empty space in the hover to dismiss"""
        self._callback_add("clicked", func, *args, **kwargs)

    def callback_clicked_del(self, func):
        self._callback_del("clicked", func)

    def callback_smart_changed_add(self, func, *args, **kwargs):
        """a content object placed under the "smart" policy was replaced to a
        new slot direction."""
        self._callback_add("smart,changed", func, *args, **kwargs)

    def callback_smart_changed_del(self, func):
        self._callback_del("smart,changed", func)

_elm_widget_type_register("hover", Hover)

_install_metaclass(Hover)
