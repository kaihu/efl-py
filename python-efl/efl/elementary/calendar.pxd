from evas.general cimport Eina_Bool, Eina_List, const_Eina_List
from evas.object cimport Evas_Object
from layout_class cimport LayoutClass
from object cimport Object
from enums cimport Elm_Calendar_Mark_Repeat_Type, Elm_Calendar_Select_Mode, \
    Elm_Calendar_Weekday

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "string.h":
    void *memcpy(void *dst, void *src, int n)
    char *strdup(char *str)

cdef extern from "time.h":
    struct tm:
        int tm_sec
        int tm_min
        int tm_hour
        int tm_mday
        int tm_mon
        int tm_year
        int tm_wday
        int tm_yday
        int tm_isdst

        long int tm_gmtoff
        const_char_ptr tm_zone

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    ctypedef char           *(*Elm_Calendar_Format_Cb)     (tm *stime)

    ctypedef struct Elm_Calendar_Mark:
        Evas_Object *obj
        Eina_List *node
        tm *mark_time
        const_char_ptr mark_type
        Elm_Calendar_Mark_Repeat_Type repeat

    # Calendar              (api:TODO  cb:DONE  test:TODO  doc:DONE  py3:DONE)
    Evas_Object             *elm_calendar_add(Evas_Object *parent)
    const_char_ptr          *elm_calendar_weekdays_names_get(Evas_Object *obj)
    void                     elm_calendar_weekdays_names_set(Evas_Object *obj, const_char_ptr weekdays[])
    void                     elm_calendar_min_max_year_set(Evas_Object *obj, int min, int max)
    void                     elm_calendar_min_max_year_get(Evas_Object *obj, int *min, int *max)
    void                     elm_calendar_select_mode_set(Evas_Object *obj, Elm_Calendar_Select_Mode mode)
    Elm_Calendar_Select_Mode elm_calendar_select_mode_get(Evas_Object *obj)
    void                     elm_calendar_selected_time_set(Evas_Object *obj, tm *selected_time)
    Eina_Bool                elm_calendar_selected_time_get(Evas_Object *obj, tm *selected_time)
    void                     elm_calendar_format_function_set(Evas_Object *obj, Elm_Calendar_Format_Cb format_func)
    Elm_Calendar_Mark       *elm_calendar_mark_add(Evas_Object *obj, const_char_ptr mark_type, tm *mark_time, Elm_Calendar_Mark_Repeat_Type repeat)
    void                     elm_calendar_mark_del(Elm_Calendar_Mark *mark)
    void                     elm_calendar_marks_clear(Evas_Object *obj)
    const_Eina_List         *elm_calendar_marks_get(Evas_Object *obj)
    void                     elm_calendar_marks_draw(Evas_Object *obj)
    void                     elm_calendar_interval_set(Evas_Object *obj, double interval)
    double                   elm_calendar_interval_get(Evas_Object *obj)
    void                     elm_calendar_first_day_of_week_set(Evas_Object *obj, Elm_Calendar_Weekday day)
    Elm_Calendar_Weekday     elm_calendar_first_day_of_week_get(Evas_Object *obj)

