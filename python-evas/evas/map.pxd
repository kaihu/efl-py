from canvas cimport Evas
from object cimport Evas_Object, Object
from general cimport Eina_Bool, Evas_Coord

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"
    ctypedef void const_void "const void"

cdef extern from "Evas.h":

    ctypedef Evas_Object const_Evas_Object "const Evas_Object"

    ctypedef struct Evas_Map
    ctypedef Evas_Map const_Evas_Map "const Evas_Map"

    ####################################################################
    # Evas Map (py3:TODO)
    #
    Evas_Map       *evas_map_new(int count)

    void            evas_map_util_points_populate_from_object_full(Evas_Map *m, const_Evas_Object *obj, Evas_Coord z)
    void            evas_map_util_points_populate_from_object(Evas_Map *m, const_Evas_Object *obj)
    void            evas_map_util_points_populate_from_geometry(Evas_Map *m, Evas_Coord x, Evas_Coord y, Evas_Coord w, Evas_Coord h, Evas_Coord z)
    void            evas_map_util_points_color_set(Evas_Map *m, int r, int g, int b, int a)
    void            evas_map_util_rotate(Evas_Map *m, double degrees, Evas_Coord cx, Evas_Coord cy)
    void            evas_map_util_zoom(Evas_Map *m, double zoomx, double zoomy, Evas_Coord cx, Evas_Coord cy)
    void            evas_map_util_3d_rotate(Evas_Map *m, double dx, double dy, double dz, Evas_Coord cx, Evas_Coord cy, Evas_Coord cz)
    void            evas_map_util_3d_lighting(Evas_Map *m, Evas_Coord lx, Evas_Coord ly, Evas_Coord lz, int lr, int lg, int lb, int ar, int ag, int ab)
    void            evas_map_util_3d_perspective(Evas_Map *m, Evas_Coord px, Evas_Coord py, Evas_Coord z0, Evas_Coord foc)
    Eina_Bool       evas_map_util_clockwise_get(Evas_Map *m)

    void            evas_map_smooth_set(Evas_Map *m, Eina_Bool enabled)
    Eina_Bool       evas_map_smooth_get(const_Evas_Map *m)
    void            evas_map_alpha_set(Evas_Map *m, Eina_Bool enabled)
    Eina_Bool       evas_map_alpha_get(const_Evas_Map *m)
    Evas_Map       *evas_map_dup(const_Evas_Map *m)
    void            evas_map_free(Evas_Map *m)
    int             evas_map_count_get(const_Evas_Map *m)
    void            evas_map_point_coord_set(Evas_Map *m, int idx, Evas_Coord x, Evas_Coord y, Evas_Coord z)
    void            evas_map_point_coord_get(const_Evas_Map *m, int idx, Evas_Coord *x, Evas_Coord *y, Evas_Coord *z)
    void            evas_map_point_image_uv_set(Evas_Map *m, int idx, double u, double v)
    void            evas_map_point_image_uv_get(const_Evas_Map *m, int idx, double *u, double *v)
    void            evas_map_point_color_set(Evas_Map *m, int idx, int r, int g, int b, int a)
    void            evas_map_point_color_get(const_Evas_Map *m, int idx, int *r, int *g, int *b, int *a)

cdef class Map(object):
    cdef Evas_Map *map
