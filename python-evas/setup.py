#!/usr/bin/python

from distutils.core import setup
from distutils.extension import Extension
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
    "callbacks",
    "canvas",
    "canvas_callbacks",
    "events",
    "general",
    "map",
    "object",
    "object_box",
    "object_line",
    "object_polygon",
    "object_rectangle",
    "object_smart",
    "object_text",
    "rect",
    "textblock",
]

ext_modules=[]

for m in modules:
    ext_modules.append(Extension("evas."+m, ["evas/"+m+".pyx"], **pkgconfig("evas")))

ext_modules.append(Extension("evas.object_image", ["evas/object_image.pyx", "evas/evas_object_image_rotate.c", "evas/evas_object_image_mask.c"], **pkgconfig("evas")))

for e in ext_modules:
    e.pyrex_directives = {"embedsignature": True}

setup(
    name = "evas",
    version = "1.7.0",
    description = "Python binding for Evas",
    cmdclass = {'build_ext': build_ext},
    packages = ["evas"],
    ext_modules = cythonize(ext_modules),
    package_data = {"evas": ["*.pxd"]},
    headers = ["evas/evas_object_image_python_extras.h"],
    provides = ["evas"],
)
