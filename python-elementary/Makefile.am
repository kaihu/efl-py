ACLOCAL_AMFLAGS = -I m4

cython_ins = \
	elementary/elementary.actionslider.pyx \
	elementary/elementary.background.pyx \
	elementary/elementary.box.pyx \
	elementary/elementary.bubble.pyx \
	elementary/elementary.button.pyx \
	elementary/elementary.calendar.pyx \
	elementary/elementary.check.pyx \
	elementary/elementary.clock.pyx \
	elementary/elementary.colorselector.pyx \
	elementary/elementary.configuration.pyx \
	elementary/elementary.conformant.pyx \
	elementary/elementary.ctxpopup.pyx \
	elementary/elementary.datetime_elm.pyx \
	elementary/elementary.dayselector.pyx \
	elementary/elementary.diskselector.pyx \
	elementary/elementary.entry.pyx \
	elementary/elementary.fileselector.pyx \
	elementary/elementary.fileselector_entry.pyx \
	elementary/elementary.fileselector_button.pyx \
	elementary/elementary.flip.pyx \
	elementary/elementary.frame.pyx \
	elementary/elementary.general.pyx \
	elementary/elementary.gengrid.pyx \
	elementary/elementary.genlist.pyx \
	elementary/elementary.gesture_layer.pyx \
	elementary/elementary.grid.pyx \
	elementary/elementary.hover.pyx \
	elementary/elementary.hoversel.pyx \
	elementary/elementary.icon.pyx \
	elementary/elementary.image.pyx \
	elementary/elementary.index.pyx \
	elementary/elementary.innerwindow.pyx \
	elementary/elementary.label.pyx \
	elementary/elementary.layout.pyx \
	elementary/elementary.layout_class.pyx \
	elementary/elementary.list.pyx \
	elementary/elementary.map.pyx \
	elementary/elementary.mapbuf.pyx \
	elementary/elementary.menu.pyx \
	elementary/elementary.multibuttonentry.pyx \
	elementary/elementary.naviframe.pyx \
	elementary/elementary.need.pyx \
	elementary/elementary.notify.pyx \
	elementary/elementary.object.pyx \
	elementary/elementary.object_item.pyx \
	elementary/elementary.panel.pyx \
	elementary/elementary.panes.pyx \
	elementary/elementary.photo.pyx \
	elementary/elementary.photocam.pyx \
	elementary/elementary.plug.pyx \
	elementary/elementary.popup.pyx \
	elementary/elementary.progressbar.pyx \
	elementary/elementary.radio.pyx \
	elementary/elementary.scroller.pyx \
	elementary/elementary.segment_control.pyx \
	elementary/elementary.separator.pyx \
	elementary/elementary.slider.pyx \
	elementary/elementary.slideshow.pyx \
	elementary/elementary.spinner.pyx \
	elementary/elementary.table.pyx \
	elementary/elementary.theme.pyx \
	elementary/elementary.thumb.pyx \
	elementary/elementary.toolbar.pyx \
	elementary/elementary.transit.pyx \
	elementary/elementary.video.pyx \
	elementary/elementary.web.pyx \
	elementary/elementary.window.pyx

cython_outs = \
	elementary/elementary.actionslider.c \
	elementary/elementary.background.c \
	elementary/elementary.box.c \
	elementary/elementary.bubble.c \
	elementary/elementary.button.c \
	elementary/elementary.calendar.c \
	elementary/elementary.check.c \
	elementary/elementary.clock.c \
	elementary/elementary.colorselector.c \
	elementary/elementary.configuration.c \
	elementary/elementary.conformant.c \
	elementary/elementary.ctxpopup.c \
	elementary/elementary.datetime_elm.c \
	elementary/elementary.dayselector.c \
	elementary/elementary.diskselector.c \
	elementary/elementary.entry.c \
	elementary/elementary.fileselector.c \
	elementary/elementary.fileselector_entry.c \
	elementary/elementary.fileselector_button.c \
	elementary/elementary.flip.c \
	elementary/elementary.frame.c \
	elementary/elementary.general.c \
	elementary/elementary.gengrid.c \
	elementary/elementary.genlist.c \
	elementary/elementary.gesture_layer.c \
	elementary/elementary.grid.c \
	elementary/elementary.hover.c \
	elementary/elementary.hoversel.c \
	elementary/elementary.icon.c \
	elementary/elementary.image.c \
	elementary/elementary.index.c \
	elementary/elementary.innerwindow.c \
	elementary/elementary.label.c \
	elementary/elementary.layout.c \
	elementary/elementary.layout_class.c \
	elementary/elementary.list.c \
	elementary/elementary.map.c \
	elementary/elementary.mapbuf.c \
	elementary/elementary.menu.c \
	elementary/elementary.multibuttonentry.c \
	elementary/elementary.naviframe.c \
	elementary/elementary.need.c \
	elementary/elementary.notify.c \
	elementary/elementary.object.c \
	elementary/elementary.object_item.c \
	elementary/elementary.panel.c \
	elementary/elementary.panes.c \
	elementary/elementary.photo.c \
	elementary/elementary.photocam.c \
	elementary/elementary.plug.c \
	elementary/elementary.popup.c \
	elementary/elementary.progressbar.c \
	elementary/elementary.radio.c \
	elementary/elementary.scroller.c \
	elementary/elementary.segment_control.c \
	elementary/elementary.separator.c \
	elementary/elementary.slider.c \
	elementary/elementary.slideshow.c \
	elementary/elementary.spinner.c \
	elementary/elementary.table.c \
	elementary/elementary.theme.c \
	elementary/elementary.thumb.c \
	elementary/elementary.toolbar.c \
	elementary/elementary.transit.c \
	elementary/elementary.video.c \
	elementary/elementary.web.c \
	elementary/elementary.window.c

