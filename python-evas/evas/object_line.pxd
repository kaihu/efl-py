from canvas cimport Evas
from object cimport Evas_Object, const_Evas_Object, Object
from general cimport Evas_Coord

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"
    ctypedef void const_void "const void"

cdef extern from "Evas.h":

    ####################################################################
    # Line Object
    #
    Evas_Object *evas_object_line_add(Evas *e)
    void evas_object_line_xy_set(Evas_Object *obj, Evas_Coord x1, Evas_Coord y1, Evas_Coord x2, Evas_Coord y2)
    void evas_object_line_xy_get(const_Evas_Object *obj, Evas_Coord *x1, Evas_Coord *y1, Evas_Coord *x2, Evas_Coord *y2)

cdef class Line(Object):
    pass
