from canvas cimport Evas, Canvas
from object cimport Evas_Object, const_Evas_Object, Object
from general cimport Eina_Bool, Evas_Coord

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"
    ctypedef void const_void "const void"

cdef extern from "Evas.h":

    ctypedef struct Evas_Object_Box_Option:
        Evas_Object *obj

    ####################################################################
    # Box Object
    #
    Evas_Object *evas_object_box_add(Evas *e)
    Evas_Object *evas_object_box_add_to(Evas_Object *parent)

    void evas_object_box_align_set(Evas_Object  *o, double horizontal, double vertical)
    void evas_object_box_align_get(const_Evas_Object *o, double *horizontal, double *vertical)
    void evas_object_box_padding_set(Evas_Object *o, Evas_Coord horizontal, Evas_Coord vertical)
    void evas_object_box_padding_get(const_Evas_Object *o, Evas_Coord *horizontal, Evas_Coord *vertical)

    Evas_Object_Box_Option *evas_object_box_append(Evas_Object *o, Evas_Object *child)
    Evas_Object_Box_Option *evas_object_box_prepend(Evas_Object *o, Evas_Object *child)
    Evas_Object_Box_Option *evas_object_box_insert_before(Evas_Object *o, Evas_Object *child, Evas_Object *reference)
    Evas_Object_Box_Option *evas_object_box_insert_after(Evas_Object *o, Evas_Object *child, Evas_Object *reference)
    Evas_Object_Box_Option *evas_object_box_insert_at(Evas_Object *o, Evas_Object *child, unsigned int pos)

    Eina_Bool evas_object_box_remove(Evas_Object *o, Evas_Object *child)
    Eina_Bool evas_object_box_remove_at(Evas_Object *o, unsigned int pos)
    Eina_Bool evas_object_box_remove_all(Evas_Object *o, Eina_Bool clear)

cdef class Box(Object):
    pass
