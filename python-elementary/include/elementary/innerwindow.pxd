from evas.c_evas cimport Evas_Object
from layout_class cimport LayoutClass
from object cimport Object

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Elementary.h":

    # Inwin                 (api:DONE  cb:N/A   test:DONE  doc:DONE)
    Evas_Object             *elm_win_inwin_add(Evas_Object *obj)
    void                     elm_win_inwin_activate(Evas_Object *obj)
    void                     elm_win_inwin_content_set(Evas_Object *obj, Evas_Object *content)
    Evas_Object             *elm_win_inwin_content_get(Evas_Object *obj)
    Evas_Object             *elm_win_inwin_content_unset(Evas_Object *obj)

