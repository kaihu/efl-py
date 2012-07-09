# Copyright (c) 2008 Simon Busch
#
# This file is part of python-elementary.
#
# python-elementary is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# python-elementary is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with python-elementary.  If not, see <http://www.gnu.org/licenses/>.
#

from evas.general cimport Eina_List, Eina_Bool, const_Eina_List
from evas.general cimport Eina_Rectangle, Eina_Compare_Cb
from evas.object cimport Evas_Object, const_Evas_Object
from evas.general cimport Evas_Coord
from evas.object cimport Evas_Callback_Type
from evas.object cimport Evas_Smart_Cb
from evas.object_text cimport Evas_Font_Size
from evas.general cimport Evas_Load_Error
from evas.events cimport Evas_Event_Flags

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"
    ctypedef void const_void "const void"

cdef extern from "stdlib.h":
    void free(void *ptr)

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

cdef extern from "Ecore.h":
    ctypedef void (*Ecore_Cb)(void *data)

cdef extern from "Edje.h":
    ctypedef void (*Edje_Signal_Cb)(void *data, Evas_Object *obj, const_char_ptr emission, const_char_ptr source)

# For Debugging
"""
cdef extern from "Ecore_Evas.h":
    ctypedef struct Ecore_Evas
    void ecore_evas_geometry_get(Ecore_Evas *ee, int *x, int *y, int *w, int *h)

cdef extern from "Ecore.h":
    ctypedef struct Ecore_Job

ctypedef struct Elm_Win:
    Ecore_Evas *ee
    evas.c_evas.Evas *evas
    Evas_Object *parent
    Evas_Object *win_obj
    Eina_List *subobjs
    Ecore_X_ID xwin
    Ecore_Job *deferred_resize_job
    Ecore_Job *deferred_child_eval_job
    Elm_Win_Type type
    Elm_Win_Keyboard_Mode kbdmode
    Eina_Bool autodel = 1
"""

cdef extern from "Elementary.h":

    # enums

    ctypedef enum Elm_Cnp_Mode:
        ELM_CNP_MODE_MARKUP     # copy & paste text with markup tag
        ELM_CNP_MODE_NO_IMAGE   # copy & paste text without item(image) tag
        ELM_CNP_MODE_PLAINTEXT  # copy & paste text without markup tag

    ctypedef enum Elm_Focus_Direction:
        ELM_FOCUS_PREVIOUS
        ELM_FOCUS_NEXT

    ctypedef enum Elm_Illume_Command:
        ELM_ILLUME_COMMAND_FOCUS_BACK
        ELM_ILLUME_COMMAND_FOCUS_FORWARD
        ELM_ILLUME_COMMAND_FOCUS_HOME
        ELM_ILLUME_COMMAND_CLOSE

    ctypedef enum Elm_Policy:
        ELM_POLICY_QUIT
        ELM_POLICY_LAST

    ctypedef enum Elm_Policy_Quit:
        ELM_POLICY_QUIT_NONE
        ELM_POLICY_QUIT_LAST_WINDOW_CLOSED

    ctypedef enum Elm_Text_Format:
        ELM_TEXT_FORMAT_PLAIN_UTF8
        ELM_TEXT_FORMAT_MARKUP_UTF8

    ctypedef enum Elm_Wrap_Type:
        ELM_WRAP_NONE
        ELM_WRAP_CHAR
        ELM_WRAP_WORD
        ELM_WRAP_MIXED

    # types & structs

    #colors
    ctypedef struct Elm_Color_RGBA:
        unsigned int r
        unsigned int g
        unsigned int b
        unsigned int a

    ctypedef struct _Elm_Custom_Palette:
        const_char_ptr palette_name
        Eina_List *color_list

    #event
    ctypedef Eina_Bool       (*Elm_Event_Cb)                (void *data, Evas_Object *obj, Evas_Object *src, Evas_Callback_Type t, void *event_info)

    #font
    ctypedef struct Elm_Font_Overlay:
        const_char_ptr text_class
        const_char_ptr font
        Evas_Font_Size size

    #text
    ctypedef struct Elm_Text_Class:
        const_char_ptr name
        const_char_ptr desc

    #tooltip
    ctypedef Evas_Object    *(*Elm_Tooltip_Content_Cb)      (void *data, Evas_Object *obj, Evas_Object *tooltip)
    ctypedef Evas_Object    *(*Elm_Tooltip_Item_Content_Cb) (void *data, Evas_Object *obj, Evas_Object *tooltip, void *item)


    # General
    void                     elm_init(int argc, char** argv)
    void                     elm_shutdown()
    void                     elm_run() nogil
    void                     elm_exit()

    # General - Quicklaunch (XXX: Only used by macros?)
    void                     elm_quicklaunch_init(int argc, char **argv)
    void                     elm_quicklaunch_sub_init(int argc, char **argv)
    void                     elm_quicklaunch_sub_shutdown()
    void                     elm_quicklaunch_shutdown()
    void                     elm_quicklaunch_seed()
    Eina_Bool                elm_quicklaunch_prepare(int argc, char **argv)
    Eina_Bool                elm_quicklaunch_fork(int argc, char **argv, char *cwd, void (*postfork_func) (void *data), void *postfork_data)
    void                     elm_quicklaunch_cleanup()
    int                      elm_quicklaunch_fallback(int argc, char **argv)
    char                    *elm_quicklaunch_exe_path_get(char *exe)

    # General - Policy
    Eina_Bool                elm_policy_set(unsigned int policy, int value)
    int                      elm_policy_get(unsigned int policy)

    # General - Language    (py3: TODO)
    void                     elm_language_set(const_char_ptr lang)

    # Finger
    void                     elm_coords_finger_size_adjust(int times_w, Evas_Coord *w, int times_h, Evas_Coord *h)

cdef int PY_REFCOUNT(object o)
cdef _METHOD_DEPRECATED(self, replacement=*, message=*)
cdef inline unicode _touni(char* s)
cdef inline unicode _ctouni(const_char_ptr s)
cdef inline char* _fruni(s)
cdef inline const_char_ptr _cfruni(s)
