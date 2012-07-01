#!/usr/bin/python

from setuptools import setup
from setuptools import Extension
from Cython.Distutils import build_ext
from Cython.Build import cythonize

include_dirs = [
    ".",
    "/usr/include/evas-1",
    "/usr/include/python-evas",
    "/usr/include/eina-1",
    "/usr/include/eina-1/eina",
    "/usr/include/ecore-1",
    "/usr/include/edje-1",
    "/usr/include/e_dbus-1",
    "/usr/include/elementary-1",
    "/usr/include/eet-1",
    "/usr/include/dbus-1.0",
    "/usr/lib/dbus-1.0/include",
    "/usr/include/efreet-1",
    "/usr/include/ethumb-1",
]

libraries = [
    "evas",
    "elementary",
    "edje",
    "ecore",
]

ext_modules=[
    Extension("elementary.actionslider", ["elementary/actionslider.pyx"]),
    Extension("elementary.background", ["elementary/background.pyx"]),
    Extension("elementary.box", ["elementary/box.pyx"]),
    Extension("elementary.bubble", ["elementary/bubble.pyx"]),
    Extension("elementary.button", ["elementary/button.pyx"]),
    Extension("elementary.calendar", ["elementary/calendar.pyx"]),
    Extension("elementary.check", ["elementary/check.pyx"]),
    Extension("elementary.clock", ["elementary/clock.pyx"]),
    Extension("elementary.colorselector", ["elementary/colorselector.pyx"]),
    Extension("elementary.configuration", ["elementary/configuration.pyx"]),
    Extension("elementary.conformant", ["elementary/conformant.pyx"]),
    Extension("elementary.ctxpopup", ["elementary/ctxpopup.pyx"]),
    Extension("elementary.dayselector", ["elementary/dayselector.pyx"]),
    Extension("elementary.datetime", ["elementary/datetime.pyx"]),
    Extension("elementary.diskselector", ["elementary/diskselector.pyx"]),
    Extension("elementary.entry", ["elementary/entry.pyx"]),
    Extension("elementary.fileselector", ["elementary/fileselector.pyx"]),
    Extension("elementary.fileselector_entry", ["elementary/fileselector_entry.pyx"]),
    Extension("elementary.fileselector_button", ["elementary/fileselector_button.pyx"]),
    Extension("elementary.flip", ["elementary/flip.pyx"]),
    Extension("elementary.frame", ["elementary/frame.pyx"]),
    Extension("elementary.general", ["elementary/general.pyx"]),
    Extension("elementary.genlist", ["elementary/genlist.pyx"]),
    Extension("elementary.gengrid", ["elementary/gengrid.pyx"]),
    Extension("elementary.gesture_layer", ["elementary/gesture_layer.pyx"]),
    Extension("elementary.grid", ["elementary/grid.pyx"]),
    Extension("elementary.hover", ["elementary/hover.pyx"]),
    Extension("elementary.hoversel", ["elementary/hoversel.pyx"]),
    Extension("elementary.icon", ["elementary/icon.pyx"]),
    Extension("elementary.image", ["elementary/image.pyx"]),
    Extension("elementary.index", ["elementary/index.pyx"]),
    Extension("elementary.innerwindow", ["elementary/innerwindow.pyx"]),
    Extension("elementary.label", ["elementary/label.pyx"]),
    Extension("elementary.layout", ["elementary/layout.pyx"]),
    Extension("elementary.layout_class", ["elementary/layout_class.pyx"]),
    Extension("elementary.list", ["elementary/list.pyx"]),
    Extension("elementary.map", ["elementary/map.pyx"]),
    Extension("elementary.mapbuf", ["elementary/mapbuf.pyx"]),
    Extension("elementary.menu", ["elementary/menu.pyx"]),
    Extension("elementary.multibuttonentry", ["elementary/multibuttonentry.pyx"]),
    Extension("elementary.naviframe", ["elementary/naviframe.pyx"]),
    Extension("elementary.need", ["elementary/need.pyx"]),
    Extension("elementary.notify", ["elementary/notify.pyx"]),
    Extension("elementary.object", ["elementary/object.pyx"]),
    Extension("elementary.object_item", ["elementary/object_item.pyx"]),
    Extension("elementary.panel", ["elementary/panel.pyx"]),
    Extension("elementary.panes", ["elementary/panes.pyx"]),
    Extension("elementary.photo", ["elementary/photo.pyx"]),
    Extension("elementary.photocam", ["elementary/photocam.pyx"]),
    Extension("elementary.plug", ["elementary/plug.pyx"]),
    Extension("elementary.popup", ["elementary/popup.pyx"]),
    Extension("elementary.progressbar", ["elementary/progressbar.pyx"]),
    Extension("elementary.radio", ["elementary/radio.pyx"]),
    Extension("elementary.scroller", ["elementary/scroller.pyx"]),
    Extension("elementary.segment_control", ["elementary/segment_control.pyx"]),
    Extension("elementary.separator", ["elementary/separator.pyx"]),
    Extension("elementary.slider", ["elementary/slider.pyx"]),
    Extension("elementary.slideshow", ["elementary/slideshow.pyx"]),
    Extension("elementary.spinner", ["elementary/spinner.pyx"]),
    Extension("elementary.table", ["elementary/table.pyx"]),
    Extension("elementary.theme", ["elementary/theme.pyx"]),
    Extension("elementary.thumb", ["elementary/thumb.pyx"]),
    Extension("elementary.toolbar", ["elementary/toolbar.pyx"]),
    Extension("elementary.transit", ["elementary/transit.pyx"]),
    Extension("elementary.video", ["elementary/video.pyx"]),
    Extension("elementary.web", ["elementary/web.pyx"]),
    Extension("elementary.window", ["elementary/window.pyx"]),
]

for e in ext_modules:
    e.pyrex_directives = {"embedsignature": True}
    e.include_dirs = include_dirs
    e.libraries = libraries

setup(
    name = "elementary",
    cmdclass = {'build_ext': build_ext},
    packages = ["elementary"],
    ext_modules = cythonize(ext_modules),
    requires = [
        "evas",
        "ecore",
        "edje",
    ],
    provides = ["elementary"],
)
