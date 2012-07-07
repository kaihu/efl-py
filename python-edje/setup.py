#!/usr/bin/python

from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext
from Cython.Build import cythonize
import commands

try:
    from sphinx.setup_command import BuildDoc
except:
    class BuildDoc(Command):
        description = "build documentation using sphinx, that must be installed."
        user_options = []
        def initialize_options(self): pass
        def finalize_options(self): pass
        def run(self): print("Error: sphinx not found")

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
    Extension("edje.edit", ["edje/edit.pyx"], define_macros=[("EDJE_EDIT_IS_UNSTABLE_AND_I_KNOW_ABOUT_IT", "1")], **pkgconfig("edje")),
    Extension("edje.general", ["edje/general.pyx"], **pkgconfig("edje"))
]

for e in ext_modules:
    e.pyrex_directives = {"embedsignature": True}

setup(
    name = "edje",
    version = "1.7.0",
    description = "Python bindings for EFL Edje",
    cmdclass = {'build_ext': build_ext, 'build_sphinx': BuildDoc, 'build_doc': BuildDoc},
    packages = ["edje"],
    ext_modules = cythonize(ext_modules),
    package_data = {"edje": ["*.pxd"]},
    requires = ["evas", "ecore"],
    provides = ["edje"],
)
