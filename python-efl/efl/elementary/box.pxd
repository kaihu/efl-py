from evas.general cimport Eina_Bool, Eina_List, const_Eina_List
from evas.object cimport Evas_Object, Evas_Coord
from object cimport Object
from enums cimport Elm_Box_CLayout

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Ecore.h":
    ctypedef void (*Ecore_Cb)(void *data)

cdef extern from "Evas.h":
    ctypedef void *Evas_Object_Box_Data
    ctypedef void *Elm_Box_Transition
    ctypedef void (*Evas_Object_Box_Layout)(Evas_Object *o, Evas_Object_Box_Data *priv, void *user_data)
    void evas_object_box_layout_horizontal(Evas_Object *o, Evas_Object_Box_Data *priv, void *data)
    void evas_object_box_layout_vertical(Evas_Object *o, Evas_Object_Box_Data *priv, void *data)
    void evas_object_box_layout_homogeneous_vertical(Evas_Object *o, Evas_Object_Box_Data *priv, void *data)
    void evas_object_box_layout_homogeneous_horizontal(Evas_Object *o, Evas_Object_Box_Data *priv, void *data)
    void evas_object_box_layout_homogeneous_max_size_horizontal(Evas_Object *o, Evas_Object_Box_Data *priv, void *data)
    void evas_object_box_layout_homogeneous_max_size_vertical(Evas_Object *o, Evas_Object_Box_Data *priv, void *data)
    void evas_object_box_layout_flow_horizontal(Evas_Object *o, Evas_Object_Box_Data *priv, void *data)
    void evas_object_box_layout_flow_vertical(Evas_Object *o, Evas_Object_Box_Data *priv, void *data)
    void evas_object_box_layout_stack(Evas_Object *o, Evas_Object_Box_Data *priv, void *data)
    void elm_box_layout_transition(Evas_Object *o, Evas_Object_Box_Data *priv, void *data)

cdef extern from "Elementary.h":

    # Box                   (api:DONE  cb:N/A   test:DONE  doc:DONE)
    Evas_Object             *elm_box_add(Evas_Object *parent)
    void                     elm_box_horizontal_set(Evas_Object *obj, Eina_Bool horizontal)
    Eina_Bool                elm_box_horizontal_get(Evas_Object *obj)
    void                     elm_box_homogeneous_set(Evas_Object *obj, Eina_Bool homogeneous)
    Eina_Bool                elm_box_homogeneous_get(Evas_Object *obj)
    void                     elm_box_pack_start(Evas_Object *obj, Evas_Object *subobj)
    void                     elm_box_pack_end(Evas_Object *obj, Evas_Object *subobj)
    void                     elm_box_pack_before(Evas_Object *obj, Evas_Object *subobj, Evas_Object *before)
    void                     elm_box_pack_after(Evas_Object *obj, Evas_Object *subobj, Evas_Object *after)
    void                     elm_box_clear(Evas_Object *obj)
    void                     elm_box_unpack(Evas_Object *obj, Evas_Object *subobj)
    void                     elm_box_unpack_all(Evas_Object *obj)
    void                     elm_box_recalculate(Evas_Object *obj)
    Eina_List               *elm_box_children_get(Evas_Object *obj)
    void                     elm_box_padding_set(Evas_Object *obj, Evas_Coord horizontal, Evas_Coord vertical)
    void                     elm_box_padding_get(Evas_Object *obj, Evas_Coord *horizontal, Evas_Coord *vertical)
    void                     elm_box_align_set(Evas_Object *obj, double horizontal, double vertical)
    void                     elm_box_align_get(Evas_Object *obj, double *horizontal, double *vertical)
    void                     elm_box_layout_set(Evas_Object *obj, Evas_Object_Box_Layout cb, void *data, Ecore_Cb free_data)
    Elm_Box_Transition      *elm_box_transition_new(double duration, Evas_Object_Box_Layout start_layout, void *start_layout_data, Ecore_Cb start_layout_free_data, Evas_Object_Box_Layout end_layout, void *end_layout_data, Ecore_Cb end_layout_free_data, Ecore_Cb transition_end_cb, void *transition_end_data)
    void                     elm_box_transition_free(void *data)

