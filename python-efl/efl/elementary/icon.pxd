from evas.general cimport Eina_Bool
from evas.object cimport Evas_Object
from image cimport Image
from object cimport Object
from enums cimport Elm_Icon_Lookup_Order, Elm_Icon_Type

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    # Icon                  (api:DONE  cb:DONE  test:DONE  doc:DONE  py3:DONE)
    Evas_Object             *elm_icon_add(Evas_Object *parent)
    void                     elm_icon_thumb_set(Evas_Object *obj, const_char_ptr file, const_char_ptr group)
    Eina_Bool                elm_icon_standard_set(Evas_Object *obj, const_char_ptr name)
    const_char_ptr           elm_icon_standard_get(Evas_Object *obj)
    void                     elm_icon_order_lookup_set(Evas_Object *obj, Elm_Icon_Lookup_Order order)
    Elm_Icon_Lookup_Order    elm_icon_order_lookup_get(Evas_Object *obj)

