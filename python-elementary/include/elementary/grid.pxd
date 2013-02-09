from evas.c_evas cimport Eina_Bool, Eina_List
from evas.c_evas cimport Evas_Object, Evas_Coord
from object cimport Object

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    # Grid                  (api:DONE  cb:N/A   test:TODO  doc:DONE)
    Evas_Object             *elm_grid_add(Evas_Object *parent)
    void                     elm_grid_size_set(Evas_Object *obj, Evas_Coord w, Evas_Coord h)
    void                     elm_grid_size_get(Evas_Object *obj, Evas_Coord *w, Evas_Coord *h)
    void                     elm_grid_pack(Evas_Object *obj, Evas_Object *subobj, Evas_Coord x, Evas_Coord y, Evas_Coord w, Evas_Coord h)
    void                     elm_grid_unpack(Evas_Object *obj, Evas_Object *subobj)
    void                     elm_grid_clear(Evas_Object *obj, Eina_Bool clear)
    void                     elm_grid_pack_set(Evas_Object *subobj, Evas_Coord x, Evas_Coord y, Evas_Coord w, Evas_Coord h)
    void                     elm_grid_pack_get(Evas_Object *subobj, Evas_Coord *x, Evas_Coord *y, Evas_Coord *w, Evas_Coord *h)
    Eina_List               *elm_grid_children_get(Evas_Object *obj)