CYTHONFLAGS = @CYTHONFLAGS@
CYTHON_ELEMENTARY_FLAGS = -I@CYTHON_ELEMENTARY_INCLUDEDIR@
EPYDOC = @EPYDOC@

# python-elementary still does not export any public cpython/cython interfaces
# pyincelementarydir = $(includedir)/@PACKAGE@/elementary
# pyincelementary_DATA = ... elementary/elementary.general.c_elementary.h ...
c_elementary_includes = \
	include/elementary/__init__.py \
	include/elementary/actionslider.pxd \
	include/elementary/background.pxd \
	include/elementary/box.pxd \
	include/elementary/bubble.pxd \
	include/elementary/button.pxd \
	include/elementary/calendar.pxd \
	include/elementary/check.pxd \
	include/elementary/clock.pxd \
	include/elementary/colorselector.pxd \
	include/elementary/configuration.pxd \
	include/elementary/conformant.pxd \
	include/elementary/ctxpopup.pxd \
	include/elementary/datetime_elm.pxd \
	include/elementary/dayselector.pxd \
	include/elementary/diskselector.pxd \
	include/elementary/general.pxd \
	include/elementary/entry.pxd \
	include/elementary/fileselector.pxd \
	include/elementary/fileselector_button.pxd \
	include/elementary/fileselector_entry.pxd \
	include/elementary/flip.pxd \
	include/elementary/frame.pxd \
	include/elementary/gengrid.pxd \
	include/elementary/genlist.pxd \
	include/elementary/gesture_layer.pxd \
	include/elementary/grid.pxd \
	include/elementary/hover.pxd \
	include/elementary/hoversel.pxd \
	include/elementary/icon.pxd \
	include/elementary/image.pxd \
	include/elementary/index.pxd \
	include/elementary/innerwindow.pxd \
	include/elementary/label.pxd \
	include/elementary/layout.pxd \
	include/elementary/layout_class.pxd \
	include/elementary/list.pxd \
	include/elementary/map.pxd \
	include/elementary/mapbuf.pxd \
	include/elementary/menu.pxd \
	include/elementary/multibuttonentry.pxd \
	include/elementary/naviframe.pxd \
	include/elementary/need.pxd \
	include/elementary/notify.pxd \
	include/elementary/object.pxd \
	include/elementary/object_item.pxd \
	include/elementary/panel.pxd \
	include/elementary/panes.pxd \
	include/elementary/photo.pxd \
	include/elementary/photocam.pxd \
	include/elementary/plug.pxd \
	include/elementary/popup.pxd \
	include/elementary/progressbar.pxd \
	include/elementary/radio.pxd \
	include/elementary/scroller.pxd \
	include/elementary/segment_control.pxd \
	include/elementary/separator.pxd \
	include/elementary/slider.pxd \
	include/elementary/slideshow.pxd \
	include/elementary/spinner.pxd \
	include/elementary/table.pxd \
	include/elementary/theme.pxd \
	include/elementary/thumb.pxd \
	include/elementary/toolbar.pxd \
	include/elementary/transit.pxd \
	include/elementary/video.pxd \
	include/elementary/web.pxd \
	include/elementary/window.pxd

c_elementary_deps = elementary/callbacks.pxi \
	elementary/conversions.pxi
	elementary/tooltips.pxi
	elementary/widget_header.pxi

# elementary tests are not actual unit tests but a test AND a nice example
examples_files = \
	tests/test.py \
	tests/test.edj \
	tests/cursors.edj \
	tests/test_3d.py \
	tests/test_actionslider.py \
	tests/test_bg.py \
	tests/test_box.py \
	tests/test_button.py \
	tests/test_check.py \
	tests/test_clock.py \
	tests/test_colorselector.py \
	tests/test_config.py \
	tests/test_ctxpopup.py \
	tests/test_dayselector.py \
	tests/test_entry.py \
	tests/test_fileselector.py \
	tests/test_flip.py \
	tests/test_genlist.py \
	tests/test_gengrid.py \
	tests/test_hover.py \
	tests/test_hoversel.py \
	tests/test_icon.py \
	tests/test_inwin.py \
	tests/test_label.py \
	tests/test_layout.py \
	tests/test_list.py \
	tests/test_mapbuf.py \
	tests/test_map.py \
	tests/test_map2.py \
	tests/test_map3.py \
	tests/test_menu.py \
	tests/test_multibuttonentry.py \
	tests/test_naviframe.py \
	tests/test_notify.py \
	tests/test_panel.py \
	tests/test_progressbar.py \
	tests/test_radio.py \
	tests/test_scroller.py \
	tests/test_separator.py \
	tests/test_spinner.py \
	tests/test_table.py \
	tests/test_thumb.py \
	tests/test_toolbar.py \
	tests/test_tooltip.py \
	tests/test_web.py \
	tests/test_win.py

