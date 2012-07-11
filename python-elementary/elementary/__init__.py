# Copyright (c) 2008 Simon Busch
# Copyright 2012 Kai Huuhko <kai.huuhko@gmail.com>
#
# This file is part of python-elementary.
#
# python-elementary is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# python-elementary is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with python-elementary.  If not, see <http://www.gnu.org/licenses/>.
#

from actionslider import Actionslider
from background import Background
from box import Box
from bubble import Bubble
from button import Button
from calendar import Calendar, CalendarMark
from check import Check
from clock import Clock
from colorselector import Colorselector, ColorselectorPaletteItem
from configuration import Configuration, \
    config_finger_size_get, config_finger_size_set, \
    config_tooltip_delay_get, config_tooltip_delay_set, \
    focus_highlight_animate_get, focus_highlight_animate_set, \
    focus_highlight_enabled_get, focus_highlight_enabled_set, \
    preferred_engine_get, preferred_engine_set, \
    engine_get, engine_set, scale_get, scale_set, \
    cursor_engine_only_get, cursor_engine_only_set
from conformant import Conformant
from ctxpopup import Ctxpopup, CtxpopupItem
from datetime_elm import Datetime
from dayselector import Dayselector
from diskselector import Diskselector, DiskselectorItem
from entry import Entry
from fileselector import Fileselector
from fileselector_button import FileselectorButton
from fileselector_entry import FileselectorEntry
from flip import Flip
from frame import Frame
from general import init, shutdown, run, exit, coords_finger_size_adjust, policy_set, policy_get
from gengrid import Gengrid, GengridItem, GengridItemClass
from genlist import Genlist, GenlistItem, GenlistItemClass
from gesture_layer import GestureLayer
from grid import Grid
from hover import Hover
from hoversel import Hoversel, HoverselItem
from icon import Icon
from image import Image
from index import Index, IndexItem
from innerwindow import InnerWindow
from label import Label
from layout import Layout
from layout_class import LayoutClass
from list import List, ListItem
from map import Map, MapName, MapOverlay, MapOverlayBubble, MapOverlayCircle, MapOverlayClass, MapOverlayLine, MapOverlayPolygon, MapOverlayRoute, MapOverlayScale
from mapbuf import Mapbuf
from menu import Menu, MenuItem, MenuSeparatorItem
from multibuttonentry import MultiButtonEntry, MultiButtonEntryItem
from naviframe import Naviframe, NaviframeItem
from need import *
from notify import Notify
from object import Object
from object_item import ObjectItem
from panel import Panel
from panes import Panes
from photo import Photo
from photocam import Photocam
from plug import Plug
from popup import Popup, PopupItem
from progressbar import Progressbar
from radio import Radio
from scroller import Scroller
from segment_control import SegmentControl, SegmentControlItem
from separator import Separator
from slider import Slider
from slideshow import Slideshow, SlideshowItem, SlideshowItemClass
from spinner import Spinner
from table import Table
from theme import Theme, theme_overlay_add, theme_extension_add
from thumb import Thumb
from toolbar import Toolbar, ToolbarItem
from transit import Transit
from video import Video, Player
from web import Web
from window import Window, StandardWindow

ELM_ACTIONSLIDER_NONE = 0
ELM_ACTIONSLIDER_LEFT = 1 << 0
ELM_ACTIONSLIDER_CENTER = 1 << 1
ELM_ACTIONSLIDER_RIGHT = 1 << 2
ELM_ACTIONSLIDER_ALL = (1 << 3) - 1

ELM_BG_OPTION_CENTER = 0
ELM_BG_OPTION_SCALE = 1
ELM_BG_OPTION_STRETCH = 2
ELM_BG_OPTION_TILE = 3
ELM_BG_OPTION_LAST = 4

ELM_BOX_LAYOUT_HORIZONTAL = 0
ELM_BOX_LAYOUT_VERTICAL = 1
ELM_BOX_LAYOUT_HOMOGENEOUS_VERTICAL = 2
ELM_BOX_LAYOUT_HOMOGENEOUS_HORIZONTAL = 3
ELM_BOX_LAYOUT_HOMOGENEOUS_MAX_SIZE_HORIZONTAL = 4
ELM_BOX_LAYOUT_HOMOGENEOUS_MAX_SIZE_VERTICAL = 5
ELM_BOX_LAYOUT_FLOW_HORIZONTAL = 6
ELM_BOX_LAYOUT_FLOW_VERTICAL = 7
ELM_BOX_LAYOUT_STACK = 8

