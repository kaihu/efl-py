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

from cpython cimport PyObject, Py_INCREF, Py_DECREF
from cpython cimport PyMem_Malloc, PyMem_Free
from cpython cimport bool
from evas.object cimport Object_from_instance

import sys
import traceback
import logging

logging.basicConfig(level=logging.DEBUG)
log = logging.getLogger("elementary")

cdef int PY_REFCOUNT(object o):
    cdef PyObject *obj = <PyObject *>o
    return obj.ob_refcnt

cdef _METHOD_DEPRECATED(self, replacement=None, message=None):
    stack = traceback.extract_stack()
    caller = stack[-1]
    caller_module, caller_line, caller_name, caller_code = caller
    if caller_code:
        msg = "%s:%s %s (class %s) is deprecated." % \
            (caller_module, caller_line, caller_code,
            self.__class__.__name__ if self else 'None')
    else:
        msg = "%s:%s %s.%s() is deprecated." % \
            (caller_module, caller_line,
            self.__class__.__name__ if self else 'None', caller_name)
    if replacement:
        msg += " Use %s() instead." % (replacement,)
    if message:
        msg += " " + message
    log.warn(msg)

cdef inline unicode _touni(char* s):
    return s.decode('UTF-8', 'strict')

cdef inline unicode _ctouni(const_char_ptr s):
    return s.decode('UTF-8', 'strict')

cdef inline char* _fruni(s):
    cdef char* c_string
    if isinstance(s, unicode):
        string = s.encode('UTF-8')
        c_string = string
    elif isinstance(s, str):
        c_string = s
    else:
        raise TypeError("Expected str or unicode object, got %s" % (type(s).__name__))
    return c_string

cdef inline const_char_ptr _cfruni(s):
    cdef const_char_ptr c_string
    if isinstance(s, unicode):
        string = s.encode('UTF-8')
        c_string = string
    elif isinstance(s, str):
        c_string = s
    else:
        raise TypeError("Expected str or unicode object, got %s" % (type(s).__name__))
    return c_string

def init():
    cdef int argc, i, arg_len
    cdef char **argv, *arg
    argc = len(sys.argv)
    argv = <char **>PyMem_Malloc(argc * sizeof(char *))
    for i from 0 <= i < argc:
        arg = _fruni(sys.argv[i])
        arg_len = len(arg)
        argv[i] = <char *>PyMem_Malloc(arg_len + 1)
        memcpy(argv[i], arg, arg_len + 1)

    elm_init(argc, argv)

def shutdown():
    elm_shutdown()

def run():
    with nogil:
        elm_run()

def exit():
    elm_exit()

def policy_set(policy, value):
    """Set new policy value.

    This will emit the ecore event ELM_EVENT_POLICY_CHANGED in the main
    loop giving the event information Elm_Event_Policy_Changed with
    policy identifier, new and old values.

    :param policy: policy identifier as in Elm_Policy.
    :param value: policy value, depends on identifiers, usually there is
        an enumeration with the same prefix as the policy name, for
        example: ELM_POLICY_QUIT and Elm_Policy_Quit
        (ELM_POLICY_QUIT_NONE, ELM_POLICY_QUIT_LAST_WINDOW_CLOSED).

    :return: True on success or False on error (right
        now just invalid policy identifier, but in future policy
        value might be enforced).

    """
    return elm_policy_set(policy, value)

def policy_get(policy):
    """Gets the policy value set for given identifier.

    :param policy: policy identifier as in Elm_Policy.

    :return: policy value. Will be 0 if policy identifier is invalid.

    """
    return elm_policy_get(policy)

def coords_finger_size_adjust(times_w, w, times_h, h):
    cdef Evas_Coord width
    cdef Evas_Coord height
    width = w
    height = h
    elm_coords_finger_size_adjust(times_w, &width, times_h, &height)