examples_images_files = \
	tests/images/icon_00.png \
	tests/images/icon_01.png \
	tests/images/icon_02.png \
	tests/images/icon_03.png \
	tests/images/icon_04.png \
	tests/images/icon_05.png \
	tests/images/icon_06.png \
	tests/images/icon_07.png \
	tests/images/icon_08.png \
	tests/images/icon_09.png \
	tests/images/icon_10.png \
	tests/images/icon_11.png \
	tests/images/icon_12.png \
	tests/images/icon_13.png \
	tests/images/icon_14.png \
	tests/images/icon_15.png \
	tests/images/icon_16.png \
	tests/images/icon_17.png \
	tests/images/icon_18.png \
	tests/images/icon_19.png \
	tests/images/icon_20.png \
	tests/images/icon_21.png \
	tests/images/icon_22.png \
	tests/images/icon_23.png \
	tests/images/insanely_huge_test_image.jpg \
	tests/images/logo.png \
	tests/images/logo_small.png \
	tests/images/panel_01.jpg \
	tests/images/plant_01.jpg \
	tests/images/rock_01.jpg \
	tests/images/rock_02.jpg \
	tests/images/sky_01.jpg \
	tests/images/sky_02.jpg \
	tests/images/sky_03.jpg \
	tests/images/sky_04.jpg \
	tests/images/wood_01.jpg \
	tests/images/icon_right_arrow.png
	tests/images/mystrale.jpg
	tests/images/mystrale_2.jpg

tests_files =


MAINTAINERCLEANFILES = \
	m4/libtool.m4 \
	m4/lt~obsolete.m4 \
	m4/ltoptions.m4 \
	m4/ltsugar.m4 \
	m4/ltversion.m4 \
	m4/libtool.m4 \
	ltmain.sh \
	depcomp \
	aclocal.m4 \
	config.guess \
	config.sub \
	configure \
	install-sh \
	Makefile.in \
	missing \
	py-compile \
        config.h.in \
	$(cython_outs)

EXTRA_DIST = \
	AUTHORS \
	COPYING \
	README \
	autogen.sh \
	python-elementary.pc.in \
	$(cython_ins) $(cython_outs) \
	$(c_elementary_includes) \
	$(c_elementary_deps) \
	$(examples_files) \
	$(examples_images_files) \
	$(tests_files)

# do not distcleancheck for generated elementary.general.c_elementary.[ch]
distcleancheck_listfiles = \
	find . -type f -not -name '*.c' -a -not -name '*.h'

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = python-elementary.pc

