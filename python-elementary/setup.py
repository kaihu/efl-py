#!/usr/bin/python

from setuptools import setup
from setuptools import Extension
from Cython.Distutils import build_ext
from Cython.Build import cythonize
import commands

def pkgconfig(*packages, **kw):
    flag_map = {'-I': 'include_dirs', '-L': 'library_dirs', '-l': 'libraries'}
    for token in commands.getoutput("pkg-config --libs --cflags %s" % ' '.join(packages)).split():
        if flag_map.has_key(token[:2]):
            kw.setdefault(flag_map.get(token[:2]), []).append(token[2:])
        else: # throw others to extra_link_args
            kw.setdefault('extra_link_args', []).append(token)
    for k, v in kw.iteritems(): # remove duplicated
        kw[k] = list(set(v))
    return kw

ext_modules=[
    Extension("elementary.actionslider", ["elementary/actionslider.pyx"], **pkgconfig('elementary')),
    Extension("elementary.background", ["elementary/background.pyx"], **pkgconfig('elementary')),
    Extension("elementary.box", ["elementary/box.pyx"], **pkgconfig('elementary')),
    Extension("elementary.bubble", ["elementary/bubble.pyx"], **pkgconfig('elementary')),
    Extension("elementary.button", ["elementary/button.pyx"], **pkgconfig('elementary')),
    Extension("elementary.calendar", ["elementary/calendar.pyx"], **pkgconfig('elementary')),
    Extension("elementary.check", ["elementary/check.pyx"], **pkgconfig('elementary')),
    Extension("elementary.clock", ["elementary/clock.pyx"], **pkgconfig('elementary')),
    Extension("elementary.colorselector", ["elementary/colorselector.pyx"], **pkgconfig('elementary')),
    Extension("elementary.configuration", ["elementary/configuration.pyx"], **pkgconfig('elementary')),
    Extension("elementary.conformant", ["elementary/conformant.pyx"], **pkgconfig('elementary')),
    Extension("elementary.ctxpopup", ["elementary/ctxpopup.pyx"], **pkgconfig('elementary')),
    Extension("elementary.dayselector", ["elementary/dayselector.pyx"], **pkgconfig('elementary')),
    Extension("elementary.datetime", ["elementary/datetime.pyx"], **pkgconfig('elementary')),
    Extension("elementary.diskselector", ["elementary/diskselector.pyx"], **pkgconfig('elementary')),
    Extension("elementary.entry", ["elementary/entry.pyx"], **pkgconfig('elementary')),
    Extension("elementary.fileselector", ["elementary/fileselector.pyx"], **pkgconfig('elementary')),
    Extension("elementary.fileselector_entry", ["elementary/fileselector_entry.pyx"], **pkgconfig('elementary')),
    Extension("elementary.fileselector_button", ["elementary/fileselector_button.pyx"], **pkgconfig('elementary')),
    Extension("elementary.flip", ["elementary/flip.pyx"], **pkgconfig('elementary')),
    Extension("elementary.frame", ["elementary/frame.pyx"], **pkgconfig('elementary')),
    Extension("elementary.general", ["elementary/general.pyx"], **pkgconfig('elementary')),
    Extension("elementary.genlist", ["elementary/genlist.pyx"], **pkgconfig('elementary')),
    Extension("elementary.gengrid", ["elementary/gengrid.pyx"], **pkgconfig('elementary')),
    Extension("elementary.gesture_layer", ["elementary/gesture_layer.pyx"], **pkgconfig('elementary')),
    Extension("elementary.grid", ["elementary/grid.pyx"], **pkgconfig('elementary')),
    Extension("elementary.hover", ["elementary/hover.pyx"], **pkgconfig('elementary')),
    Extension("elementary.hoversel", ["elementary/hoversel.pyx"], **pkgconfig('elementary')),
    Extension("elementary.icon", ["elementary/icon.pyx"], **pkgconfig('elementary')),
    Extension("elementary.image", ["elementary/image.pyx"], **pkgconfig('elementary')),
    Extension("elementary.index", ["elementary/index.pyx"], **pkgconfig('elementary')),
    Extension("elementary.innerwindow", ["elementary/innerwindow.pyx"], **pkgconfig('elementary')),
    Extension("elementary.label", ["elementary/label.pyx"], **pkgconfig('elementary')),
    Extension("elementary.layout", ["elementary/layout.pyx"], **pkgconfig('elementary')),
    Extension("elementary.layout_class", ["elementary/layout_class.pyx"], **pkgconfig('elementary')),
    Extension("elementary.list", ["elementary/list.pyx"], **pkgconfig('elementary')),
    Extension("elementary.map", ["elementary/map.pyx"], **pkgconfig('elementary')),
    Extension("elementary.mapbuf", ["elementary/mapbuf.pyx"], **pkgconfig('elementary')),
    Extension("elementary.menu", ["elementary/menu.pyx"], **pkgconfig('elementary')),
    Extension("elementary.multibuttonentry", ["elementary/multibuttonentry.pyx"], **pkgconfig('elementary')),
    Extension("elementary.naviframe", ["elementary/naviframe.pyx"], **pkgconfig('elementary')),
    Extension("elementary.need", ["elementary/need.pyx"], **pkgconfig('elementary')),
    Extension("elementary.notify", ["elementary/notify.pyx"], **pkgconfig('elementary')),
    Extension("elementary.object", ["elementary/object.pyx"], **pkgconfig('elementary')),
    Extension("elementary.object_item", ["elementary/object_item.pyx"], **pkgconfig('elementary')),
    Extension("elementary.panel", ["elementary/panel.pyx"], **pkgconfig('elementary')),
    Extension("elementary.panes", ["elementary/panes.pyx"], **pkgconfig('elementary')),
    Extension("elementary.photo", ["elementary/photo.pyx"], **pkgconfig('elementary')),
    Extension("elementary.photocam", ["elementary/photocam.pyx"], **pkgconfig('elementary')),
    Extension("elementary.plug", ["elementary/plug.pyx"], **pkgconfig('elementary')),
    Extension("elementary.popup", ["elementary/popup.pyx"], **pkgconfig('elementary')),
    Extension("elementary.progressbar", ["elementary/progressbar.pyx"], **pkgconfig('elementary')),
    Extension("elementary.radio", ["elementary/radio.pyx"], **pkgconfig('elementary')),
    Extension("elementary.scroller", ["elementary/scroller.pyx"], **pkgconfig('elementary')),
    Extension("elementary.segment_control", ["elementary/segment_control.pyx"], **pkgconfig('elementary')),
    Extension("elementary.separator", ["elementary/separator.pyx"], **pkgconfig('elementary')),
    Extension("elementary.slider", ["elementary/slider.pyx"], **pkgconfig('elementary')),
    Extension("elementary.slideshow", ["elementary/slideshow.pyx"], **pkgconfig('elementary')),
    Extension("elementary.spinner", ["elementary/spinner.pyx"], **pkgconfig('elementary')),
    Extension("elementary.table", ["elementary/table.pyx"], **pkgconfig('elementary')),
    Extension("elementary.theme", ["elementary/theme.pyx"], **pkgconfig('elementary')),
    Extension("elementary.thumb", ["elementary/thumb.pyx"], **pkgconfig('elementary')),
    Extension("elementary.toolbar", ["elementary/toolbar.pyx"], **pkgconfig('elementary')),
    Extension("elementary.transit", ["elementary/transit.pyx"], **pkgconfig('elementary')),
    Extension("elementary.video", ["elementary/video.pyx"], **pkgconfig('elementary')),
    Extension("elementary.web", ["elementary/web.pyx"], **pkgconfig('elementary')),
    Extension("elementary.window", ["elementary/window.pyx"], **pkgconfig('elementary')),
]

for e in ext_modules:
    e.pyrex_directives = {"embedsignature": True}

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
