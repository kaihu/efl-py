# Copyright 2013 Kai Huuhko <kai.huuhko@gmail.com>
#
# This file is part of Python-Epdf.
#
# Python-Epdf is free software you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation either
# version 2.1 of the License, or (at your option) any later version.
#
# Python-Epdf is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this Python-Epdf.  If not, see <http://www.gnu.org/licenses/>.

cimport evas.c_evas

from general cimport _ints_to_python
from document cimport Document

cdef class Page(object):
    cdef Epdf_Page * obj

    def __cinit__(self, *a, **ka):
        self.obj = NULL

    def __init__(self, Document doc):
        """Return a newly created Epdf_Page object

        @param doc The document
        @return An Epdf_Page

        Return a newly created Epdf_Page object of the document @p doc,
        corresponding to the page @p index. It must be freed with
        epdf_page_delete()
        """
        self.obj = epdf_page_new(doc.obj)

    def delete(self):
        """Delete an Epdf_Page object

        @param page The page to delete

        Delete the Epdf_Page object @p page, created with
        epdf_page_new()
        """
        epdf_page_delete(self.obj)

    def render(self, evas.c_evas.Object o):
        """Render a page on an Evas_Object

        @param page The page
        @param o The Evas_Object on which the page is rendered

        Render page @p page on the Evas_Object @p o with the current
        properties of @p page.
        """
        epdf_page_render (self.obj, o.obj)

    def render_slice(self, evas.c_evas.Object o, int x, int y, int w, int h):
        """Render a page on an Evas_Object

        @param page The page
        @param o The Evas_Object on which the page is rendered
        @param x The x coordinate of the upper-left corner
        @param y The y coordinate of the upper-left corner
        @param w The width of rectangle to render
        @param h The height of rectangle to render

        Render a rectangle of the page @p page on the Evas_Object @p o. The
        upper-left corner of the rectangle has the coordinates (@p x, @ py),
        its width is @p w and its height is @p h.

        If @p w is less than 0, the original width is choosen.
        If @p h is less than 0, the original height is choosen.
        """
        epdf_page_render_slice(self.obj, o.obj, x, y, w, h)

    property page:
        """The current page number

        @return The current page number

        Set the page number of the page @p page to @p p
        """
        def __set__(self, int p):
            epdf_page_page_set(self.obj, p)

        def __get__(self):
            return epdf_page_page_get(self.obj)

#~     def text_get(self, float x1, float y1, float x2, float y2):
#~         """Return the text of a page contained in a rectangle
#~
#~         @param page The page
#~         @param r The rectangle
#~         @return The text contained in @p r
#~
#~         Return the text of the page @p contained in the rectangle @p r. The
#~         result must be freed
#~         """
#~         cdef Epdf_Rectangle r
#~         r.x1 = x1
#~         r.y1 = y1
#~         r.x2 = x2
#~         r.y2 = y2
#~         return epdf_page_text_get(self.obj, r)

    def text_find(self, unicode text, is_case_sensitive):
        """Return a list of rectangle in tha page, all of them containing a given text

        @param page The page
        @param text The text
        @param is_case_sensitive 1 if the text is search with sensitive
        case, 0 otherwise
        @return A list of rectanles which all contain the text @p text

        Return a list of rectangles in the page @p page containing the text
        @p text. If @p is_case_sensitive is equal to 0, the case is not taken
        into account. The list must be destroyed with a call to
        ecore_list_destroy()
        """
        # TODO: Eina_List *epdf_page_text_find (self.obj, text, is_case_sensitive)
        return None

    property transition:
        """Return the transition of a page

        @param page The page
        @return The transition of the page, as an Epdf_Page_Transition

        Return the transition of the page @p page
        """
        def __get__(self):
            # TODO: Epdf_Page_Transition *epdf_page_transition_get (self.obj);
            return None

    property size:
        """Return the size of a page

        @param page The page
        @param width The width of the page
        @param height The height of the page

        Return the size of the page @p page in @p width and @p height.
        On failure, @p width and @p height store both 0. @p width or
        @p height can be @c NULL.
        """
        def __get__(self):
            cdef int width, height
            epdf_page_size_get(self.obj, &width, &height)
            return width, height

    property scale:
        """Set the scale of a page

        @param page The page
        @param hscale The horizontal scale
        @param vscale The vertical scale

        Set the horizontal scale @p hscale and vertical scale @p vscale of
        the @p page, in pixel per points. A value of 1.0 and 1.0 (resp.)
        means that the original size of the document is choosen.
        """
        def __set__(self, scale):
            hscale, vscale = scale
            epdf_page_scale_set(self.obj, hscale, vscale)

        def __get__(self):
            cdef double hscale, vscale
            epdf_page_scale_get(self.obj, &hscale, &vscale)
            return hscale, vscale

    property orientation:
        """Set the orientation of a page

        @param page The page
        @param orientation The orientation

        Set the orientation of @p page to @p orientation.
        """
        def __set__(self, Epdf_Page_Orientation orientation):
            epdf_page_orientation_set(self.obj, orientation)

        def __get__(self):
            return epdf_page_orientation_get(self.obj)
