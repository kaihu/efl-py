#!/usr/bin/python

from distutils.core import setup, Command
from distutils.extension import Extension
from Cython.Distutils import build_ext
from Cython.Build import cythonize
import commands
import sys
from distutils.sysconfig import get_python_inc

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
    Extension("emotion", ["emotion/emotion.pyx"], **pkgconfig("emotion"))
]

for e in ext_modules:
    e.pyrex_directives = {"embedsignature": True}
    e.include_dirs = e.include_dirs + sys.path
    e.include_dirs.append(get_python_inc())
    e.include_dirs.append("/usr/local/include/python2.7")

setup(
    name = "emotion",
    version = "1.7.0",
    description = "Python bindings for EFL Emotion",
    cmdclass = {'build_ext': build_ext, 'build_sphinx': BuildDoc, 'build_doc': BuildDoc},
    ext_modules = cythonize(ext_modules, include_path=sys.path, compiler_directives={"embedsignature": True}),
    package_data = {"emotion": ["*.pxd"]},
    requires = ["evas", "ecore", "edje"],
    provides = ["emotion"],
)