ELM_BUBBLE_POS_TOP_LEFT = 0
ELM_BUBBLE_POS_TOP_RIGHT = 1
ELM_BUBBLE_POS_BOTTOM_LEFT = 2
ELM_BUBBLE_POS_BOTTOM_RIGHT = 3

ELM_CALENDAR_UNIQUE = 0
ELM_CALENDAR_DAILY = 1
ELM_CALENDAR_WEEKLY = 2
ELM_CALENDAR_MONTHLY = 3
ELM_CALENDAR_ANNUALLY = 4
ELM_CALENDAR_LAST_DAY_OF_MONTH = 5

ELM_CALENDAR_SELECT_MODE_DEFAULT = 0
ELM_CALENDAR_SELECT_MODE_ALWAYS = 1
ELM_CALENDAR_SELECT_MODE_NONE = 2
ELM_CALENDAR_SELECT_MODE_ONDEMAND = 3

ELM_CLOCK_EDIT_DEFAULT = 0
ELM_CLOCK_EDIT_HOUR_DECIMAL = 1 << 0
ELM_CLOCK_EDIT_HOUR_UNIT = 1 << 1
ELM_CLOCK_EDIT_MIN_DECIMAL = 1 << 2
ELM_CLOCK_EDIT_MIN_UNIT = 1 << 3
ELM_CLOCK_EDIT_SEC_DECIMAL = 1 << 4
ELM_CLOCK_EDIT_SEC_UNIT = 1 << 5
ELM_CLOCK_EDIT_ALL = (1 << 6) - 1

ELM_CNP_MODE_MARKUP = 0
ELM_CNP_MODE_NO_IMAGE = 1
ELM_CNP_MODE_PLAINTEXT = 2

ELM_COLORSELECTOR_PALETTE = 0
ELM_COLORSELECTOR_COMPONENTS = 1
ELM_COLORSELECTOR_BOTH = 2

ELM_CTXPOPUP_DIRECTION_DOWN = 0
ELM_CTXPOPUP_DIRECTION_RIGHT = 1
ELM_CTXPOPUP_DIRECTION_LEFT = 2
ELM_CTXPOPUP_DIRECTION_UP = 3
ELM_CTXPOPUP_DIRECTION_UNKNOWN = 4

ELM_DATETIME_YEAR    = 0
ELM_DATETIME_MONTH   = 1
ELM_DATETIME_DATE    = 2
ELM_DATETIME_HOUR    = 3
ELM_DATETIME_MINUTE  = 4
ELM_DATETIME_AMPM    = 5

ELM_DAY_SUNDAY = 0
ELM_DAY_MONDAY = 1
ELM_DAY_TUESDAY = 2
ELM_DAY_WEDNESDAY = 3
ELM_DAY_THURSDAY = 4
ELM_DAY_FRIDAY = 5
ELM_DAY_SATURDAY = 6
ELM_DAY_LAST = 7

ELM_DAYSELECTOR_SUN = 0
ELM_DAYSELECTOR_MON = 1
ELM_DAYSELECTOR_TUE = 2
ELM_DAYSELECTOR_WED = 3
ELM_DAYSELECTOR_THU = 4
ELM_DAYSELECTOR_FRI = 5
ELM_DAYSELECTOR_SAT = 6

ELM_FILESELECTOR_LIST = 0
ELM_FILESELECTOR_GRID = 1

ELM_FLIP_DIRECTION_UP = 0
ELM_FLIP_DIRECTION_DOWN = 1
ELM_FLIP_DIRECTION_LEFT = 2
ELM_FLIP_DIRECTION_RIGHT = 3

ELM_FLIP_INTERACTION_NONE = 0
ELM_FLIP_INTERACTION_ROTATE = 1
ELM_FLIP_INTERACTION_CUBE = 2
ELM_FLIP_INTERACTION_PAGE = 3

ELM_FLIP_ROTATE_Y_CENTER_AXIS = 0
ELM_FLIP_ROTATE_X_CENTER_AXIS = 1
ELM_FLIP_ROTATE_XZ_CENTER_AXIS = 2
ELM_FLIP_ROTATE_YZ_CENTER_AXIS = 3
ELM_FLIP_CUBE_LEFT = 4
ELM_FLIP_CUBE_RIGHT = 5
ELM_FLIP_CUBE_UP = 6
ELM_FLIP_CUBE_DOWN = 7
ELM_FLIP_PAGE_LEFT = 8
ELM_FLIP_PAGE_RIGHT = 9
ELM_FLIP_PAGE_UP = 10
ELM_FLIP_PAGE_DOWN = 11

