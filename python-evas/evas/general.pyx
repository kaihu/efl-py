# Copyright (C) 2007-2008 Gustavo Sverzut Barbieri, Ulisses Furquim
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

from events cimport *
from callbacks cimport *
from object cimport evas_object_event_callbacks_len
from canvas cimport evas_canvas_event_callbacks_len

cdef unicode _touni(char* s):
    return s.decode('UTF-8', 'strict')

cdef unicode _ctouni(const_char_ptr s):
    return s.decode('UTF-8', 'strict')

cdef char* _fruni(s):
    cdef char* c_string
    if not s:
        return NULL
    if isinstance(s, unicode):
        string = s.encode('UTF-8')
        c_string = string
    elif isinstance(s, str):
        c_string = s
    else:
        raise TypeError("Expected str or unicode object, got %s" % (type(s).__name__))
    return c_string

cdef const_char_ptr _cfruni(s):
    cdef const_char_ptr c_string
    if not s:
        return NULL
    if isinstance(s, unicode):
        string = s.encode('UTF-8')
        c_string = string
    elif isinstance(s, str):
        c_string = s
    else:
        raise TypeError("Expected str or unicode object, got %s" % (type(s).__name__))
    return c_string

def init():
    # when changing these, also change __init__.py!
    if evas_object_event_callbacks_len != EVAS_CALLBACK_LAST:
        raise SystemError("Number of object callbacks changed from %d to %d." %
                          (evas_object_event_callbacks_len, EVAS_CALLBACK_LAST))
    if evas_canvas_event_callbacks_len != EVAS_CALLBACK_LAST:
        raise SystemError("Number of canvas callbacks changed from %d to %d." %
                          (evas_canvas_event_callbacks_len, EVAS_CALLBACK_LAST))
    return evas_init()


def shutdown():
    return evas_shutdown()

def color_parse(desc, is_premul=None):
    """Converts a color description to (r, g, b, a) in pre-multiply form.

    ``is_premul`` default value will depend on desc type:
        - desc is string: ``is_premul=False``
        - desc is integer: ``is_premul=False``
        - desc is tuple: ``is_premul=True``

    :param desc: can be either a string, an integer or a tuple.
    :type desc: string, int or tuple
    :param is_premul: specifies if the color is in pre-multiply form. This
        is the format expected by evas.
    :type is_premul: bool
    :return: (r, g, b, a) in pre-multiply form.
    :rtype: tuple of ints

    """
    cdef unsigned long c, desc_len
    cdef int r, g, b, a

    r = 0
    g = 0
    b = 0
    a = 0

    if isinstance(desc, str):
        if not desc or desc[0] != "#":
            raise ValueError("Invalid color description")
        desc_len = len(desc)
        c = int(desc[1:], 16)
        r = (c >> 16) & 0xff
        g = (c >> 8) & 0xff
        b = c & 0xff

        if is_premul is None:
            is_premul = False

        if desc_len == 9:
            a = (c >> 24) & 0xff
        elif desc_len == 7:
            a = 255
        else:
            raise ValueError("Invalid color description")

    elif isinstance(desc, (int, long)):
        c = desc
        a = (c >> 24) & 0xff
        r = (c >> 16) & 0xff
        g = (c >> 8) & 0xff
        b = c & 0xff

        if is_premul is None:
            is_premul = False

    elif isinstance(desc, (list, tuple)):
        if is_premul is None:
            is_premul = True

        if len(desc) == 3:
            a = 255
            r, g, b = desc
        else:
            r, g, b, a = desc
    else:
        raise TypeError("Unsupported type %s for color description." %
                        type(desc))

    if is_premul is False:
        evas_color_argb_premul(a, &r, &g, &b)

    return (r, g, b, a)


def color_argb_premul(int r, int g, int b, int a):
    """Convert color to pre-multiplied format.

    .. note:: Evas works with pre-multiplied colors internally, so every
           color that comes from or goes to it must be in this format.

    :param r: Red
    :type r: int
    :param g: Green
    :type g: int
    :param b: Blue
    :type b: int
    :param a: Alpha
    :type a: int
    :return: Pre-multiplied (r, g, b, a)
    :rtype: tuple of ints

    """
    evas_color_argb_premul(a, &r, &g, &b)
    return (r, g, b, a)

def color_argb_unpremul(int r, int g, int b, int a):
    """Convert color to regular (no pre-multiplied) format.

    .. note:: Evas works with pre-multiplied colors internally, so every
           color that comes from or goes to it must be in this format.

    :param r: Red
    :type r: int
    :param g: Green
    :type g: int
    :param b: Blue
    :type b: int
    :param a: Alpha
    :type a: int
    :return: (r, g, b, a)
    :rtype: tuple of ints

    """
    evas_color_argb_unpremul(a, &r, &g, &b)
    return (r, g, b, a)

def color_hsv_to_rgb(float h, float s, float v):
    """Convert color from HSV to RGB format.

    :param h: Hue
    :type h: float
    :param s: Saturation
    :type s: float
    :param v: Value
    :type v: float
    :return: (r, g, b)
    :rtype: tuple of ints

    """
    cdef int r, g, b
    evas_color_hsv_to_rgb(h, s, v, &r, &g, &b)
    return (r, g, b)

def color_rgb_to_hsv(int r, int g, int b):
    """Convert color from RGB to HSV format.

    :param r: Red
    :type r: int
    :param g: Green
    :type g: int
    :param b: Blue
    :type b: int
    :return: (h, s, v)
    :rtype: tuple of ints

    """
    cdef float h, s, v
    evas_color_rgb_to_hsv(r, g, b, &h, &s, &v)
    return (h, s, v)


class EvasLoadError(Exception):
    def __init__(self, int code, filename, key):
        if code == EVAS_LOAD_ERROR_NONE:
            msg = "No error on load"
        elif code == EVAS_LOAD_ERROR_GENERIC:
            msg = "A non-specific error occurred"
        elif code == EVAS_LOAD_ERROR_DOES_NOT_EXIST:
            msg = "File (or file path) does not exist"
        elif code == EVAS_LOAD_ERROR_PERMISSION_DENIED:
            msg = "Permission deinied to an existing file (or path)"
        elif code == EVAS_LOAD_ERROR_RESOURCE_ALLOCATION_FAILED:
            msg = "Allocation of resources failure prevented load"
        elif code == EVAS_LOAD_ERROR_CORRUPT_FILE:
            msg = "File corrupt (but was detected as a known format)"
        elif code == EVAS_LOAD_ERROR_UNKNOWN_FORMAT:
            msg = "File is not a known format"
        self.code = code
        self.file = filename
        self.key = key
        Exception.__init__(self, "%s (file=%s, key=%s)" % (msg, filename, key))

