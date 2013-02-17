# Copyright (C) 2007-2013 various contributors (see AUTHORS)
#
# This file is part of Python-EFL.
#
# Python-EFL is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# Python-EFL is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this Python-EFL.  If not, see <http://www.gnu.org/licenses/>.

include "widget_header.pxi"

from layout_class cimport LayoutClass

cdef class Layout(LayoutClass):

    """

    This is a container widget that takes a standard Edje design file and
    wraps it very thinly in a widget.

    An Edje design (theme) file has a very wide range of possibilities to
    describe the behavior of elements added to the Layout. Check out the Edje
    documentation and the EDC reference to get more information about what can
    be done with Edje.

    Just like :py:class:`List`, :py:class:`Box`, and other container
    widgets, any object added to the Layout will become its child, meaning
    that it will be deleted if the Layout is deleted, move if the Layout is
    moved, and so on.

    The Layout widget can contain as many Contents, Boxes or Tables as
    described in its theme file. For instance, objects can be added to
    different Tables by specifying the respective Table part names. The same
    is valid for Content and Box.

    The objects added as child of the Layout will behave as described in the
    part description where they were added. There are 3 possible types of
    parts where a child can be added:

    Content (SWALLOW part)

        Only one object can be added to the ``SWALLOW`` part (but you still can
        have many ``SWALLOW`` parts and one object on each of them). Use the
        ``Object.content_set/get/unset`` functions to set, retrieve and unset
        objects as content of the *SWALLOW*. After being set to this part,
        the object size, position, visibility, clipping and other description
        properties will be totally controlled by the description of the
        given part (inside the Edje theme file).

        One can use ``size_hint_`` functions on the child to have some kind of
        control over its behavior, but the resulting behavior will still
        depend heavily on the ``SWALLOW`` part description.

        The Edje theme also can change the part description, based on
        signals or scripts running inside the theme. This change can also be
        animated. All of this will affect the child object set as content
        accordingly. The object size will be changed if the part size is
        changed, it will animate move if the part is moving, and so on.

    Box (BOX part)

        An Edje ``BOX`` part is very similar to the Elementary
        :py:class:`elementary.box.Box` widget. It allows one to add objects
        to the box and have them distributed along its area, accordingly to
        the specified ``layout`` property (now by ``layout`` we mean the
        chosen layouting design of the Box, not the Layout widget itself).

        A similar effect for having a box with its position, size and other
        things controlled by the Layout theme would be to create an
        Elementary :py:class:`Box` widget and add it as a Content in the
        ``SWALLOW`` part.

        The main difference of using the Layout Box is that its behavior,
        the box properties like layouting format, padding, align, etc. will
        be all controlled by the theme. This means, for example, that a
        signal could be sent to the Layout theme (with
        :py:func:`Object.signal_emit()`) and the theme handled the signal by
        changing the box padding, or align, or both. Using the Elementary
        :py:class:`Box` widget is not necessarily harder or easier, it just
        depends on the circumstances and requirements.

        The Layout Box can be used through the ``box_`` set of functions.

    Table (TABLE part)

        Just like the *Box*, the Layout Table is very similar to the
        Elementary :py:class:`Table` widget. It allows one to add objects to
        the Table specifying the row and column where the object should be
        added, and any column or row span if necessary.

        Again, we could have this design by adding a :py:class:`Table`
        widget to the ``SWALLOW`` part using
        :py:func:`Object.part_content_set()`. The same difference happens
        here when choosing to use the Layout Table (a ``TABLE`` part)
        instead of the :py:class:`Table` plus ``SWALLOW`` part. It's just a
        matter of convenience.

        The Layout Table can be used through the ``table_`` set of functions.

    Another interesting thing about the Layout widget is that it offers some
    predefined themes that come with the default Elementary theme. These
    themes can be set by :py:attr:`theme`, and provide some basic
    functionality depending on the theme used.

    Most of them already send some signals, some already provide a toolbar or
    back and next buttons.

    These are available predefined theme layouts. All of them have class =
    *layout*, group = *application*, and style = one of the following options:

    - ``toolbar-content`` - application with toolbar and main content area
    - ``toolbar-content-back`` - application with toolbar and main content
      area with a back button and title area
    - ``toolbar-content-back-next`` - application with toolbar and main
      content area with a back and next buttons and title area
    - ``content-back`` - application with a main content area with a back
      button and title area
    - ``content-back-next`` - application with a main content area with a
      back and next buttons and title area
    - ``toolbar-vbox`` - application with toolbar and main content area as a
      vertical box
    - ``toolbar-table`` - application with toolbar and main content area as a
      table

    This widget emits the following signals:

    - "theme,changed": The theme was changed.

    """

    def __init__(self, evasObject parent):
        self._set_obj(elm_layout_add(parent.obj))

    def content_set(self, swallow, evasObject content):
        """content_set(unicode swallow, evas.Object content)

        Set the layout content.

        Once the content object is set, a previously set one will be deleted.
        If you want to keep that old content object, use the
        :py:func:`Object.part_content_unset()` function.

        .. note:: In an Edje theme, the part used as a content container is
            called *SWALLOW*. This is why the parameter name is called
            *swallow*, but it is expected to be a part name just like the
            second parameter of :py:func:`box_append()`.

        .. seealso:: box_append()
        .. seealso:: Object.part_content_get()
        .. seealso:: Object.part_content_unset()

        :param swallow: The swallow part name in the edje file
        :type swallow: string
        :param content: The child that will be added in this layout object
        :type content: :py:class:`elementary.object.Object`

        :return: ``True`` on success, ``False`` otherwise
        :rtype: bool

        """
        cdef Evas_Object *o
        if content is not None:
            o = content.obj
        else:
            o = NULL
        elm_layout_content_set(self.obj, _cfruni(swallow), o)

    def content_get(self, swallow):
        """content_get(unicode swallow) -> evas.Object

        Get the child object in the given content part.

        :param swallow: The SWALLOW part to get its content
        :type swallow: string

        :return: The swallowed object or None if none or an error occurred

        """
        return object_from_instance(elm_layout_content_get(self.obj, _cfruni(swallow)))

    def content_unset(self, swallow):
        """content_unset(unicode swallow)

        Unset the layout content.

        Unparent and return the content object which was set for this part.

        :param swallow: The swallow part name in the edje file
        :type swallow: string
        :return: The content that was being used
        :rtype: :py:class:`elementary.object.Object`

        """
        return object_from_instance(elm_layout_content_unset(self.obj, _cfruni(swallow)))

    def text_set(self, part, text):
        """text_set(unicode part, unicode text)

        Set the text of the given part

        :param part: The TEXT part where to set the text
        :type part: string
        :param text: The text to set
        :type text: string
        :return: ``True`` on success, ``False`` otherwise

        """
        elm_layout_text_set(self.obj, _cfruni(part), _cfruni(text))

    def text_get(self, part):
        """text_get(unicode part) -> unicode

        Get the text set in the given part

        :param part: The TEXT part to retrieve the text off
        :type part: string

        :return: The text set in ``part``
        :rtype: string

        """
        return _ctouni(elm_layout_text_get(self.obj, _cfruni(part)))


_object_mapping_register("elm_layout", Layout)
