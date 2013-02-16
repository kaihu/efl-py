from evas.general cimport Eina_Bool
from evas.object cimport Evas_Object
from layout_class cimport LayoutClass
from object cimport Object

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    # Video                 (api:DONE  cb:DONE  test:TODO  doc:DONE  py3:DONE)
    Evas_Object             *elm_player_add(Evas_Object *parent)
    Evas_Object             *elm_video_add(Evas_Object *parent)
    Eina_Bool                elm_video_file_set(Evas_Object *video, const_char_ptr filename)
    Evas_Object             *elm_video_emotion_get(Evas_Object *video)
    void                     elm_video_play(Evas_Object *video)
    void                     elm_video_pause(Evas_Object *video)
    void                     elm_video_stop(Evas_Object *video)
    Eina_Bool                elm_video_is_playing_get(Evas_Object *video)
    Eina_Bool                elm_video_is_seekable_get(Evas_Object *video)
    Eina_Bool                elm_video_audio_mute_get(Evas_Object *video)
    void                     elm_video_audio_mute_set(Evas_Object *video, Eina_Bool mute)
    double                   elm_video_audio_level_get(Evas_Object *video)
    void                     elm_video_audio_level_set(Evas_Object *video, double volume)
    double                   elm_video_play_position_get(Evas_Object *video)
    void                     elm_video_play_position_set(Evas_Object *video, double position)
    double                   elm_video_play_length_get(Evas_Object *video)
    void                     elm_video_remember_position_set(Evas_Object *video, Eina_Bool remember)
    Eina_Bool                elm_video_remember_position_get(Evas_Object *video)
    const_char_ptr           elm_video_title_get(Evas_Object *video)

