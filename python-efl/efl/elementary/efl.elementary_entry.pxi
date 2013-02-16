# Copyright (C) 2007-2013 various contributors (see AUTHORS)
#
# This file is part of Python-EFL.
#
# Python-EFL is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# Python-EFL is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this Python-EFL.  If not, see <http://www.gnu.org/licenses/>.


def Entry_markup_to_utf8(str):
    cdef const_char_ptr string
    string = elm_entry_markup_to_utf8(str)
    if string == NULL:
        return None
    return string

def Entry_utf8_to_markup(str):
    cdef const_char_ptr string
    string = elm_entry_utf8_to_markup(str)
    if string == NULL:
        return None
    return string

class EntryAnchorInfo:
    def __init__(self):
        self.name = None
        self.button = 0
        self.x = 0
        self.y = 0
        self.w = 0
        self.h = 0

class EntryAnchorHoverInfo:
    def __init__(self):
        self.anchor_info = None
        self.hover = None
        self.hover_parent = (0, 0, 0, 0)
        self.hover_left = False
        self.hover_right = False
        self.hover_top = False
        self.hover_bottom = False

def _entryanchor_conv(long addr):
    cdef Elm_Entry_Anchor_Info *ei = <Elm_Entry_Anchor_Info *>addr
    eai = EntryAnchorInfo()
    eai.name = ei.name
    eai.button = ei.button
    eai.x = ei.x
    eai.y = ei.y
    eai.w = ei.w
    eai.h = ei.h
    return eai

def _entryanchorhover_conv(long addr):
    cdef Elm_Entry_Anchor_Hover_Info *ehi = <Elm_Entry_Anchor_Hover_Info *>addr
    eahi = EntryAnchorHoverInfo()
    eahi.anchor_info = <object>ehi.anchor_info
    eahi.hover = Hover(None, <object>ehi.hover)
    eahi.hover_parent = (ehi.hover_parent.x, ehi.hover_parent.y,
                       ehi.hover_parent.w, ehi.hover_parent.h)
    eahi.hover_left = ehi.hover_left
    eahi.hover_right = ehi.hover_right
    eahi.hover_top = ehi.hover_top
    eahi.hover_bottom = ehi.hover_bottom
    return eahi