if HAVE_CYTHON
BUILT_SOURCES = $(cython_outs)
$(top_builddir)/elementary/elementary.actionslider.c:$(top_srcdir)/elementary/elementary.actionslider.pyx $(top_srcdir)/include/elementary/actionslider.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.background.c:$(top_srcdir)/elementary/elementary.background.pyx $(top_srcdir)/include/elementary/background.pxd  Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.box.c:$(top_srcdir)/elementary/elementary.box.pyx $(top_srcdir)/include/elementary/box.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.bubble.c:$(top_srcdir)/elementary/elementary.bubble.pyx $(top_srcdir)/include/elementary/bubble.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.button.c:$(top_srcdir)/elementary/elementary.button.pyx $(top_srcdir)/include/elementary/button.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.calendar.c:$(top_srcdir)/elementary/elementary.calendar.pyx $(top_srcdir)/include/elementary/calendar.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.check.c:$(top_srcdir)/elementary/elementary.check.pyx $(top_srcdir)/include/elementary/check.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.clock.c:$(top_srcdir)/elementary/elementary.clock.pyx $(top_srcdir)/include/elementary/clock.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.colorselector.c:$(top_srcdir)/elementary/elementary.colorselector.pyx $(top_srcdir)/include/elementary/colorselector.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.configuration.c:$(top_srcdir)/elementary/elementary.configuration.pyx $(top_srcdir)/include/elementary/configuration.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.conformant.c:$(top_srcdir)/elementary/elementary.conformant.pyx $(top_srcdir)/include/elementary/conformant.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.ctxpopup.c:$(top_srcdir)/elementary/elementary.ctxpopup.pyx $(top_srcdir)/include/elementary/ctxpopup.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.datetime_elm.c:$(top_srcdir)/elementary/elementary.datetime_elm.pyx $(top_srcdir)/include/elementary/datetime_elm.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.dayselector.c:$(top_srcdir)/elementary/elementary.dayselector.pyx $(top_srcdir)/include/elementary/dayselector.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.diskselector.c:$(top_srcdir)/elementary/elementary.diskselector.pyx $(top_srcdir)/include/elementary/diskselector.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.general.c:$(top_srcdir)/elementary/elementary.general.pyx $(top_srcdir)/include/elementary/general.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.entry.c:$(top_srcdir)/elementary/elementary.entry.pyx $(top_srcdir)/include/elementary/entry.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.fileselector.c:$(top_srcdir)/elementary/elementary.fileselector.pyx $(top_srcdir)/include/elementary/fileselector.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.fileselector_button.c:$(top_srcdir)/elementary/elementary.fileselector_button.pyx $(top_srcdir)/include/elementary/fileselector_button.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.fileselector_entry.c:$(top_srcdir)/elementary/elementary.fileselector_entry.pyx $(top_srcdir)/include/elementary/fileselector_entry.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.flip.c:$(top_srcdir)/elementary/elementary.flip.pyx $(top_srcdir)/include/elementary/flip.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.frame.c:$(top_srcdir)/elementary/elementary.frame.pyx $(top_srcdir)/include/elementary/frame.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.gengrid.c:$(top_srcdir)/elementary/elementary.gengrid.pyx $(top_srcdir)/include/elementary/gengrid.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.genlist.c:$(top_srcdir)/elementary/elementary.genlist.pyx $(top_srcdir)/include/elementary/genlist.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.gesture_layer.c:$(top_srcdir)/elementary/elementary.gesture_layer.pyx $(top_srcdir)/include/elementary/gesture_layer.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.grid.c:$(top_srcdir)/elementary/elementary.grid.pyx $(top_srcdir)/include/elementary/grid.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.hover.c:$(top_srcdir)/elementary/elementary.hover.pyx $(top_srcdir)/include/elementary/hover.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.hoversel.c:$(top_srcdir)/elementary/elementary.hoversel.pyx $(top_srcdir)/include/elementary/hoversel.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.icon.c:$(top_srcdir)/elementary/elementary.icon.pyx $(top_srcdir)/include/elementary/icon.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.image.c:$(top_srcdir)/elementary/elementary.image.pyx $(top_srcdir)/include/elementary/image.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.index.c:$(top_srcdir)/elementary/elementary.index.pyx $(top_srcdir)/include/elementary/index.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.innerwindow.c:$(top_srcdir)/elementary/elementary.innerwindow.pyx $(top_srcdir)/include/elementary/innerwindow.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.label.c:$(top_srcdir)/elementary/elementary.label.pyx $(top_srcdir)/include/elementary/label.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.layout.c:$(top_srcdir)/elementary/elementary.layout.pyx $(top_srcdir)/include/elementary/layout.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.layout_class.c:$(top_srcdir)/elementary/elementary.layout_class.pyx $(top_srcdir)/include/elementary/layout_class.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.list.c:$(top_srcdir)/elementary/elementary.list.pyx $(top_srcdir)/include/elementary/list.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.map.c:$(top_srcdir)/elementary/elementary.map.pyx $(top_srcdir)/include/elementary/map.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.mapbuf.c:$(top_srcdir)/elementary/elementary.mapbuf.pyx $(top_srcdir)/include/elementary/mapbuf.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.menu.c:$(top_srcdir)/elementary/elementary.menu.pyx $(top_srcdir)/include/elementary/menu.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.multibuttonentry.c:$(top_srcdir)/elementary/elementary.multibuttonentry.pyx $(top_srcdir)/include/elementary/multibuttonentry.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.naviframe.c:$(top_srcdir)/elementary/elementary.naviframe.pyx $(top_srcdir)/include/elementary/naviframe.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.need.c:$(top_srcdir)/elementary/elementary.need.pyx $(top_srcdir)/include/elementary/need.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.notify.c:$(top_srcdir)/elementary/elementary.notify.pyx $(top_srcdir)/include/elementary/notify.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.object.c:$(top_srcdir)/elementary/elementary.object.pyx $(top_srcdir)/include/elementary/object.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.object_item.c:$(top_srcdir)/elementary/elementary.object_item.pyx $(top_srcdir)/include/elementary/object_item.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.panel.c:$(top_srcdir)/elementary/elementary.panel.pyx $(top_srcdir)/include/elementary/panel.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.panes.c:$(top_srcdir)/elementary/elementary.panes.pyx $(top_srcdir)/include/elementary/panes.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.photo.c:$(top_srcdir)/elementary/elementary.photo.pyx $(top_srcdir)/include/elementary/photo.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.photocam.c:$(top_srcdir)/elementary/elementary.photocam.pyx $(top_srcdir)/include/elementary/photocam.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.plug.c:$(top_srcdir)/elementary/elementary.plug.pyx $(top_srcdir)/include/elementary/plug.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.popup.c:$(top_srcdir)/elementary/elementary.popup.pyx $(top_srcdir)/include/elementary/popup.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.progressbar.c:$(top_srcdir)/elementary/elementary.progressbar.pyx $(top_srcdir)/include/elementary/progressbar.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.radio.c:$(top_srcdir)/elementary/elementary.radio.pyx $(top_srcdir)/include/elementary/radio.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.scroller.c:$(top_srcdir)/elementary/elementary.scroller.pyx $(top_srcdir)/include/elementary/scroller.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.segment_control.c:$(top_srcdir)/elementary/elementary.segment_control.pyx $(top_srcdir)/include/elementary/segment_control.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.separator.c:$(top_srcdir)/elementary/elementary.separator.pyx $(top_srcdir)/include/elementary/separator.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.slider.c:$(top_srcdir)/elementary/elementary.slider.pyx $(top_srcdir)/include/elementary/slider.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.slideshow.c:$(top_srcdir)/elementary/elementary.slideshow.pyx $(top_srcdir)/include/elementary/slideshow.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.spinner.c:$(top_srcdir)/elementary/elementary.spinner.pyx $(top_srcdir)/include/elementary/spinner.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.table.c:$(top_srcdir)/elementary/elementary.table.pyx $(top_srcdir)/include/elementary/table.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.theme.c:$(top_srcdir)/elementary/elementary.theme.pyx $(top_srcdir)/include/elementary/theme.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.thumb.c:$(top_srcdir)/elementary/elementary.thumb.pyx $(top_srcdir)/include/elementary/thumb.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.toolbar.c:$(top_srcdir)/elementary/elementary.toolbar.pyx $(top_srcdir)/include/elementary/toolbar.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.transit.c:$(top_srcdir)/elementary/elementary.transit.pyx $(top_srcdir)/include/elementary/transit.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.video.c:$(top_srcdir)/elementary/elementary.video.pyx $(top_srcdir)/include/elementary/video.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.web.c:$(top_srcdir)/elementary/elementary.web.pyx $(top_srcdir)/include/elementary/web.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
$(top_builddir)/elementary/elementary.window.c:$(top_srcdir)/elementary/elementary.window.pyx $(top_srcdir)/include/elementary/window.pxd Makefile
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)cd $(top_builddir) && $(PYTHON) -m cython $(CYTHON_ELEMENTARY_FLAGS) -I$(top_srcdir)/include $(CYTHONFLAGS) -o $@ $<
else
$(top_builddir)/elementary/elementary.general.c: Makefile
	@echo "NOTE: No cython, using pre-generated elementary.general.c_elementary.[ch]"
	@$(MKDIR_P) $(top_builddir)/elementary
	$(AM_V_GEN)for f in elementary/elementary.general.celementary._general.c; do if ! cmp $(top_srcdir)/$$f $(top_srcdir)/$$f > /dev/null; then cp $(top_srcdir)/$$f $(top_builddir)/$$f; fi; done
