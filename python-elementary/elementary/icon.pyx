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

cdef class Icon(Image):

    """An icon object is used to display standard icon images ("delete",
    "edit", "arrows", etc.) or images coming from a custom file (PNG, JPG,
    EDJE, etc.), on icon contexts.

    The icon image requested can be in the Elementary theme in use, or in
    the ``freedesktop.org`` theme paths. It's possible to set the order of
    preference from where an image will be fetched.

    This widget inherits from the :py:class:`elementary.image.Image` one, so
    that all the functions acting on it also work for icon objects.

    You should be using an icon, instead of an image, whenever one of the
    following apply:

    - you need a **thumbnail** version of an original image
    - you need freedesktop.org provided icon images
    - you need theme provided icon images (Edje groups)

    Default images provided by Elementary's default theme are described below.

    These are names for icons that were first intended to be used in
    toolbars, but can be used in many other places too:

    - ``"home"``
    - ``"close"``
    - ``"apps"``
    - ``"arrow_up"``
    - ``"arrow_down"``
    - ``"arrow_left"``
    - ``"arrow_right"``
    - ``"chat"``
    - ``"clock"``
    - ``"delete"``
    - ``"edit"``
    - ``"refresh"``
    - ``"folder"``
    - ``"file"``

    These are names for icons that were designed to be used in menus
    (but again, you can use them anywhere else):

    - ``"menu/home"``
    - ``"menu/close"``
    - ``"menu/apps"``
    - ``"menu/arrow_up"``
    - ``"menu/arrow_down"``
    - ``"menu/arrow_left"``
    - ``"menu/arrow_right"``
    - ``"menu/chat"``
    - ``"menu/clock"``
    - ``"menu/delete"``
    - ``"menu/edit"``
    - ``"menu/refresh"``
    - ``"menu/folder"``
    - ``"menu/file"``

    And these are names for some media player specific icons:

    - ``"media_player/forward"``
    - ``"media_player/info"``
    - ``"media_player/next"``
    - ``"media_player/pause"``
    - ``"media_player/play"``
    - ``"media_player/prev"``
    - ``"media_player/rewind"``
    - ``"media_player/stop"``

    This widget emits the following signals, besides the ones sent from
    :py:class:`elementary.image.Image`:

    - ``"thumb,done"`` - Setting :py:attr:`thumb` has completed with success
    - ``"thumb,error"`` - Setting :py:attr:`thumb` has failed

    """

    def __init__(self, evasObject parent):
        Object.__init__(self, parent.evas)
        self._set_obj(elm_icon_add(parent.obj))

    property thumb:
        """Set the file (and edje group) that will be used, but use a
        generated thumbnail.

        This functions like :py:attr:`elementary.image.Image.file` but
        requires the Ethumb library support to be enabled successfully with
        elm_need_ethumb(). When set the file indicated has a thumbnail
        generated and cached on disk for future use or will directly use an
        existing cached thumbnail if it is valid.

        .. seealso:: Image.file

        :type: string *file} or tuple(string *file*, string C{group*)

        """
        def __set__(self, value):
            if isinstance(value, tuple):
                filename, group = value
            else:
                filename = value
                group = None
            # TODO: check return value
            elm_icon_thumb_set(self.obj, _cfruni(filename), _cfruni(group))

    property standard:
        """The icon standards name.

        For example, freedesktop.org defines standard icon names such as "home",
        "network", etc. There can be different icon sets to match those icon
        keys. The ``name`` given as parameter is one of these "keys", and will be
        used to look in the freedesktop.org paths and elementary theme. One can
        change the lookup order with :py:attr:`order_lookup`.

        If name is not found in any of the expected locations and it is the
        absolute path of an image file, this image will be used.

        .. note:: The icon image set can be changed by
            :py:attr:`elementary.image.Image.file`.

        .. seealso:: Image.file

        :type: string

        """
        def __get__(self):
            return _ctouni(elm_icon_standard_get(self.obj))
        def __set__(self, name):
            # TODO: check return value
            elm_icon_standard_set(self.obj, _cfruni(name))

    property order_lookup:
        """The icon lookup order used by :py:attr:`standard`.

        :type: Elm_Icon_Lookup_Order

        """
        def __get__(self):
            return elm_icon_order_lookup_get(self.obj)
        def __set__(self, order):
            elm_icon_order_lookup_set(self.obj, order)

    def callback_thumb_done_add(self, func, *args, **kwargs):
        """Setting :py:attr:`thumb` has completed with success."""
        self._callback_add("thumb,done", func, *args, **kwargs)

    def callback_thumb_done_del(self, func):
        self._callback_del("thumb,done", func)

    def callback_thumb_error_add(self, func, *args, **kwargs):
        """Setting :py:attr:`thumb` has failed."""
        self._callback_add("thumb,error", func, *args, **kwargs)

    def callback_thumb_error_del(self, func):
        self._callback_del("thumb,error", func)

_elm_widget_type_register("icon", Icon)

_install_metaclass(Icon)
