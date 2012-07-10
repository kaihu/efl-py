from canvas cimport Evas
from object cimport Evas_Object, const_Evas_Object, Object
from general cimport Evas_Coord

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"
    ctypedef void const_void "const void"

cdef extern from "Evas.h":

    ####################################################################
    # Polygon Object
    #
    Evas_Object *evas_object_polygon_add(Evas *e)
    void evas_object_polygon_point_add(Evas_Object *obj, Evas_Coord x, Evas_Coord y)
    void evas_object_polygon_points_clear(Evas_Object *obj)

cdef class Polygon(Object):
    pass
