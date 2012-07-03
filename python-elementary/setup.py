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

modules=[
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
    "dayselector",
    "datetime",
    "diskselector",
    "entry",
    "fileselector",
    "fileselector_entry",
    "fileselector_button",
    "flip",
    "frame",
    "general",
    "genlist",
    "gengrid",
    "gesture_layer",
    "grid",
    "hover",
    "hoversel",
    "icon",
    "image",
    "index",
    "innerwindow",
    "label",
    "layout",
    "layout_class",
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

ext_modules = []

for m in modules:
    ext_modules.append(Extension("elementary."+m, ["elementary/"+m+".pyx"], **pkgconfig("elementary")))

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
