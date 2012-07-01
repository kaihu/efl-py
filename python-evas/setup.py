#!/usr/bin/python

from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext
from Cython.Build import cythonize

include_dirs = [
    ".",
    "/usr/include/evas-1",
    "/usr/include/eina-1",
    "/usr/include/eina-1/eina",
]

libraries = [
    "evas",
]

ext_modules=[
    Extension("evas.callbacks", ["evas/callbacks.pyx"], include_dirs = include_dirs, libraries = libraries),
    Extension("evas.canvas", ["evas/canvas.pyx"], include_dirs = include_dirs, libraries = libraries),
    Extension("evas.canvas_callbacks", ["evas/canvas_callbacks.pyx"], include_dirs = include_dirs, libraries = libraries),
    Extension("evas.events", ["evas/events.pyx"], include_dirs = include_dirs, libraries = libraries),
    Extension("evas.general", ["evas/general.pyx"], include_dirs = include_dirs, libraries = libraries),
    Extension("evas.map", ["evas/map.pyx"], include_dirs = include_dirs, libraries = libraries),
    Extension("evas.object", ["evas/object.pyx"], include_dirs = include_dirs, libraries = libraries),
    Extension("evas.object_box", ["evas/object_box.pyx"], include_dirs = include_dirs, libraries = libraries),
    Extension("evas.object_image", ["evas/object_image.pyx", "evas/evas_object_image_rotate.c", "evas/evas_object_image_mask.c"], include_dirs = include_dirs, libraries = libraries),
    Extension("evas.object_line", ["evas/object_line.pyx"], include_dirs = include_dirs, libraries = libraries),
    Extension("evas.object_polygon", ["evas/object_polygon.pyx"], include_dirs = include_dirs, libraries = libraries),
    Extension("evas.object_rectangle", ["evas/object_rectangle.pyx"], include_dirs = include_dirs, libraries = libraries),
    Extension("evas.object_smart", ["evas/object_smart.pyx"], include_dirs = include_dirs, libraries = libraries),
    Extension("evas.object_text", ["evas/object_text.pyx"], include_dirs = include_dirs, libraries = libraries),
    Extension("evas.rect", ["evas/rect.pyx"], include_dirs = include_dirs, libraries = libraries),
    Extension("evas.textblock", ["evas/textblock.pyx"], include_dirs = include_dirs, libraries = libraries),
]

setup(
    name = "evas",
    cmdclass = {'build_ext': build_ext},
    packages = ["evas"],
    ext_modules = cythonize(ext_modules),
    package_data = {"evas": ["*.pxd"]},
    headers = ["evas/evas_object_image_python_extras.h"],
    provides = ["evas"],
)