ELM_FOCUS_PREVIOUS = 0
ELM_FOCUS_NEXT = 1

ELM_GENLIST_ITEM_NONE = 0
ELM_GENLIST_ITEM_TREE = 1
ELM_GENLIST_ITEM_GROUP = 2
ELM_GENLIST_ITEM_MAX = 3

ELM_GENLIST_ITEM_FIELD_ALL = 0
ELM_GENLIST_ITEM_FIELD_TEXT = 1
ELM_GENLIST_ITEM_FIELD_CONTENT = 2
ELM_GENLIST_ITEM_FIELD_STATE = 3

ELM_GESTURE_STATE_UNDEFINED = -1
ELM_GESTURE_STATE_START = 0
ELM_GESTURE_STATE_MOVE = 1
ELM_GESTURE_STATE_END = 2
ELM_GESTURE_STATE_ABORT = 3

ELM_GESTURE_FIRST = 0
ELM_GESTURE_N_TAPS = 1
ELM_GESTURE_N_LONG_TAPS = 2
ELM_GESTURE_N_DOUBLE_TAPS = 3
ELM_GESTURE_N_TRIPLE_TAPS = 4
ELM_GESTURE_MOMENTUM = 5
ELM_GESTURE_N_LINES = 6
ELM_GESTURE_N_FLICKS = 7
ELM_GESTURE_ZOOM = 8
ELM_GESTURE_ROTATE = 9

ELM_HOVER_AXIS_NONE = 0
ELM_HOVER_AXIS_HORIZONTAL = 1
ELM_HOVER_AXIS_VERTICAL = 2
ELM_HOVER_AXIS_BOTH = 3

ELM_ICON_NONE = 0
ELM_ICON_FILE = 1
ELM_ICON_STANDARD = 2

ELM_ILLUME_COMMAND_FOCUS_BACK = 0
ELM_ILLUME_COMMAND_FOCUS_FORWARD = 1
ELM_ILLUME_COMMAND_FOCUS_HOME = 2
ELM_ILLUME_COMMAND_CLOSE = 3

ELM_IMAGE_ORIENT_NONE = 0
ELM_IMAGE_ORIENT_0 = 0
ELM_IMAGE_ROTATE_90 = 1
ELM_IMAGE_ROTATE_180 = 2
ELM_IMAGE_ROTATE_270 = 3
ELM_IMAGE_FLIP_HORIZONTAL = 4
ELM_IMAGE_FLIP_VERTICAL = 5
ELM_IMAGE_FLIP_TRANSPOSE = 6
ELM_IMAGE_FLIP_TRANSVERSE = 7

ELM_INPUT_PANEL_LANG_AUTOMATIC = 0
ELM_INPUT_PANEL_LANG_ALPHABET = 1

ELM_INPUT_PANEL_LAYOUT_NORMAL = 0
ELM_INPUT_PANEL_LAYOUT_NUMBER = 1
ELM_INPUT_PANEL_LAYOUT_EMAIL = 2
ELM_INPUT_PANEL_LAYOUT_URL = 3
ELM_INPUT_PANEL_LAYOUT_PHONENUMBER = 4
ELM_INPUT_PANEL_LAYOUT_IP = 5
ELM_INPUT_PANEL_LAYOUT_MONTH = 6
ELM_INPUT_PANEL_LAYOUT_NUMBERONLY = 7
ELM_INPUT_PANEL_LAYOUT_INVALID = 8
ELM_INPUT_PANEL_LAYOUT_HEX = 9
ELM_INPUT_PANEL_LAYOUT_TERMINAL = 10
ELM_INPUT_PANEL_LAYOUT_PASSWORD = 11

ELM_INPUT_PANEL_RETURN_KEY_TYPE_DEFAULT = 0
ELM_INPUT_PANEL_RETURN_KEY_TYPE_DONE = 1
ELM_INPUT_PANEL_RETURN_KEY_TYPE_GO = 2
ELM_INPUT_PANEL_RETURN_KEY_TYPE_JOIN = 3
ELM_INPUT_PANEL_RETURN_KEY_TYPE_LOGIN = 4
ELM_INPUT_PANEL_RETURN_KEY_TYPE_NEXT = 5
ELM_INPUT_PANEL_RETURN_KEY_TYPE_SEARCH = 6
ELM_INPUT_PANEL_RETURN_KEY_TYPE_SEND = 7

ELM_LIST_COMPRESS = 0
ELM_LIST_SCROLL = 1
ELM_LIST_LIMIT = 2

