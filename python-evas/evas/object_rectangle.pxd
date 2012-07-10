from canvas cimport Evas
from object cimport Evas_Object, const_Evas_Object, Object

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"
    ctypedef void const_void "const void"

cdef extern from "Evas.h":

    ####################################################################
    # Rectangle Object
    #
    Evas_Object *evas_object_rectangle_add(Evas *e)

cdef class Rectangle(Object):
    pass