endif

AM_CPPFLAGS = \
	-I$(top_srcdir) \
	-I$(top_srcdir)/elementary \
	-I$(top_srcdir)/include \
	@PYTHON_INCLUDES@ \
	@ELEMENTARY_CFLAGS@

pyexecelementarydir =  $(pyexecdir)/elementary
pyexecelementary_LTLIBRARIES = actionslider.la \
background.la \
box.la \
bubble.la \
button.la \
calendar.la \
check.la \
clock.la \
colorselector.la \
configuration.la \
conformant.la \
ctxpopup.la \
datetime_elm.la \
dayselector.la \
diskselector.la \
general.la \
entry.la \
fileselector.la \
fileselector_button.la \
fileselector_entry.la \
flip.la \
frame.la \
gengrid.la \
genlist.la \
gesture_layer.la \
grid.la \
hover.la \
hoversel.la \
icon.la \
image.la \
index.la \
innerwindow.la \
label.la \
layout.la \
layout_class.la \
list.la \
map.la \
mapbuf.la \
menu.la \
multibuttonentry.la \
naviframe.la \
need.la \
notify.la \
object.la \
object_item.la \
panel.la \
panes.la \
photo.la \
photocam.la \
plug.la \
popup.la \
progressbar.la \
radio.la \
scroller.la \
segment_control.la \
separator.la \
slider.la \
slideshow.la \
spinner.la \
table.la \
theme.la \
thumb.la \
toolbar.la \
transit.la \
video.la \
web.la \
window.la

actionslider_la_LIBADD = @ELEMENTARY_LIBS@
actionslider_la_LDFLAGS = -module -avoid-version
actionslider_la_LIBTOOLFLAGS = --tag=disable-static
actionslider_la_SOURCES = $(top_builddir)/elementary/elementary.actionslider.c

background_la_LIBADD = @ELEMENTARY_LIBS@
background_la_LDFLAGS = -module -avoid-version
background_la_LIBTOOLFLAGS = --tag=disable-static
background_la_SOURCES = $(top_builddir)/elementary/elementary.background.c

box_la_LIBADD = @ELEMENTARY_LIBS@
box_la_LDFLAGS = -module -avoid-version
box_la_LIBTOOLFLAGS = --tag=disable-static
box_la_SOURCES = $(top_builddir)/elementary/elementary.box.c

bubble_la_LIBADD = @ELEMENTARY_LIBS@
bubble_la_LDFLAGS = -module -avoid-version
bubble_la_LIBTOOLFLAGS = --tag=disable-static
bubble_la_SOURCES = $(top_builddir)/elementary/elementary.bubble.c

button_la_LIBADD = @ELEMENTARY_LIBS@
button_la_LDFLAGS = -module -avoid-version
button_la_LIBTOOLFLAGS = --tag=disable-static
button_la_SOURCES = $(top_builddir)/elementary/elementary.button.c

calendar_la_LIBADD = @ELEMENTARY_LIBS@
calendar_la_LDFLAGS = -module -avoid-version
calendar_la_LIBTOOLFLAGS = --tag=disable-static
calendar_la_SOURCES = $(top_builddir)/elementary/elementary.calendar.c

check_la_LIBADD = @ELEMENTARY_LIBS@
check_la_LDFLAGS = -module -avoid-version
check_la_LIBTOOLFLAGS = --tag=disable-static
check_la_SOURCES = $(top_builddir)/elementary/elementary.check.c

clock_la_LIBADD = @ELEMENTARY_LIBS@
clock_la_LDFLAGS = -module -avoid-version
clock_la_LIBTOOLFLAGS = --tag=disable-static
clock_la_SOURCES = $(top_builddir)/elementary/elementary.clock.c

colorselector_la_LIBADD = @ELEMENTARY_LIBS@
colorselector_la_LDFLAGS = -module -avoid-version
colorselector_la_LIBTOOLFLAGS = --tag=disable-static
colorselector_la_SOURCES = $(top_builddir)/elementary/elementary.colorselector.c

configuration_la_LIBADD = @ELEMENTARY_LIBS@
configuration_la_LDFLAGS = -module -avoid-version
configuration_la_LIBTOOLFLAGS = --tag=disable-static
configuration_la_SOURCES = $(top_builddir)/elementary/elementary.configuration.c

conformant_la_LIBADD = @ELEMENTARY_LIBS@
conformant_la_LDFLAGS = -module -avoid-version
conformant_la_LIBTOOLFLAGS = --tag=disable-static
conformant_la_SOURCES = $(top_builddir)/elementary/elementary.conformant.c

ctxpopup_la_LIBADD = @ELEMENTARY_LIBS@
ctxpopup_la_LDFLAGS = -module -avoid-version
ctxpopup_la_LIBTOOLFLAGS = --tag=disable-static
ctxpopup_la_SOURCES = $(top_builddir)/elementary/elementary.ctxpopup.c

