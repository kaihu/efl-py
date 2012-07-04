#!/usr/bin/python

from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext
from Cython.Build import cythonize
from sphinx.setup_command import BuildDoc
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
    "general",
    "evas",
    "file",
    "imf",
    "win32",
    "x",
    "x_screensaver"
]

ext_modules=[]

for m in modules:
    if m == "evas":
        ext_modules.append(Extension("ecore."+m, ["ecore/"+m+".pyx"], **pkgconfig("ecore", "ecore-evas")))
    elif m == "win32":
        pass
        #ext_modules.append(Extension("ecore."+m, ["ecore/"+m+".pyx"], **pkgconfig("ecore")))
    elif m == "x" or m == "x_screensaver":
        ext_modules.append(Extension("ecore."+m, ["ecore/"+m+".pyx"], **pkgconfig("ecore, ecore-x")))
    else:
        ext_modules.append(Extension("ecore."+m, ["ecore/"+m+".pyx"], **pkgconfig("ecore")))

for e in ext_modules:
    e.pyrex_directives = {"embedsignature": True}

setup(
    name = "ecore",
    version = "1.7.0",
    description = "Python bindings for EFL Ecore",
    cmdclass = {'build_ext': build_ext, 'build_sphinx': BuildDoc},
    packages = ["ecore"],
    ext_modules = cythonize(ext_modules),
    package_data = {"ecore": ["*.pxd"]},
    provides = ["ecore"],
)
