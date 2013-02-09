from evas.c_evas cimport Evas_Object, Eina_Bool
from layout_class cimport LayoutClass
from object cimport Object

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Elementary.h":

    # Layout                (api:TODO  cb:DONE  test:DONE  doc:DONE  py3:DONE)
    Evas_Object             *elm_layout_add(Evas_Object *parent)
    Eina_Bool                elm_layout_content_set(Evas_Object *obj, const_char_ptr swallow, Evas_Object *content)
    Evas_Object             *elm_layout_content_get(Evas_Object *obj, const_char_ptr swallow)
    Evas_Object             *elm_layout_content_unset(Evas_Object *obj, const_char_ptr swallow)
    Eina_Bool                elm_layout_text_set(Evas_Object *obj, const_char_ptr part, const_char_ptr text)
    const_char_ptr           elm_layout_text_get(Evas_Object *obj, const_char_ptr part)