datetime_elm_la_LIBADD = @ELEMENTARY_LIBS@
datetime_elm_la_LDFLAGS = -module -avoid-version
datetime_elm_la_LIBTOOLFLAGS = --tag=disable-static
datetime_elm_la_SOURCES = $(top_builddir)/elementary/elementary.datetime_elm.c

dayselector_la_LIBADD = @ELEMENTARY_LIBS@
dayselector_la_LDFLAGS = -module -avoid-version
dayselector_la_LIBTOOLFLAGS = --tag=disable-static
dayselector_la_SOURCES = $(top_builddir)/elementary/elementary.dayselector.c

diskselector_la_LIBADD = @ELEMENTARY_LIBS@
diskselector_la_LDFLAGS = -module -avoid-version
diskselector_la_LIBTOOLFLAGS = --tag=disable-static
diskselector_la_SOURCES = $(top_builddir)/elementary/elementary.diskselector.c

general_la_LIBADD = @ELEMENTARY_LIBS@
general_la_LDFLAGS = -module -avoid-version
general_la_LIBTOOLFLAGS = --tag=disable-static
general_la_SOURCES = $(top_builddir)/elementary/elementary.general.c

entry_la_LIBADD = @ELEMENTARY_LIBS@
entry_la_LDFLAGS = -module -avoid-version
entry_la_LIBTOOLFLAGS = --tag=disable-static
entry_la_SOURCES = $(top_builddir)/elementary/elementary.entry.c

fileselector_la_LIBADD = @ELEMENTARY_LIBS@
fileselector_la_LDFLAGS = -module -avoid-version
fileselector_la_LIBTOOLFLAGS = --tag=disable-static
fileselector_la_SOURCES = $(top_builddir)/elementary/elementary.fileselector.c

fileselector_button_la_LIBADD = @ELEMENTARY_LIBS@
fileselector_button_la_LDFLAGS = -module -avoid-version
fileselector_button_la_LIBTOOLFLAGS = --tag=disable-static
fileselector_button_la_SOURCES = $(top_builddir)/elementary/elementary.fileselector_button.c

fileselector_entry_la_LIBADD = @ELEMENTARY_LIBS@
fileselector_entry_la_LDFLAGS = -module -avoid-version
fileselector_entry_la_LIBTOOLFLAGS = --tag=disable-static
fileselector_entry_la_SOURCES = $(top_builddir)/elementary/elementary.fileselector_entry.c

flip_la_LIBADD = @ELEMENTARY_LIBS@
flip_la_LDFLAGS = -module -avoid-version
flip_la_LIBTOOLFLAGS = --tag=disable-static
flip_la_SOURCES = $(top_builddir)/elementary/elementary.flip.c

frame_la_LIBADD = @ELEMENTARY_LIBS@
frame_la_LDFLAGS = -module -avoid-version
frame_la_LIBTOOLFLAGS = --tag=disable-static
frame_la_SOURCES = $(top_builddir)/elementary/elementary.frame.c

gengrid_la_LIBADD = @ELEMENTARY_LIBS@
gengrid_la_LDFLAGS = -module -avoid-version
gengrid_la_LIBTOOLFLAGS = --tag=disable-static
gengrid_la_SOURCES = $(top_builddir)/elementary/elementary.gengrid.c

genlist_la_LIBADD = @ELEMENTARY_LIBS@
genlist_la_LDFLAGS = -module -avoid-version
genlist_la_LIBTOOLFLAGS = --tag=disable-static
genlist_la_SOURCES = $(top_builddir)/elementary/elementary.genlist.c

gesture_layer_la_LIBADD = @ELEMENTARY_LIBS@
gesture_layer_la_LDFLAGS = -module -avoid-version
gesture_layer_la_LIBTOOLFLAGS = --tag=disable-static
gesture_layer_la_SOURCES = $(top_builddir)/elementary/elementary.gesture_layer.c

grid_la_LIBADD = @ELEMENTARY_LIBS@
grid_la_LDFLAGS = -module -avoid-version
grid_la_LIBTOOLFLAGS = --tag=disable-static
grid_la_SOURCES = $(top_builddir)/elementary/elementary.grid.c

hover_la_LIBADD = @ELEMENTARY_LIBS@
hover_la_LDFLAGS = -module -avoid-version
hover_la_LIBTOOLFLAGS = --tag=disable-static
hover_la_SOURCES = $(top_builddir)/elementary/elementary.hover.c

hoversel_la_LIBADD = @ELEMENTARY_LIBS@
hoversel_la_LDFLAGS = -module -avoid-version
hoversel_la_LIBTOOLFLAGS = --tag=disable-static
hoversel_la_SOURCES = $(top_builddir)/elementary/elementary.hoversel.c

icon_la_LIBADD = @ELEMENTARY_LIBS@
icon_la_LDFLAGS = -module -avoid-version
icon_la_LIBTOOLFLAGS = --tag=disable-static
icon_la_SOURCES = $(top_builddir)/elementary/elementary.icon.c

image_la_LIBADD = @ELEMENTARY_LIBS@
image_la_LDFLAGS = -module -avoid-version
image_la_LIBTOOLFLAGS = --tag=disable-static
image_la_SOURCES = $(top_builddir)/elementary/elementary.image.c

index_la_LIBADD = @ELEMENTARY_LIBS@
index_la_LDFLAGS = -module -avoid-version
index_la_LIBTOOLFLAGS = --tag=disable-static
index_la_SOURCES = $(top_builddir)/elementary/elementary.index.c