ELM_MAP_OVERLAY_TYPE_NONE = 0
ELM_MAP_OVERLAY_TYPE_DEFAULT = 1
ELM_MAP_OVERLAY_TYPE_CLASS = 2
ELM_MAP_OVERLAY_TYPE_GROUP = 3
ELM_MAP_OVERLAY_TYPE_BUBBLE = 4
ELM_MAP_OVERLAY_TYPE_ROUTE = 5
ELM_MAP_OVERLAY_TYPE_LINE = 6
ELM_MAP_OVERLAY_TYPE_POLYGON = 7
ELM_MAP_OVERLAY_TYPE_CIRCLE = 8
ELM_MAP_OVERLAY_TYPE_SCALE = 9

ELM_MAP_ROUTE_METHOD_FASTEST = 0
ELM_MAP_ROUTE_METHOD_SHORTEST = 1
ELM_MAP_ROUTE_METHOD_LAST = 2

ELM_MAP_ROUTE_TYPE_MOTOCAR = 0
ELM_MAP_ROUTE_TYPE_BICYCLE = 1
ELM_MAP_ROUTE_TYPE_FOOT = 2
ELM_MAP_ROUTE_TYPE_LAST = 3

ELM_MAP_SOURCE_TYPE_TILE = 0
ELM_MAP_SOURCE_TYPE_ROUTE = 1
ELM_MAP_SOURCE_TYPE_NAME = 2
ELM_MAP_SOURCE_TYPE_LAST = 3

ELM_MAP_ZOOM_MODE_MANUAL = 0
ELM_MAP_ZOOM_MODE_AUTO_FIT = 1
ELM_MAP_ZOOM_MODE_AUTO_FILL = 2
ELM_MAP_ZOOM_MODE_LAST = 3

ELM_NOTIFY_ORIENT_TOP = 0
ELM_NOTIFY_ORIENT_CENTER = 1
ELM_NOTIFY_ORIENT_BOTTOM = 2
ELM_NOTIFY_ORIENT_LEFT = 3
ELM_NOTIFY_ORIENT_RIGHT = 4
ELM_NOTIFY_ORIENT_TOP_LEFT = 5
ELM_NOTIFY_ORIENT_TOP_RIGHT = 6
ELM_NOTIFY_ORIENT_BOTTOM_LEFT = 7
ELM_NOTIFY_ORIENT_BOTTOM_RIGHT = 8

ELM_OBJECT_SELECT_MODE_DEFAULT = 0
ELM_OBJECT_SELECT_MODE_ALWAYS = 1
ELM_OBJECT_SELECT_MODE_NONE = 2
ELM_OBJECT_SELECT_MODE_DISPLAY_ONLY = 3
ELM_OBJECT_SELECT_MODE_MAX = 4

ELM_PANEL_ORIENT_TOP = 0
ELM_PANEL_ORIENT_BOTTOM = 1
ELM_PANEL_ORIENT_LEFT = 2
ELM_PANEL_ORIENT_RIGHT = 3

ELM_PHOTOCAM_ZOOM_MODE_MANUAL = 0
ELM_PHOTOCAM_ZOOM_MODE_AUTO_FIT = 1
ELM_PHOTOCAM_ZOOM_MODE_AUTO_FILL = 2
ELM_PHOTOCAM_ZOOM_MODE_AUTO_FIT_IN = 3

ELM_POLICY_QUIT = 0
ELM_POLICY_LAST = 1

ELM_POLICY_QUIT_NONE = 0
ELM_POLICY_QUIT_LAST_WINDOW_CLOSED = 1

ELM_POPUP_ORIENT_TOP = 0
ELM_POPUP_ORIENT_CENTER = 1
ELM_POPUP_ORIENT_BOTTOM = 2
ELM_POPUP_ORIENT_LEFT = 3
ELM_POPUP_ORIENT_RIGHT = 4
ELM_POPUP_ORIENT_TOP_LEFT = 5
ELM_POPUP_ORIENT_TOP_RIGHT = 6
ELM_POPUP_ORIENT_BOTTOM_LEFT = 7
ELM_POPUP_ORIENT_BOTTOM_RIGHT = 8

ELM_SCROLLER_POLICY_AUTO = 0
ELM_SCROLLER_POLICY_ON = 1
ELM_SCROLLER_POLICY_OFF = 2

ELM_TEXT_FORMAT_PLAIN_UTF8 = 0
ELM_TEXT_FORMAT_MARKUP_UTF8 = 1

