from evas.general cimport Eina_Bool
from evas.object cimport Evas_Object, Evas_Coord
from object cimport Object

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Elementary.h":

    # Table                 (api:DONE  cb:DONE  test:DONE  doc:DONE)
    Evas_Object             *elm_table_add(Evas_Object *parent)
    void                     elm_table_homogeneous_set(Evas_Object *obj, Eina_Bool homogeneous)
    Eina_Bool                elm_table_homogeneous_get(Evas_Object *obj)
    void                     elm_table_padding_set(Evas_Object *obj, Evas_Coord horizontal, Evas_Coord vertical)
    void                     elm_table_padding_get(Evas_Object *obj, Evas_Coord *horizontal, Evas_Coord *vertical)
    void                     elm_table_pack(Evas_Object *obj, Evas_Object *subobj, int x, int y, int w, int h)
    void                     elm_table_unpack(Evas_Object *obj, Evas_Object *subobj)
    void                     elm_table_clear(Evas_Object *obj, Eina_Bool clear)
    void                     elm_table_pack_set(Evas_Object *subobj, int x, int y, int w, int h)
    void                     elm_table_pack_get(Evas_Object *subobj, int *x, int *y, int *w, int *h)