innerwindow_la_LIBADD = @ELEMENTARY_LIBS@
innerwindow_la_LDFLAGS = -module -avoid-version
innerwindow_la_LIBTOOLFLAGS = --tag=disable-static
innerwindow_la_SOURCES = $(top_builddir)/elementary/elementary.innerwindow.c

label_la_LIBADD = @ELEMENTARY_LIBS@
label_la_LDFLAGS = -module -avoid-version
label_la_LIBTOOLFLAGS = --tag=disable-static
label_la_SOURCES = $(top_builddir)/elementary/elementary.label.c

layout_la_LIBADD = @ELEMENTARY_LIBS@
layout_la_LDFLAGS = -module -avoid-version
layout_la_LIBTOOLFLAGS = --tag=disable-static
layout_la_SOURCES = $(top_builddir)/elementary/elementary.layout.c

layout_class_la_LIBADD = @ELEMENTARY_LIBS@
layout_class_la_LDFLAGS = -module -avoid-version
layout_class_la_LIBTOOLFLAGS = --tag=disable-static
layout_class_la_SOURCES = $(top_builddir)/elementary/elementary.layout_class.c

list_la_LIBADD = @ELEMENTARY_LIBS@
list_la_LDFLAGS = -module -avoid-version
list_la_LIBTOOLFLAGS = --tag=disable-static
list_la_SOURCES = $(top_builddir)/elementary/elementary.list.c

map_la_LIBADD = @ELEMENTARY_LIBS@
map_la_LDFLAGS = -module -avoid-version
map_la_LIBTOOLFLAGS = --tag=disable-static
map_la_SOURCES = $(top_builddir)/elementary/elementary.map.c

mapbuf_la_LIBADD = @ELEMENTARY_LIBS@
mapbuf_la_LDFLAGS = -module -avoid-version
mapbuf_la_LIBTOOLFLAGS = --tag=disable-static
mapbuf_la_SOURCES = $(top_builddir)/elementary/elementary.mapbuf.c

menu_la_LIBADD = @ELEMENTARY_LIBS@
menu_la_LDFLAGS = -module -avoid-version
menu_la_LIBTOOLFLAGS = --tag=disable-static
menu_la_SOURCES = $(top_builddir)/elementary/elementary.menu.c

multibuttonentry_la_LIBADD = @ELEMENTARY_LIBS@
multibuttonentry_la_LDFLAGS = -module -avoid-version
multibuttonentry_la_LIBTOOLFLAGS = --tag=disable-static
multibuttonentry_la_SOURCES = $(top_builddir)/elementary/elementary.multibuttonentry.c

naviframe_la_LIBADD = @ELEMENTARY_LIBS@
naviframe_la_LDFLAGS = -module -avoid-version
naviframe_la_LIBTOOLFLAGS = --tag=disable-static
naviframe_la_SOURCES = $(top_builddir)/elementary/elementary.naviframe.c

need_la_LIBADD = @ELEMENTARY_LIBS@
need_la_LDFLAGS = -module -avoid-version
need_la_LIBTOOLFLAGS = --tag=disable-static
need_la_SOURCES = $(top_builddir)/elementary/elementary.need.c

notify_la_LIBADD = @ELEMENTARY_LIBS@
notify_la_LDFLAGS = -module -avoid-version
notify_la_LIBTOOLFLAGS = --tag=disable-static
notify_la_SOURCES = $(top_builddir)/elementary/elementary.notify.c

object_la_LIBADD = @ELEMENTARY_LIBS@
object_la_LDFLAGS = -module -avoid-version
object_la_LIBTOOLFLAGS = --tag=disable-static
object_la_SOURCES = $(top_builddir)/elementary/elementary.object.c

object_item_la_LIBADD = @ELEMENTARY_LIBS@
object_item_la_LDFLAGS = -module -avoid-version
object_item_la_LIBTOOLFLAGS = --tag=disable-static
object_item_la_SOURCES = $(top_builddir)/elementary/elementary.object_item.c

panel_la_LIBADD = @ELEMENTARY_LIBS@
panel_la_LDFLAGS = -module -avoid-version
panel_la_LIBTOOLFLAGS = --tag=disable-static
panel_la_SOURCES = $(top_builddir)/elementary/elementary.panel.c

panes_la_LIBADD = @ELEMENTARY_LIBS@
panes_la_LDFLAGS = -module -avoid-version
panes_la_LIBTOOLFLAGS = --tag=disable-static
panes_la_SOURCES = $(top_builddir)/elementary/elementary.panes.c

photo_la_LIBADD = @ELEMENTARY_LIBS@
photo_la_LDFLAGS = -module -avoid-version
photo_la_LIBTOOLFLAGS = --tag=disable-static
photo_la_SOURCES = $(top_builddir)/elementary/elementary.photo.c

photocam_la_LIBADD = @ELEMENTARY_LIBS@
photocam_la_LDFLAGS = -module -avoid-version
photocam_la_LIBTOOLFLAGS = --tag=disable-static
photocam_la_SOURCES = $(top_builddir)/elementary/elementary.photocam.c

plug_la_LIBADD = @ELEMENTARY_LIBS@
plug_la_LDFLAGS = -module -avoid-version
plug_la_LIBTOOLFLAGS = --tag=disable-static
plug_la_SOURCES = $(top_builddir)/elementary/elementary.plug.c

popup_la_LIBADD = @ELEMENTARY_LIBS@
popup_la_LDFLAGS = -module -avoid-version
popup_la_LIBTOOLFLAGS = --tag=disable-static
popup_la_SOURCES = $(top_builddir)/elementary/elementary.popup.c

