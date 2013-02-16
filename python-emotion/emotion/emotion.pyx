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

from cpython cimport PyObject

import urllib

from evas.object import _object_mapping_register
from evas.object cimport Object_from_instance

cimport enums

EMOTION_MODULE_XINE = enums.EMOTION_MODULE_XINE
EMOTION_MODULE_GSTREAMER = enums.EMOTION_MODULE_GSTREAMER

EMOTION_EVENT_MENU1 = enums.EMOTION_EVENT_MENU1
EMOTION_EVENT_MENU2 = enums.EMOTION_EVENT_MENU2
EMOTION_EVENT_MENU3 = enums.EMOTION_EVENT_MENU3
EMOTION_EVENT_MENU4 = enums.EMOTION_EVENT_MENU4
EMOTION_EVENT_MENU5 = enums.EMOTION_EVENT_MENU5
EMOTION_EVENT_MENU6 = enums.EMOTION_EVENT_MENU6
EMOTION_EVENT_MENU7 = enums.EMOTION_EVENT_MENU7
EMOTION_EVENT_UP = enums.EMOTION_EVENT_UP
EMOTION_EVENT_DOWN = enums.EMOTION_EVENT_DOWN
EMOTION_EVENT_LEFT = enums.EMOTION_EVENT_LEFT
EMOTION_EVENT_RIGHT = enums.EMOTION_EVENT_RIGHT
EMOTION_EVENT_SELECT = enums.EMOTION_EVENT_SELECT
EMOTION_EVENT_NEXT = enums.EMOTION_EVENT_NEXT
EMOTION_EVENT_PREV = enums.EMOTION_EVENT_PREV
EMOTION_EVENT_ANGLE_NEXT = enums.EMOTION_EVENT_ANGLE_NEXT
EMOTION_EVENT_ANGLE_PREV = enums.EMOTION_EVENT_ANGLE_PREV
EMOTION_EVENT_FORCE = enums.EMOTION_EVENT_FORCE
EMOTION_EVENT_0 = enums.EMOTION_EVENT_0
EMOTION_EVENT_1 = enums.EMOTION_EVENT_1
EMOTION_EVENT_2 = enums.EMOTION_EVENT_2
EMOTION_EVENT_3 = enums.EMOTION_EVENT_3
EMOTION_EVENT_4 = enums.EMOTION_EVENT_4
EMOTION_EVENT_5 = enums.EMOTION_EVENT_5
EMOTION_EVENT_6 = enums.EMOTION_EVENT_6
EMOTION_EVENT_7 = enums.EMOTION_EVENT_7
EMOTION_EVENT_8 = enums.EMOTION_EVENT_8
EMOTION_EVENT_9 = enums.EMOTION_EVENT_9
EMOTION_EVENT_10 = enums.EMOTION_EVENT_10

EMOTION_META_INFO_TRACK_TITLE = enums.EMOTION_META_INFO_TRACK_TITLE
EMOTION_META_INFO_TRACK_ARTIST = enums.EMOTION_META_INFO_TRACK_ARTIST
EMOTION_META_INFO_TRACK_ALBUM = enums.EMOTION_META_INFO_TRACK_ALBUM
EMOTION_META_INFO_TRACK_YEAR = enums.EMOTION_META_INFO_TRACK_YEAR
EMOTION_META_INFO_TRACK_GENRE = enums.EMOTION_META_INFO_TRACK_GENRE
EMOTION_META_INFO_TRACK_COMMENT = enums.EMOTION_META_INFO_TRACK_COMMENT
EMOTION_META_INFO_TRACK_DISC_ID = enums.EMOTION_META_INFO_TRACK_DISC_ID
EMOTION_META_INFO_TRACK_COUNT = enums.EMOTION_META_INFO_TRACK_COUNT

