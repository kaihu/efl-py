from cpython cimport Py_INCREF, Py_DECREF
from evas.c_evas cimport Object as evasObject
from evas.c_evas cimport Object_from_instance
from object cimport _elm_widget_type_register
from general cimport _cfruni, _ctouni, _fruni, _touni
from general cimport _METHOD_DEPRECATED

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef void _install_metaclass(object cclass):
    Py_INCREF(ElementaryObjectMeta)
    cdef PyTypeObject *ctype = <PyTypeObject *>cclass
    ctype.ob_type = <PyTypeObject*>ElementaryObjectMeta

class ElementaryObjectMeta(type):
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
