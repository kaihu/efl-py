# Copyright (C) 2007-2013 Gustavo Sverzut Barbieri, Ulisses Furquim
#
# This file is part of Python-Ecore.
#
# Python-Ecore is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# Python-Ecore is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this Python-Ecore.  If not, see <http://www.gnu.org/licenses/>.

# This file is included verbatim by efl.ecore.pyx


cdef class Animator(Eo):
    def __init__(self, func, *args, **kargs):
        if not callable(func):
            raise TypeError("Parameter 'func' must be callable")
        self.func = func
        self.args = args
        self.kargs = kargs
        self._set_obj(ecore_animator_add(_ecore_task_cb, <void *>self))

    def __str__(self):
        return "%s Animator(func=%s, args=%s, kargs=%s)" % (Eo.__repr__(self),
               self.func, self.args, self.kargs)

    def __repr__(self):
        return "%s Animator(func=%s, args=%s, kargs=%s)" % (Eo.__repr__(self),
                self.func, self.args, self.kargs)

    cpdef object _task_exec(self):
        return self.func(*self.args, **self.kargs)

    def delete(self):
        ecore_animator_del(self.obj)

    def stop(self):
        self.delete()


def animator_add(func, *args, **kargs):
    return Animator(func, *args, **kargs)


def animator_frametime_set(double frametime):
    ecore_animator_frametime_set(frametime)


def animator_frametime_get():
    return ecore_animator_frametime_get()