EMOTION_CHANNEL_AUTO = enums.EMOTION_CHANNEL_AUTO
EMOTION_CHANNEL_DEFAULT = enums.EMOTION_CHANNEL_DEFAULT

EMOTION_VIS_NONE = enums.EMOTION_VIS_NONE
EMOTION_VIS_GOOM = enums.EMOTION_VIS_GOOM
EMOTION_VIS_LIBVISUAL_BUMPSCOPE = enums.EMOTION_VIS_LIBVISUAL_BUMPSCOPE
EMOTION_VIS_LIBVISUAL_CORONA = enums.EMOTION_VIS_LIBVISUAL_CORONA
EMOTION_VIS_LIBVISUAL_DANCING_PARTICLES = enums.EMOTION_VIS_LIBVISUAL_DANCING_PARTICLES
EMOTION_VIS_LIBVISUAL_GDKPIXBUF = enums.EMOTION_VIS_LIBVISUAL_GDKPIXBUF
EMOTION_VIS_LIBVISUAL_G_FORCE = enums.EMOTION_VIS_LIBVISUAL_G_FORCE
EMOTION_VIS_LIBVISUAL_GOOM = enums.EMOTION_VIS_LIBVISUAL_GOOM
EMOTION_VIS_LIBVISUAL_INFINITE = enums.EMOTION_VIS_LIBVISUAL_INFINITE
EMOTION_VIS_LIBVISUAL_JAKDAW = enums.EMOTION_VIS_LIBVISUAL_JAKDAW
EMOTION_VIS_LIBVISUAL_JESS = enums.EMOTION_VIS_LIBVISUAL_JESS
EMOTION_VIS_LIBVISUAL_LV_ANALYSER = enums.EMOTION_VIS_LIBVISUAL_LV_ANALYSER
EMOTION_VIS_LIBVISUAL_LV_FLOWER = enums.EMOTION_VIS_LIBVISUAL_LV_FLOWER
EMOTION_VIS_LIBVISUAL_LV_GLTEST = enums.EMOTION_VIS_LIBVISUAL_LV_GLTEST
EMOTION_VIS_LIBVISUAL_LV_SCOPE = enums.EMOTION_VIS_LIBVISUAL_LV_SCOPE
EMOTION_VIS_LIBVISUAL_MADSPIN = enums.EMOTION_VIS_LIBVISUAL_MADSPIN
EMOTION_VIS_LIBVISUAL_NEBULUS = enums.EMOTION_VIS_LIBVISUAL_NEBULUS
EMOTION_VIS_LIBVISUAL_OINKSIE = enums.EMOTION_VIS_LIBVISUAL_OINKSIE
EMOTION_VIS_LIBVISUAL_PLASMA = enums.EMOTION_VIS_LIBVISUAL_PLASMA
EMOTION_VIS_LAST = enums.EMOTION_VIS_LAST

EMOTION_WAKEUP = enums.EMOTION_WAKEUP
EMOTION_SLEEP = enums.EMOTION_SLEEP
EMOTION_DEEP_SLEEP = enums.EMOTION_DEEP_SLEEP
EMOTION_HIBERNATE = enums.EMOTION_HIBERNATE

EMOTION_ASPECT_KEEP_NONE = enums.EMOTION_ASPECT_KEEP_NONE
EMOTION_ASPECT_KEEP_WIDTH = enums.EMOTION_ASPECT_KEEP_WIDTH
EMOTION_ASPECT_KEEP_HEIGHT = enums.EMOTION_ASPECT_KEEP_HEIGHT
EMOTION_ASPECT_KEEP_BOTH = enums.EMOTION_ASPECT_KEEP_BOTH
EMOTION_ASPECT_CROP = enums.EMOTION_ASPECT_CROP
EMOTION_ASPECT_CUSTOM = enums.EMOTION_ASPECT_CUSTOM

cdef int PY_REFCOUNT(object o):
    cdef PyObject *obj = <PyObject *>o
    return obj.ob_refcnt

