from cpython cimport Py_INCREF, Py_DECREF, PyObject
from general cimport _fruni, _touni, _cfruni, _ctouni
from object cimport Object, evas_object_event_callback_add
from canvas cimport Canvas

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef int PY_REFCOUNT(object o):
    cdef PyObject *obj = <PyObject *>o
    return obj.ob_refcnt

cdef void _install_metaclass(object cclass):
    Py_INCREF(EvasObjectMeta)
    cdef PyTypeObject *ctype = <PyTypeObject *>cclass
    ctype.ob_type = <PyTypeObject*>EvasObjectMeta

class EvasObjectMeta(type):
    def __init__(cls, name, bases, dict_):
        type.__init__(cls, name, bases, dict_)
        cls._fetch_evt_callbacks()

    def _fetch_evt_callbacks(cls):
        if "__evas_event_callbacks__" in cls.__dict__:
            return

        cls.__evas_event_callbacks__ = []
        append = cls.__evas_event_callbacks__.append

        for name in dir(cls):
            val = getattr(cls, name)
            if not callable(val) or not hasattr(val, "evas_event_callback"):
                continue
            evt = getattr(val, "evas_event_callback")
            append((name, evt))