ELM_TOOLBAR_SHRINK_NONE = 0
ELM_TOOLBAR_SHRINK_HIDE = 1
ELM_TOOLBAR_SHRINK_SCROLL = 2
ELM_TOOLBAR_SHRINK_MENU = 3
ELM_TOOLBAR_SHRINK_EXPAND = 4
ELM_TOOLBAR_SHRINK_LAST = 5

ELM_WEB_WINDOW_FEATURE_TOOLBAR = 0
ELM_WEB_WINDOW_FEATURE_STATUSBAR = 1
ELM_WEB_WINDOW_FEATURE_SCROLLBARS = 2
ELM_WEB_WINDOW_FEATURE_MENUBAR = 3
ELM_WEB_WINDOW_FEATURE_LOCATIONBAR = 4
ELM_WEB_WINDOW_FEATURE_FULLSCREEN = 5

ELM_WEB_ZOOM_MODE_MANUAL = 0
ELM_WEB_ZOOM_MODE_AUTO_FIT = 1
ELM_WEB_ZOOM_MODE_AUTO_FILL = 2

ELM_WIN_BASIC = 0
ELM_WIN_DIALOG_BASIC = 1
ELM_WIN_DESKTOP = 2
ELM_WIN_DOCK = 3
ELM_WIN_TOOLBAR = 4
ELM_WIN_MENU = 5
ELM_WIN_UTILITY = 6
ELM_WIN_SPLASH = 7
ELM_WIN_DROPDOWN_MENU = 8
ELM_WIN_POPUP_MENU = 9
ELM_WIN_TOOLTIP = 10
ELM_WIN_NOTIFICATION = 11
ELM_WIN_COMBO = 12
ELM_WIN_DND = 13
ELM_WIN_INLINED_IMAGE = 14
ELM_WIN_SOCKET_IMAGE = 15

ELM_WIN_INDICATOR_UNKNOWN = 0
ELM_WIN_INDICATOR_HIDE = 1
ELM_WIN_INDICATOR_SHOW = 2

ELM_WIN_INDICATOR_OPACITY_UNKNOWN = 0
ELM_WIN_INDICATOR_OPAQUE = 1
ELM_WIN_INDICATOR_TRANSLUCENT = 2
ELM_WIN_INDICATOR_TRANSPARENT = 3

ELM_WIN_KEYBOARD_UNKNOWN = 0
ELM_WIN_KEYBOARD_OFF = 1
ELM_WIN_KEYBOARD_ON = 2
ELM_WIN_KEYBOARD_ALPHA = 3
ELM_WIN_KEYBOARD_NUMERIC = 4
ELM_WIN_KEYBOARD_PIN = 5
ELM_WIN_KEYBOARD_PHONE_NUMBER = 6
ELM_WIN_KEYBOARD_HEX = 7
ELM_WIN_KEYBOARD_TERMINAL = 8
ELM_WIN_KEYBOARD_PASSWORD = 9
ELM_WIN_KEYBOARD_IP = 10
ELM_WIN_KEYBOARD_HOST = 11
ELM_WIN_KEYBOARD_FILE = 12
ELM_WIN_KEYBOARD_URL = 13
ELM_WIN_KEYBOARD_KEYPAD = 14
ELM_WIN_KEYBOARD_J2ME = 15

ELM_WRAP_NONE = 0
ELM_WRAP_CHAR = 1
ELM_WRAP_WORD = 2
ELM_WRAP_MIXED = 3

init()

"""
__all__ = [
    "actionslider",
    "background",
    "box",
    "bubble",
    "button",
    "calendar",
    "check",
    "clock",
    "colorselector",
    "configuration",
    "conformant",
    "ctxpopup",
    "datetime_elm",
    "dayselector",
    "diskselector",
    "entry",
    "fileselector",
    "fileselector_button",
    "fileselector_entry",
    "flip",
    "frame",
    "general",
    "gengrid",
    "genlist",
    "gesture_layer",
    "grid",
    "hover",
    "hoversel",
    "icon",
    "image",
    "index",
    "innerwindow",
    "label",
    "layout_class",
    "layout",
    "list",
    "map",
    "mapbuf",
    "menu",
    "multibuttonentry",
    "naviframe",
    "need",
    "notify",
    "object",
    "object_item",
    "panel",
    "panes",
    "photo",
    "photocam",
    "plug",
    "popup",
    "progressbar",
    "radio",
    "scroller",
    "segment_control",
    "separator",
    "slider",
    "slideshow",
    "spinner",
    "table",
    "theme",
    "thumb",
    "toolbar",
    "transit",
    "video",
    "web",
    "window",
]
"""