cdef inline unicode _ctouni(const_char_ptr s):
    return s.decode('UTF-8', 'strict') if s else None

cdef inline const_char_ptr _cfruni(s):
    cdef const_char_ptr c_string
    if isinstance(s, unicode):
        string = s.encode('UTF-8')
        c_string = string
    elif isinstance(s, str):
        c_string = s
    else:
        raise TypeError("Expected str or unicode object, got %s" % (type(s).__name__))
    return c_string

cdef void _emotion_callback(void *data,
                            Evas_Object *o, void *ei) with gil:
    cdef Emotion obj
    cdef object event
    obj = <Emotion>Object_from_instance(o)
    event = <object>data
    lst = tuple(obj._emotion_callbacks[event])
    for func, args, kargs in lst:
        try:
            func(obj, *args, **kargs)
        except Exception, e:
            import traceback
            traceback.print_exc()


class EmotionModuleInitError(Exception):
    pass


cdef class Emotion(Object):
    def __cinit__(self, *a, **ka):
        self._emotion_callbacks = {}

    def __init__(self, Canvas canvas not None, **kargs):
        Object.__init__(self, canvas)
        if self.obj == NULL:
            self._set_obj(emotion_object_add(self.evas.obj))
        self._set_common_params(**kargs)

    def _set_common_params(self,
                           char *module_filename="emotion_decoder_xine.so",
                           module_params=None, size=None, pos=None,
                           geometry=None, color=None, name=None):
        Object._set_common_params(self, size=size, pos=pos,
                                              geometry=geometry, color=color,
                                              name=name)
        if emotion_object_init(self.obj, module_filename) == 0:
            raise EmotionModuleInitError("failed to initialize module '%s'" %
                                         module_filename)

        if isinstance(module_params, (tuple, list)):
            module_params = dict(module_params)
        if isinstance(module_params, dict):
            for opt, val in module_params.iteritems():
                emotion_object_module_option_set(self.obj, opt, val)

    def __str__(self):
        x, y, w, h = self.geometry_get()
        r, g, b, a = self.color_get()
        name = self.name_get()
        if name:
            name_str = "name=%r, "
        else:
            name_str = ""
        return ("%s(%sfile=%r, geometry=(%d, %d, %d, %d), "
                "color=(%d, %d, %d, %d), layer=%s, clip=%s, visible=%s)") % \
               (self.__class__.__name__, name_str, self.file_get(), x, y, w, h,
                r, g, b, a, self.layer_get(), self.clip_get(),
                self.visible_get())

    def __repr__(self):
        x, y, w, h = self.geometry_get()
        r, g, b, a = self.color_get()
        return ("%s(%#x, type=%r, refcount=%d, Evas_Object=%#x, name=%r, "
                "file=%r, geometry=(%d, %d, %d, %d), "
                "color=(%d, %d, %d, %d), layer=%s, clip=%r, visible=%s)") % \
               (self.__class__.__name__, <unsigned long><void *>self,
                self.type_get(), PY_REFCOUNT(self), <unsigned long>self.obj,
                self.name_get(), self.file_get(), x, y, w, h, r, g, b, a,
                self.layer_get(), self.clip_get(), self.visible_get())


    property border:
        def __set__(self, value):
            cdef int l, r, t, b
            l, r, t, b = value
            emotion_object_border_set(self.obj, l, r, t, b)

        def __get__(self):
            cdef int l, r, t, b
            emotion_object_border_get(self.obj, &l, &r, &t, &b)
            return l, r, t, b

    def border_set(self, int l, int r, int t, int b):
        emotion_object_border_set(self.obj, l, r, t, b)

    def border_get(self):
        cdef int l, r, t, b
        emotion_object_border_get(self.obj, &l, &r, &t, &b)
        return l, r, t, b

    property bg_color:
        def __set__(self, value):
            cdef int r, g, b, a
            r, g, b, a = value
            emotion_object_bg_color_set(self.obj, r, g, b, a)

        def __get__(self):
            cdef int r, g, b, a
            emotion_object_bg_color_get(self.obj, &r, &g, &b, &a)
            return r, g, b, a

    def bg_color_set(self, int r, int g, int b, int a):
        emotion_object_bg_color_set(self.obj, r, g, b, a)

    def bg_color_get(self):
        cdef int r, g, b, a
        emotion_object_bg_color_get(self.obj, &r, &g, &b, &a)
        return r, g, b, a

    property keep_aspect:
        def __set__(self, int a):
            emotion_object_keep_aspect_set(self.obj, <Emotion_Aspect>a)

        def __get__(self):
            int(emotion_object_keep_aspect_get(self.obj))

    def keep_aspect_set(self, int a):
        emotion_object_keep_aspect_set(self.obj, <Emotion_Aspect>a)
    def keep_aspect_get(self):
        int(emotion_object_keep_aspect_get(self.obj))

    property unquoted_url:
        def __get__(self):
            cdef const_char_ptr f = emotion_object_file_get(self.obj)
            if not f:
                return None
            fn = urllib.unquote(f)
            fn = fn.decode("utf-8")
            return fn

        def __set__(self, unicode fn):
            cdef const_char_ptr f
            fn = fn.encode("utf-8")
            fn = urllib.quote(fn)
            f = fn
            emotion_object_file_set(self.obj, f)

    property file:
        def __get__(self):
            cdef const_char_ptr f = emotion_object_file_get(self.obj)
            return f if f else None

        def __set__(self, value):
            emotion_object_file_set(self.obj, _cfruni(value))

    def file_get(self):
        cdef const_char_ptr f = emotion_object_file_get(self.obj)
        return f if f else None

    def file_set(self, value):
        emotion_object_file_set(self.obj, _cfruni(value))

    property play:
        def __get__(self):
            return bool(emotion_object_play_get(self.obj))

        def __set__(self, int value):
            emotion_object_play_set(self.obj, value)

    def play_get(self):
        return bool(emotion_object_play_get(self.obj))

    def play_set(self, int value):
        emotion_object_play_set(self.obj, value)

    property position:
        def __get__(self):
            return emotion_object_position_get(self.obj)

        def __set__(self, double value):
            emotion_object_position_set(self.obj, value)

    def position_get(self):
        return emotion_object_position_get(self.obj)

    def position_set(self, double value):
        emotion_object_position_set(self.obj, value)

    property buffer_size:
        def __get__(self):
            return emotion_object_buffer_size_get(self.obj)

    def buffer_size_get(self):
        return emotion_object_buffer_size_get(self.obj)

    property seekable:
        def __get__(self):
            return bool(emotion_object_seekable_get(self.obj))

    def seekable_get(self):
        return bool(emotion_object_seekable_get(self.obj))

    property play_length:
        def __get__(self):
            return emotion_object_play_length_get(self.obj)

    def play_length_get(self):
        return emotion_object_play_length_get(self.obj)

    property play_speed:
        def __get__(self):
            return self.play_speed_get()

        def __set__(self, double value):
            self.play_speed_set(value)

    def play_speed_get(self):
        return emotion_object_play_speed_get(self.obj)

    def play_speed_set(self, double value):
        emotion_object_play_speed_set(self.obj, value)

    property progress_info:
        def __get__(self):
            return self.progress_info_get()

    def progress_info_get(self):
        return _ctouni(emotion_object_progress_info_get(self.obj))

    property progress_status:
        def __get__(self):
            return self.progress_status_get()

    def progress_status_get(self):
        return emotion_object_progress_status_get(self.obj)

    property video_handled:
        def __get__(self):
            return bool(emotion_object_video_handled_get(self.obj))

    def video_handled_get(self):
        return bool(emotion_object_video_handled_get(self.obj))

    property audio_handled:
        def __get__(self):
            return bool(emotion_object_audio_handled_get(self.obj))

    def audio_handled_get(self):
        return bool(emotion_object_audio_handled_get(self.obj))

    property ratio:
        def __get__(self):
            return emotion_object_ratio_get(self.obj)

    def ratio_get(self):
        return emotion_object_ratio_get(self.obj)

    # Override evas here?
    property image_size:
        def __get__(self):
            cdef int w, h
            emotion_object_size_get(self.obj, &w, &h)
            return (w, h)

    def image_size_get(self):
        cdef int w, h
        emotion_object_size_get(self.obj, &w, &h)
        return (w, h)

    property smooth_scale:
        def __get__(self):
            return bool(emotion_object_smooth_scale_get(self.obj))

        def __set__(self, int value):
            emotion_object_smooth_scale_set(self.obj, value)

    def smooth_scale_get(self):
        return bool(emotion_object_smooth_scale_get(self.obj))

    def smooth_scale_set(self, int value):
        emotion_object_smooth_scale_set(self.obj, value)

    def event_simple_send(self, int event_id):
        emotion_object_event_simple_send(self.obj, <Emotion_Event>event_id)

    property audio_volume:
        def __get__(self):
            return emotion_object_audio_volume_get(self.obj)

        def __set__(self, double value):
            emotion_object_audio_volume_set(self.obj, value)

    def audio_volume_get(self):
        return emotion_object_audio_volume_get(self.obj)

    def audio_volume_set(self, double value):
        emotion_object_audio_volume_set(self.obj, value)

    property audio_mute:
        def __get__(self):
            return emotion_object_audio_mute_get(self.obj)

        def __set__(self, int value):
            emotion_object_audio_mute_set(self.obj, value)

    def audio_mute_get(self):
        return emotion_object_audio_mute_get(self.obj)

    def audio_mute_set(self, int value):
        emotion_object_audio_mute_set(self.obj, value)

    def audio_channel_count(self):
        return emotion_object_audio_channel_count(self.obj)

    def audio_channel_name_get(self, int channel):
        return _ctouni(emotion_object_audio_channel_name_get(self.obj, channel))

    property audio_channel:
        def __get__(self):
            return emotion_object_audio_channel_get(self.obj)

        def __set__(self, int channel):
            emotion_object_audio_channel_set(self.obj, channel)

    def audio_channel_get(self):
        return emotion_object_audio_channel_get(self.obj)

    def audio_channel_set(self, int channel):
        emotion_object_audio_channel_set(self.obj, channel)

    property video_mute:
        def __get__(self):
            return self.video_mute_get()

        def __set__(self, int value):
            self.video_mute_set(value)

    def video_mute_get(self):
        return emotion_object_video_mute_get(self.obj)

    def video_mute_set(self, int value):
        emotion_object_video_mute_set(self.obj, value)

    def video_channel_count(self):
        return emotion_object_video_channel_count(self.obj)

    def video_channel_name_get(self, int channel):
        return _ctouni(emotion_object_video_channel_name_get(self.obj, channel))

    property video_channel:
        def __get__(self):
            return self.video_channel_get()

        def __set__(self, int value):
            self.video_channel_set(value)

    def video_channel_get(self):
        return emotion_object_video_channel_get(self.obj)

    def video_channel_set(self, int value):
        emotion_object_video_channel_set(self.obj, value)

    property spu_mute:
        def __get__(self):
            return self.spu_mute_get()

        def __set__(self, int value):
            self.spu_mute_set(value)

    def spu_mute_get(self):
        return emotion_object_spu_mute_get(self.obj)

    def spu_mute_set(self, int value):
        emotion_object_spu_mute_set(self.obj, value)

    def spu_channel_count(self):
        return emotion_object_spu_channel_count(self.obj)

    def spu_channel_name_get(self, int channel):
        return _ctouni(emotion_object_spu_channel_name_get(self.obj, channel))

    property spu_channel:
        def __get__(self):
            return self.spu_channel_get()

        def __set__(self, int value):
            self.spu_channel_set(value)

    def spu_channel_get(self):
        return emotion_object_spu_channel_get(self.obj)

    def spu_channel_set(self, int value):
        emotion_object_spu_channel_set(self.obj, value)

    property spu_button_count:
        def __get__(self):
            return self.spu_button_count_get()

    def spu_button_count_get(self):
        return emotion_object_spu_button_count_get(self.obj)

    property spu_button:
        def __get__(self):
            return self.spu_button_get()

    def spu_button_get(self):
        return emotion_object_spu_button_get(self.obj)

    def chapter_count(self):
        return emotion_object_chapter_count(self.obj)

    def chapter_name_get(self, int channel):
        return _ctouni(emotion_object_chapter_name_get(self.obj, channel))

    property chapter:
        def __get__(self):
            return self.chapter_get()

        def __set__(self, int value):
            self.chapter_set(value)

    def chapter_get(self):
        return emotion_object_chapter_get(self.obj)

    def chapter_set(self, int value):
        emotion_object_chapter_set(self.obj, value)

    def eject(self):
        emotion_object_eject(self.obj)

    property title:
        def __get__(self):
            return self.title_get()

    def title_get(self):
        return _ctouni(emotion_object_title_get(self.obj))

    property ref_file:
        def __get__(self):
            return self.ref_file_get()

    def ref_file_get(self):
        return _ctouni(emotion_object_ref_file_get(self.obj))

    property ref_num:
        def __get__(self):
            return self.ref_num_get()

    def ref_num_get(self):
        return emotion_object_ref_num_get(self.obj)

    def meta_info_get(self, int meta_id):
        return _ctouni(emotion_object_meta_info_get(self.obj, <Emotion_Meta_Info>meta_id))

    property meta_info_dict:
        def __get__(self):
            return self.meta_info_dict_get()

    def meta_info_dict_get(self):
        cdef const_char_ptr info
        ret = dict()
        lst = (("title", EMOTION_META_INFO_TRACK_TITLE),
               ("artist", EMOTION_META_INFO_TRACK_ARTIST),
               ("album", EMOTION_META_INFO_TRACK_ALBUM),
               ("year", EMOTION_META_INFO_TRACK_YEAR),
               ("genre", EMOTION_META_INFO_TRACK_GENRE),
               ("comment", EMOTION_META_INFO_TRACK_COMMENT),
               ("disc_id", EMOTION_META_INFO_TRACK_DISC_ID),
               ("track_count", EMOTION_META_INFO_TRACK_COUNT))
        for n, i in lst:
            info = emotion_object_meta_info_get(self.obj, i)
            if info != NULL:
                ret[n] = info
                ret[i] = info
        return ret

    property vis:
        def __set__(self, int visualization):
            emotion_object_vis_set(self.obj, <Emotion_Vis>visualization)

        def __get__(self):
            return int(emotion_object_vis_get(self.obj))

    def vis_supported_get(self, int visualization):
        return bool(emotion_object_vis_supported(self.obj, <Emotion_Vis>visualization))

    property priority:
        def __set__(self, int priority):
            emotion_object_priority_set(self.obj, priority)

        def __get__(self):
            return bool(emotion_object_priority_get(self.obj))

    property suspend:
        def __set__(self, int state):
            emotion_object_suspend_set(self.obj, <Emotion_Suspend>state)

        def __get__(self):
            return int(motion_object_suspend_get(self.obj))

    def last_position_load(self):
        emotion_object_last_position_load(self.obj)

    def last_position_save(self):
        emotion_object_last_position_save(self.obj)

    def may_play_fast_get(self, filename):
        return bool(emotion_object_extension_may_play_fast_get(_cfruni(filename)))

    def may_play_get(self, filename):
        return bool(emotion_object_extension_may_play_get(_cfruni(filename)))

    property image:
        def __get__(self):
            return Object_from_instance(emotion_object_image_get(self.obj))


    def callback_add(self, char *event, func, *args, **kargs):
        """Add callback to given emotion event.

        Signature::

            function(object, *args, **kargs)

        :param event: event to listen, like "frame_decode".
        :param func: callable to use.

        """
        e = intern(event)
        lst = self._emotion_callbacks.setdefault(e, [])
        if not lst:
            evas_object_smart_callback_add(self.obj, event,
                                                       _emotion_callback,
                                                       <void *>e)
        lst.append((func, args, kargs))

    def callback_del(self, char *event, func):
        """Remove previously connected callback.

        :param event: event to listen, like "frame_decode".
        :param func: callable to use.

        """
        try:
            lst = self._emotion_callbacks[event]
        except KeyError, e:
            raise ValueError("function %s not associated with event %r" %
                             (func, event))

        i = -1
        for i, (f, a, k) in enumerate(lst):
            if func == f:
                break
        else:
            raise ValueError("function %s not associated with event %r" %
                             (func, event))
        lst.pop(i)
        if lst:
            return
        self._emotion_callbacks.pop(event)
        evas_object_smart_callback_del(self.obj, event,
                                                   _emotion_callback)

    def on_frame_decode_add(self, func, *args, **kargs):
        self.callback_add("frame_decode", func, *args, **kargs)

    def on_frame_decode_del(self, func):
        self.callback_del("frame_decode", func)

    def on_frame_resize_add(self, func, *args, **kargs):
        self.callback_add("frame_resize", func, *args, **kargs)

    def on_frame_resize_del(self, func):
        self.callback_del("frame_resize", func)

    def on_length_change_add(self, func, *args, **kargs):
        self.callback_add("length_change", func, *args, **kargs)

    def on_length_change_del(self, func):
        self.callback_del("length_change", func)

    def on_decode_stop_add(self, func, *args, **kargs):
        self.callback_add("decode_stop", func, *args, **kargs)

    def on_decode_stop_del(self, func):
        self.callback_del("decode_stop", func)

    def on_channels_change_add(self, func, *args, **kargs):
        self.callback_add("channels_change", func, *args, **kargs)

    def on_channels_change_del(self, func):
        self.callback_del("channels_change", func)

    def on_title_change_add(self, func, *args, **kargs):
        self.callback_add("title_change", func, *args, **kargs)

    def on_title_change_del(self, func):
        self.callback_del("title_change", func)

    def on_progress_change_add(self, func, *args, **kargs):
        self.callback_add("progress_change", func, *args, **kargs)

    def on_progress_change_del(self, func):
        self.callback_del("progress_change", func)

    def on_ref_change_add(self, func, *args, **kargs):
        self.callback_add("ref_change", func, *args, **kargs)

    def on_ref_change_del(self, func):
        self.callback_del("ref_change", func)

    def on_button_num_change_add(self, func, *args, **kargs):
        self.callback_add("button_num_change", func, *args, **kargs)

    def on_button_num_change_del(self, func):
        self.callback_del("button_num_change", func)

    def on_button_change_add(self, func, *args, **kargs):
        self.callback_add("button_change", func, *args, **kargs)

    def on_button_change_del(self, func):
        self.callback_del("button_change", func)

    def on_playback_finished_add(self, func, *args, **kargs):
        self.callback_add("playback_finished", func, *args, **kargs)

    def on_playback_finished_del(self, func):
        self.callback_del("playback_finished", func)

    def on_audio_level_change_add(self, func, *args, **kargs):
        self.callback_add("audio_level_change", func, *args, **kargs)

    def on_audio_level_change_del(self, func):
        self.callback_del("audio_level_change", func)


_object_mapping_register("emotion_object", Emotion)