cdef class Entry(Object):

    def __init__(self, evasObject parent):
        self._set_obj(elm_entry_add(parent.obj))

    def single_line_set(self, single_line):
        elm_entry_single_line_set(self.obj, single_line)

    def single_line_get(self):
        return bool(elm_entry_single_line_get(self.obj))

    property single_line:
        def __get__(self):
            return bool(elm_entry_single_line_get(self.obj))

        def __set__(self, single_line):
            elm_entry_single_line_set(self.obj, single_line)

    def password_set(self, password):
        elm_entry_password_set(self.obj, password)

    def password_get(self):
        return bool(elm_entry_password_get(self.obj))

    property password:
        def __get__(self):
            return bool(elm_entry_password_get(self.obj))

        def __set__(self, password):
            elm_entry_password_set(self.obj, password)

    def entry_set(self, entry):
        elm_entry_entry_set(self.obj, _cfruni(entry))

    def entry_get(self):
        return _ctouni(elm_entry_entry_get(self.obj))

    property entry:
        def __get__(self):
            return _ctouni(elm_entry_entry_get(self.obj))

        def __set__(self, entry):
            elm_entry_entry_set(self.obj, _cfruni(entry))

    def entry_append(self, text):
        elm_entry_entry_append(self.obj, _cfruni(text))

    def is_empty(self):
        return elm_entry_is_empty(self.obj)

    def selection_get(self):
        return _ctouni(elm_entry_selection_get(self.obj))

    property selection:
        def __get__(self):
            return _ctouni(elm_entry_selection_get(self.obj))

    def textblock_get(self):
        cdef Evas_Object *o
        o = elm_entry_textblock_get(self.obj)
        return object_from_instance(o)

    property textblock:
        def __get__(self):
            cdef Evas_Object *o
            o = elm_entry_textblock_get(self.obj)
            return object_from_instance(o)

    def calc_force(self):
        elm_entry_calc_force(self.obj)

    def entry_insert(self, entry):
        elm_entry_entry_insert(self.obj, _cfruni(entry))

    def line_wrap_set(self, wrap):
        elm_entry_line_wrap_set(self.obj, wrap)

    def line_wrap_get(self):
        return elm_entry_line_wrap_get(self.obj)

    property line_wrap:
        def __get__(self):
            return elm_entry_line_wrap_get(self.obj)

        def __set__(self, wrap):
            elm_entry_line_wrap_set(self.obj, wrap)

    def editable_set(self, editable):
        elm_entry_editable_set(self.obj, editable)

    def editable_get(self):
        return bool(elm_entry_editable_get(self.obj))

    property editable:
        def __get__(self):
            return bool(elm_entry_editable_get(self.obj))

        def __set__(self, editable):
            elm_entry_editable_set(self.obj, editable)

    def select_none(self):
        elm_entry_select_none(self.obj)

    def select_all(self):
        elm_entry_select_all(self.obj)

    def cursor_next(self):

        return bool(elm_entry_cursor_next(self.obj))

    def cursor_prev(self):
        return bool(elm_entry_cursor_prev(self.obj))

    def cursor_up(self):
        return bool(elm_entry_cursor_up(self.obj))

    def cursor_down(self):
        return bool(elm_entry_cursor_down(self.obj))

    def cursor_begin_set(self):
        elm_entry_cursor_begin_set(self.obj)

    def cursor_end_set(self):
        elm_entry_cursor_end_set(self.obj)

    def cursor_line_begin_set(self):
        elm_entry_cursor_line_begin_set(self.obj)

    def cursor_line_end_set(self):
        elm_entry_cursor_line_end_set(self.obj)

    def cursor_selection_begin(self):
        elm_entry_cursor_selection_begin(self.obj)

    def cursor_selection_end(self):
        elm_entry_cursor_selection_end(self.obj)

    def cursor_is_format_get(self):
        return bool(elm_entry_cursor_is_format_get(self.obj))

    def cursor_is_visible_format_get(self):
        return bool(elm_entry_cursor_is_visible_format_get(self.obj))

    def cursor_content_get(self):
        return elm_entry_cursor_content_get(self.obj)

    def cursor_geometry_get(self):
        cdef Evas_Coord x, y, w, h
        #TODO: Check return status for success
        elm_entry_cursor_geometry_get(self.obj, &x, &y, &w, &h)
        return (x, y, w, h)

    def cursor_pos_set(self, pos):
        elm_entry_cursor_pos_set(self.obj, pos)

    def cursor_pos_get(self):
        return elm_entry_cursor_pos_get(self.obj)

    property cursor_pos:
        def __get__(self):
            return elm_entry_cursor_pos_get(self.obj)

        def __set__(self, pos):
            elm_entry_cursor_pos_set(self.obj, pos)

    def selection_cut(self):
        elm_entry_selection_cut(self.obj)

    def selection_copy(self):
        elm_entry_selection_copy(self.obj)

    def selection_paste(self):
        elm_entry_selection_paste(self.obj)

    def context_menu_clear(self):
        elm_entry_context_menu_clear(self.obj)

    # TODO XXX
    # def context_menu_item_add(self, label, icon_file, icon_type, cb, data):
        #elm_entry_context_menu_item_add(self.obj, label, icon_file, icon_type, func, data);

    def context_menu_disabled_set(self, disabled):
        elm_entry_context_menu_disabled_set(self.obj, disabled)

    def context_menu_disabled_get(self):
        return elm_entry_context_menu_disabled_get(self.obj)

    property context_menu_disabled:
        def __get__(self):
            return elm_entry_context_menu_disabled_get(self.obj)

        def __set__(self, disabled):
            elm_entry_context_menu_disabled_set(self.obj, disabled)


    # elm_entry_item_provider_append() # TODO XXX

    # elm_entry_item_provider_prepend() # TODO XXX

    # elm_entry_item_provider_remove() # TODO XXX

    # elm_entry_markup_filter_append() # TODO XXX

    # elm_entry_markup_filter_prepend() # TODO XXX

    # elm_entry_markup_filter_remove() # TODO XXX

    markup_to_utf8 = staticmethod(Entry_markup_to_utf8)

    utf8_to_markup = staticmethod(Entry_utf8_to_markup)

    def file_set(self, file, format):
        return bool(elm_entry_file_set(self.obj, _cfruni(file), format))

    def file_get(self):
        cdef const_char_ptr file
        cdef Elm_Text_Format format

        elm_entry_file_get(self.obj, &file, &format)
        return (_ctouni(file), format)

    property file:
        def __get__(self):
            cdef const_char_ptr file
            cdef Elm_Text_Format format
            elm_entry_file_get(self.obj, &file, &format)
            return (_ctouni(file), format)

        def __set__(self, value):
            file, format = value
            elm_entry_file_set(self.obj, _cfruni(file), format)

    def file_save(self):
        elm_entry_file_save(self.obj)

    def autosave_set(self, autosave):
        elm_entry_autosave_set(self.obj, autosave)

    def autosave_get(self):
        return elm_entry_autosave_get(self.obj)

    property autosave:
        def __get__(self):
            return elm_entry_autosave_get(self.obj)

        def __set__(self, autosave):
            elm_entry_autosave_set(self.obj, autosave)

    def scrollable_set(self, scrollable):
        elm_entry_scrollable_set(self.obj, scrollable)

    def scrollable_get(self):
        return bool(elm_entry_scrollable_get(self.obj))

    property scrollable:
        def __get__(self):
            return bool(elm_entry_scrollable_get(self.obj))

        def __set__(self, scrollable):
            elm_entry_scrollable_set(self.obj, scrollable)

    def icon_visible_set(self, visible):
        elm_entry_icon_visible_set(self.obj, visible)

    property icon_visible:
        def __set__(self, visible):
            elm_entry_icon_visible_set(self.obj, visible)

    def scrollbar_policy_set(self, Elm_Scroller_Policy h, Elm_Scroller_Policy v):
        elm_scroller_policy_set(self.obj, h, v)

    property scrollbar_policy:
        def __set__(self, value):
            cdef Elm_Scroller_Policy h, v
            h, v = value
            elm_scroller_policy_set(self.obj, h, v)

    def bounce_set(self, h_bounce, v_bounce):
        elm_scroller_bounce_set(self.obj, h_bounce, v_bounce)

    def bounce_get(self):
        cdef Eina_Bool h_bounce, v_bounce

        elm_scroller_bounce_get(self.obj, &h_bounce, &v_bounce)
        return (h_bounce, v_bounce)

    property bounce:
        def __get__(self):
            cdef Eina_Bool h_bounce, v_bounce
            elm_scroller_bounce_get(self.obj, &h_bounce, &v_bounce)
            return (h_bounce, v_bounce)

        def __set__(self, value):
            cdef Eina_Bool h_bounce, v_bounce
            h_bounce, v_bounce = value
            elm_scroller_bounce_set(self.obj, h_bounce, v_bounce)

    def input_panel_layout_set(self, layout):
        elm_entry_input_panel_layout_set(self.obj, layout)

    def input_panel_layout_get(self):
        return elm_entry_input_panel_layout_get(self.obj)

    property input_panel_layout:
        def __get__(self):
            return elm_entry_input_panel_layout_get(self.obj)

        def __set__(self, layout):
            elm_entry_input_panel_layout_set(self.obj, layout)

    def input_panel_enabled_set(self, enabled):
        elm_entry_input_panel_enabled_set(self.obj, enabled)

    def input_panel_enabled_get(self):
        return bool(elm_entry_input_panel_enabled_get(self.obj))

    property input_panel_enabled:
        def __get__(self):
            return bool(elm_entry_input_panel_enabled_get(self.obj))

        def __set__(self, enabled):
            elm_entry_input_panel_enabled_set(self.obj, enabled)

    def input_panel_show(self):
        elm_entry_input_panel_show(self.obj)

    def input_panel_hide(self):
        elm_entry_input_panel_hide(self.obj)

    def input_panel_language_set(self, lang):
        elm_entry_input_panel_language_set(self.obj, lang)

    def input_panel_language_get(self):
        return elm_entry_input_panel_language_get(self.obj)

    property input_panel_language:
        def __get__(self):
            return elm_entry_input_panel_language_get(self.obj)

        def __set__(self, lang):
            elm_entry_input_panel_language_set(self.obj, lang)

    # TODO XXX elm_entry_input_panel_imdata_set() ??

    # TODO XXX elm_entry_input_panel_imdata_get() ??

    def input_panel_return_key_type_set(self, return_key_type):
        elm_entry_input_panel_return_key_type_set(self.obj, return_key_type)

    def input_panel_return_key_type_get(self):
        return elm_entry_input_panel_return_key_type_get(self.obj)

    property input_panel_return_key_type:
        def __get__(self):
            return elm_entry_input_panel_return_key_type_get(self.obj)

        def __set__(self, return_key_type):
            elm_entry_input_panel_return_key_type_set(self.obj, return_key_type)

    def input_panel_return_key_disabled_set(self, disabled):
        elm_entry_input_panel_return_key_disabled_set(self.obj, disabled)

    def input_panel_return_key_disabled_get(self):
        return elm_entry_input_panel_return_key_disabled_get(self.obj)

    property input_panel_return_key_disabled:
        def __get__(self):
            return elm_entry_input_panel_return_key_disabled_get(self.obj)

        def __set__(self, disabled):
            elm_entry_input_panel_return_key_disabled_set(self.obj, disabled)

    def input_panel_return_key_autoenabled_set(self, enabled):
        elm_entry_input_panel_return_key_autoenabled_set(self.obj, enabled)

    property input_panel_return_key_autoenabled:
        def __set__(self, enabled):
            elm_entry_input_panel_return_key_autoenabled_set(self.obj, enabled)

    def imf_context_reset(self):
        elm_entry_imf_context_reset(self.obj)

    def prediction_allow_set(self, allow):
        elm_entry_prediction_allow_set(self.obj, allow)

    def prediction_allow_get(self):
        return elm_entry_prediction_allow_get(self.obj)

    property prediction_allow:
        def __get__(self):
            return elm_entry_prediction_allow_get(self.obj)

        def __set__(self, allow):
            elm_entry_prediction_allow_set(self.obj, allow)

    # TODO XXX elm_entry_filter_accept_set()
    # TODO XXX elm_entry_imf_context_get() ??

    def cnp_mode_set(self, mode):
        elm_entry_cnp_mode_set(self.obj, mode)

    def cnp_mode_get(self):
        return elm_entry_cnp_mode_get(self.obj)

    property cnp_mode:
        def __get__(self):
            return elm_entry_cnp_mode_get(self.obj)

        def __set__(self, mode):
            elm_entry_cnp_mode_set(self.obj, mode)

    def anchor_hover_parent_set(self, evasObject anchor_hover_parent):
        elm_entry_anchor_hover_parent_set(self.obj, anchor_hover_parent.obj)

    def anchor_hover_parent_get(self):
        cdef Evas_Object *anchor_hover_parent
        anchor_hover_parent = elm_entry_anchor_hover_parent_get(self.obj)
        return object_from_instance(anchor_hover_parent)

    property anchor_hover_parent:
        def __get__(self):
            cdef Evas_Object *anchor_hover_parent
            anchor_hover_parent = elm_entry_anchor_hover_parent_get(self.obj)
            return object_from_instance(anchor_hover_parent)

        def __set__(self, evasObject anchor_hover_parent):
            elm_entry_anchor_hover_parent_set(self.obj, anchor_hover_parent.obj)

    def anchor_hover_style_set(self, style):
        elm_entry_anchor_hover_style_set(self.obj, _cfruni(style))

    def anchor_hover_style_get(self):
        return _ctouni(elm_entry_anchor_hover_style_get(self.obj))

    property anchor_hover_style:
        def __get__(self):
            return _ctouni(elm_entry_anchor_hover_style_get(self.obj))

        def __set__(self, style):
            elm_entry_anchor_hover_style_set(self.obj, _cfruni(style))

    def anchor_hover_end(self):
        elm_entry_anchor_hover_end(self.obj)

    def callback_changed_add(self, func, *args, **kwargs):
        self._callback_add("changed", func, *args, **kwargs)

    def callback_changed_del(self, func):
        self._callback_del("changed", func)

    def callback_changed_user_add(self, func, *args, **kwargs):
        self._callback_add("changed,user", func, *args, **kwargs)

    def callback_changed_user_del(self, func):
        self._callback_del("changed,user", func)

    def callback_activated_add(self, func, *args, **kwargs):
        self._callback_add("activated", func, *args, **kwargs)

    def callback_activated_del(self, func):
        self._callback_del("activated", func)

    def callback_press_add(self, func, *args, **kwargs):
        self._callback_add("press", func, *args, **kwargs)

    def callback_press_del(self, func):
        self._callback_del("press", func)

    def callback_longpressed_add(self, func, *args, **kwargs):
        self._callback_add("longpressed", func, *args, **kwargs)

    def callback_longpressed_del(self, func):
        self._callback_del("longpressed", func)

    def callback_clicked_add(self, func, *args, **kwargs):
        self._callback_add("clicked", func, *args, **kwargs)

    def callback_clicked_del(self, func):
        self._callback_del("clicked", func)

    def callback_double_clicked_add(self, func, *args, **kwargs):
        self._callback_add("clicked,double", func, *args, **kwargs)

    def callback_double_clicked_del(self, func):
        self._callback_del("clicked,double", func)

    def callback_triple_clicked_add(self, func, *args, **kwargs):
        self._callback_add("clicked,triple", func, *args, **kwargs)

    def callback_triple_clicked_del(self, func):
        self._callback_del("clicked,triple", func)

    def callback_focused_add(self, func, *args, **kwargs):
        self._callback_add("focused", func, *args, **kwargs)

    def callback_focused_del(self, func):
        self._callback_del("focused", func)

    def callback_unfocused_add(self, func, *args, **kwargs):
        self._callback_add("unfocused", func, *args, **kwargs)

    def callback_unfocused_del(self, func):
        self._callback_del("unfocused", func)

    def callback_selection_paste_add(self, func, *args, **kwargs):
        self._callback_add("selection,paste", func, *args, **kwargs)

    def callback_selection_paste_del(self, func):
        self._callback_del("selection,paste", func)

    def callback_selection_copy_add(self, func, *args, **kwargs):
        self._callback_add("selection,copy", func, *args, **kwargs)

    def callback_selection_copy_del(self, func):
        self._callback_del("selection,copy", func)

    def callback_selection_cut_add(self, func, *args, **kwargs):
        self._callback_add("selection,cut", func, *args, **kwargs)

    def callback_selection_cut_del(self, func):
        self._callback_del("selection,cut", func)

    def callback_selection_start_add(self, func, *args, **kwargs):
        self._callback_add("selection,start", func, *args, **kwargs)

    def callback_selection_start_del(self, func):
        self._callback_del("selection,start", func)

    def callback_selection_changed_add(self, func, *args, **kwargs):
        self._callback_add("selection,changed", func, *args, **kwargs)

    def callback_selection_changed_del(self, func):
        self._callback_del("selection,changed", func)

    def callback_selection_cleared_add(self, func, *args, **kwargs):
        self._callback_add("selection,cleared", func, *args, **kwargs)

    def callback_selection_cleared_del(self, func):
        self._callback_del("selection,cleared", func)

    def callback_cursor_changed_add(self, func, *args, **kwargs):
        self._callback_add("cursor,changed", func, *args, **kwargs)

    def callback_cursor_changed_del(self, func):
        self._callback_del("cursor,changed", func)

    def callback_anchor_clicked_add(self, func, *args, **kwargs):
        self._callback_add_full("anchor,clicked", _entryanchor_conv,
                                func, *args, **kwargs)

    def callback_anchor_clicked_del(self, func):
        self._callback_del_full("anchor,clicked", _entryanchor_conv,
                                func)

    def callback_anchor_in_add(self, func, *args, **kwargs):
        self._callback_add_full("anchor,in", _entryanchor_conv,
                                func, *args, **kwargs)

    def callback_anchor_in_del(self, func):
        self._callback_del_full("anchor,in", _entryanchor_conv,
                                func)

    def callback_anchor_out_add(self, func, *args, **kwargs):
        self._callback_add_full("anchor,out", _entryanchor_conv,
                                func, *args, **kwargs)

    def callback_anchor_out_del(self, func):
        self._callback_del_full("anchor,out", _entryanchor_conv,
                                func)

    def callback_anchor_up_add(self, func, *args, **kwargs):
        self._callback_add_full("anchor,up", _entryanchor_conv,
                                func, *args, **kwargs)

    def callback_anchor_up_del(self, func):
        self._callback_del_full("anchor,up", _entryanchor_conv,
                                func)

    def callback_anchor_down_add(self, func, *args, **kwargs):
        self._callback_add_full("anchor,down", _entryanchor_conv,
                                func, *args, **kwargs)

    def callback_anchor_down_del(self, func):
        self._callback_del_full("anchor,down", _entryanchor_conv,
                                func)

    def callback_anchor_hover_opened_add(self, func, *args, **kwargs):
        self._callback_add_full("anchor,hover,opened", _entryanchorhover_conv,
                                func, *args, **kwargs)

    def callback_anchor_hover_opened_del(self, func):
        self._callback_del_full("anchor,hover,opened", _entryanchorhover_conv,
                                func)

    def callback_preedit_changed_add(self, func, *args, **kwargs):
        self._callback_add("preedit,changed", func, *args, **kwargs)

    def callback_preedit_changed_del(self, func):
        self._callback_del("preedit,changed", func)

    def callback_language_changed_add(self, func, *args, **kwargs):
        self._callback_add("language,changed", func, *args, **kwargs)

    def callback_language_changed_del(self, func):
        self._callback_del("language,changed", func)


_object_mapping_register("elm_entry", Entry)
