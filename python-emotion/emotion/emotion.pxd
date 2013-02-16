# Copyright (C) 2007-2012 Gustavo Sverzut Barbieri, Ulisses Furquim
#
# This file is part of Python-Emotion.
#
# Python-Emotion is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# Python-Emotion is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this Python-Emotion.  If not, see <http://www.gnu.org/licenses/>.

from evas.general cimport Eina_Bool
from evas.object cimport Evas_Object, const_Evas_Object, Object
from evas.object_smart cimport  evas_object_smart_callback_add, \
                                evas_object_smart_callback_del
from evas.canvas cimport Evas, Canvas

from enums cimport  Emotion_Module, \
                    Emotion_Event, \
                    Emotion_Meta_Info, \
                    Emotion_Channel_Settings, \
                    Emotion_Vis, \
                    Emotion_Suspend, \
                    Emotion_Aspect

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Emotion.h":
    Evas_Object *       emotion_object_add(Evas *e)
    void                emotion_object_module_option_set(Evas_Object *obj, const_char_ptr opt, const_char_ptr val)
    Eina_Bool           emotion_object_init(Evas_Object *obj, const_char_ptr module_filename)

    void                emotion_object_border_set(Evas_Object *obj, int l, int r, int t, int b)
    void                emotion_object_border_get(Evas_Object *obj, int *l, int *r, int *t, int *b)
    void                emotion_object_bg_color_set(Evas_Object *obj, int r, int g, int b, int a)
    void                emotion_object_bg_color_get(Evas_Object *obj, int *r, int *g, int *b, int *a)
    void                emotion_object_keep_aspect_set(Evas_Object *obj, Emotion_Aspect a)
    Emotion_Aspect      emotion_object_keep_aspect_get(Evas_Object *obj)

    void                emotion_object_file_set(Evas_Object *obj, const_char_ptr filename)
    const_char_ptr      emotion_object_file_get(Evas_Object *obj)

    void                emotion_object_play_set(Evas_Object *obj, Eina_Bool play)
    Eina_Bool           emotion_object_play_get(Evas_Object *obj)

    void                emotion_object_position_set(Evas_Object *obj, double sec)
    double              emotion_object_position_get(Evas_Object *obj)

    double              emotion_object_buffer_size_get(Evas_Object *obj)
    Eina_Bool           emotion_object_seekable_get(Evas_Object *obj)
    double              emotion_object_play_length_get(Evas_Object *obj)

    void                emotion_object_play_speed_set(Evas_Object *obj, double speed)
    double              emotion_object_play_speed_get(Evas_Object *obj)

    const_char_ptr      emotion_object_progress_info_get(Evas_Object *obj)
    double              emotion_object_progress_status_get(Evas_Object *obj)

    Eina_Bool           emotion_object_video_handled_get(Evas_Object *obj)
    Eina_Bool           emotion_object_audio_handled_get(Evas_Object *obj)

    double              emotion_object_ratio_get(Evas_Object *obj)
    void                emotion_object_size_get(Evas_Object *obj, int *iw, int *ih)

    void                emotion_object_smooth_scale_set(Evas_Object *obj, Eina_Bool smooth)
    Eina_Bool           emotion_object_smooth_scale_get(Evas_Object *obj)

    void                emotion_object_event_simple_send(Evas_Object *obj, Emotion_Event ev)

    void                emotion_object_audio_volume_set(Evas_Object *obj, double vol)
    double              emotion_object_audio_volume_get(Evas_Object *obj)
    void                emotion_object_audio_mute_set(Evas_Object *obj, Eina_Bool mute)
    Eina_Bool           emotion_object_audio_mute_get(Evas_Object *obj)
    int                 emotion_object_audio_channel_count(Evas_Object *obj)
    const_char_ptr      emotion_object_audio_channel_name_get(Evas_Object *obj, int channel)
    void                emotion_object_audio_channel_set(Evas_Object *obj, int channel)
    int                 emotion_object_audio_channel_get(Evas_Object *obj)

    void                emotion_object_video_mute_set(Evas_Object *obj, Eina_Bool mute)
    Eina_Bool           emotion_object_video_mute_get(Evas_Object *obj)
    int                 emotion_object_video_channel_count(Evas_Object *obj)
    const_char_ptr      emotion_object_video_channel_name_get(Evas_Object *obj, int channel)
    void                emotion_object_video_channel_set(Evas_Object *obj, int channel)
    int                 emotion_object_video_channel_get(Evas_Object *obj)

    void                emotion_object_spu_mute_set(Evas_Object *obj, Eina_Bool mute)
    Eina_Bool           emotion_object_spu_mute_get(Evas_Object *obj)
    int                 emotion_object_spu_channel_count(Evas_Object *obj)
    const_char_ptr      emotion_object_spu_channel_name_get(Evas_Object *obj, int channel)
    void                emotion_object_spu_channel_set(Evas_Object *obj, int channel)
    int                 emotion_object_spu_channel_get(Evas_Object *obj)

    int                 emotion_object_chapter_count(Evas_Object *obj)
    void                emotion_object_chapter_set(Evas_Object *obj, int chapter)
    int                 emotion_object_chapter_get(Evas_Object *obj)
    const_char_ptr      emotion_object_chapter_name_get(Evas_Object *obj, int chapter)

    void                emotion_object_eject(Evas_Object *obj)

    char *              emotion_object_title_get(Evas_Object *obj)
    const_char_ptr      emotion_object_ref_file_get(Evas_Object *obj)
    int                 emotion_object_ref_num_get(Evas_Object *obj)
    int                 emotion_object_spu_button_count_get(Evas_Object *obj)
    int                 emotion_object_spu_button_get(Evas_Object *obj)
    const_char_ptr      emotion_object_meta_info_get(Evas_Object *obj, Emotion_Meta_Info meta)

    void                emotion_object_vis_set(Evas_Object *obj, Emotion_Vis visualization)
    Emotion_Vis         emotion_object_vis_get(Evas_Object *obj)
    Eina_Bool           emotion_object_vis_supported(Evas_Object *obj, Emotion_Vis visualization)

    void                emotion_object_priority_set(Evas_Object *obj, Eina_Bool priority)
    Eina_Bool           emotion_object_priority_get(Evas_Object *obj)
    void                emotion_object_suspend_set(Evas_Object *obj, Emotion_Suspend state)
    Emotion_Suspend     motion_object_suspend_get(Evas_Object *obj)
    void                emotion_object_last_position_load(Evas_Object *obj)
    void                emotion_object_last_position_save(Evas_Object *obj)

    Eina_Bool           emotion_object_extension_may_play_fast_get(const_char_ptr file)
    Eina_Bool           emotion_object_extension_may_play_get(const_char_ptr file)
    Evas_Object *       emotion_object_image_get(Evas_Object *obj)

    # TODO: Webcam stuff

cdef class Emotion(Object):
    cdef object _emotion_callbacks
