from evas.c_evas cimport Eina_Bool
from evas.c_evas cimport Evas_Object

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Elementary.h":

    # Need
    Eina_Bool                elm_need_efreet()
    Eina_Bool                elm_need_e_dbus()
    Eina_Bool                elm_need_ethumb()
    Eina_Bool                elm_need_web()