progressbar_la_LIBADD = @ELEMENTARY_LIBS@
progressbar_la_LDFLAGS = -module -avoid-version
progressbar_la_LIBTOOLFLAGS = --tag=disable-static
progressbar_la_SOURCES = $(top_builddir)/elementary/elementary.progressbar.c

radio_la_LIBADD = @ELEMENTARY_LIBS@
radio_la_LDFLAGS = -module -avoid-version
radio_la_LIBTOOLFLAGS = --tag=disable-static
radio_la_SOURCES = $(top_builddir)/elementary/elementary.radio.c

scroller_la_LIBADD = @ELEMENTARY_LIBS@
scroller_la_LDFLAGS = -module -avoid-version
scroller_la_LIBTOOLFLAGS = --tag=disable-static
scroller_la_SOURCES = $(top_builddir)/elementary/elementary.scroller.c

segment_control_la_LIBADD = @ELEMENTARY_LIBS@
segment_control_la_LDFLAGS = -module -avoid-version
segment_control_la_LIBTOOLFLAGS = --tag=disable-static
segment_control_la_SOURCES = $(top_builddir)/elementary/elementary.segment_control.c

separator_la_LIBADD = @ELEMENTARY_LIBS@
separator_la_LDFLAGS = -module -avoid-version
separator_la_LIBTOOLFLAGS = --tag=disable-static
separator_la_SOURCES = $(top_builddir)/elementary/elementary.separator.c

slider_la_LIBADD = @ELEMENTARY_LIBS@
slider_la_LDFLAGS = -module -avoid-version
slider_la_LIBTOOLFLAGS = --tag=disable-static
slider_la_SOURCES = $(top_builddir)/elementary/elementary.slider.c

slideshow_la_LIBADD = @ELEMENTARY_LIBS@
slideshow_la_LDFLAGS = -module -avoid-version
slideshow_la_LIBTOOLFLAGS = --tag=disable-static
slideshow_la_SOURCES = $(top_builddir)/elementary/elementary.slideshow.c

spinner_la_LIBADD = @ELEMENTARY_LIBS@
spinner_la_LDFLAGS = -module -avoid-version
spinner_la_LIBTOOLFLAGS = --tag=disable-static
spinner_la_SOURCES = $(top_builddir)/elementary/elementary.spinner.c

table_la_LIBADD = @ELEMENTARY_LIBS@
table_la_LDFLAGS = -module -avoid-version
table_la_LIBTOOLFLAGS = --tag=disable-static
table_la_SOURCES = $(top_builddir)/elementary/elementary.table.c

theme_la_LIBADD = @ELEMENTARY_LIBS@
theme_la_LDFLAGS = -module -avoid-version
theme_la_LIBTOOLFLAGS = --tag=disable-static
theme_la_SOURCES = $(top_builddir)/elementary/elementary.theme.c

thumb_la_LIBADD = @ELEMENTARY_LIBS@
thumb_la_LDFLAGS = -module -avoid-version
thumb_la_LIBTOOLFLAGS = --tag=disable-static
thumb_la_SOURCES = $(top_builddir)/elementary/elementary.thumb.c

toolbar_la_LIBADD = @ELEMENTARY_LIBS@
toolbar_la_LDFLAGS = -module -avoid-version
toolbar_la_LIBTOOLFLAGS = --tag=disable-static
toolbar_la_SOURCES = $(top_builddir)/elementary/elementary.toolbar.c

transit_la_LIBADD = @ELEMENTARY_LIBS@
transit_la_LDFLAGS = -module -avoid-version
transit_la_LIBTOOLFLAGS = --tag=disable-static
transit_la_SOURCES = $(top_builddir)/elementary/elementary.transit.c

video_la_LIBADD = @ELEMENTARY_LIBS@
video_la_LDFLAGS = -module -avoid-version
video_la_LIBTOOLFLAGS = --tag=disable-static
video_la_SOURCES = $(top_builddir)/elementary/elementary.video.c

web_la_LIBADD = @ELEMENTARY_LIBS@
web_la_LDFLAGS = -module -avoid-version
web_la_LIBTOOLFLAGS = --tag=disable-static
web_la_SOURCES = $(top_builddir)/elementary/elementary.web.c

window_la_LIBADD = @ELEMENTARY_LIBS@
window_la_LDFLAGS = -module -avoid-version
window_la_LIBTOOLFLAGS = --tag=disable-static
window_la_SOURCES = $(top_builddir)/elementary/elementary.window.c

pyelementarydir = $(pythondir)/elementary
pyelementary_PYTHON = elementary/__init__.py elementary/cursors.py


if WANT_EXAMPLES
examplesdir = $(pkgdatadir)/examples
examples_DATA = $(examples_files)

examplesimagesdir = $(examplesdir)/images
examplesimages_DATA = $(examples_images_files)
endif


.PHONY: doc doc-clean
if HAVE_EPYDOC
clean-local: doc-clean
doc-clean:
	rm -fr doc/api/html
doc: $(pyexecelementary_LTLIBRARIES) $(pyelementarydir_PYTHON)
	mkdir -p doc/api/html
	$(AM_V_GEN)PYTHONPATH="$$PWD:$$PWD/.libs:$$PYTHONPATH" \
		$(EPYDOC) --html -o doc/api/html \
			-n "@PACKAGE@ @VERSION@ API" \
			c_elementary
else
doc-clean:
	@echo "Install epydoc then run ./configure again"
doc:
	@echo "Install epydoc then run ./configure again"
endif
