from canvas cimport Evas
from general cimport Eina_Bool, Evas_Coord
from object cimport Evas_Object, const_Evas_Object, Object

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"
    ctypedef void const_void "const void"

cdef extern from "Evas.h":

    ctypedef enum Evas_Colorspace:
        EVAS_COLORSPACE_ARGB8888
        EVAS_COLORSPACE_YCBCR422P601_PL
        EVAS_COLORSPACE_YCBCR422P709_PL
        EVAS_COLORSPACE_RGB565_A5P

    ctypedef struct Evas_Native_Surface

    ####################################################################
    # Image Object (py3:TODO)
    #
    Evas_Object *evas_object_image_add(Evas *e)
    void evas_object_image_file_set(Evas_Object *obj, const_char_ptr file, const_char_ptr key)
    void evas_object_image_file_get(const_Evas_Object *obj, const_char_ptr *file, const_char_ptr *key)
    void evas_object_image_border_set(Evas_Object *obj, int l, int r, int t, int b)
    void evas_object_image_border_get(const_Evas_Object *obj, int *l, int *r, int *t, int *b)
    void evas_object_image_border_center_fill_set(Evas_Object *obj, Eina_Bool fill)
    Eina_Bool evas_object_image_border_center_fill_get(const_Evas_Object *obj)
    void evas_object_image_fill_set(Evas_Object *obj, Evas_Coord x, Evas_Coord y, Evas_Coord w, Evas_Coord h)
    void evas_object_image_fill_get(const_Evas_Object *obj, Evas_Coord *x, Evas_Coord *y, Evas_Coord *w, Evas_Coord *h)
    void evas_object_image_size_set(Evas_Object *obj, int w, int h)
    void evas_object_image_size_get(const_Evas_Object *obj, int *w, int *h)
    int evas_object_image_stride_get(const_Evas_Object *obj)
    int evas_object_image_load_error_get(const_Evas_Object *obj)
    void evas_object_image_data_set(Evas_Object *obj, void *data)
    void *evas_object_image_data_get(const_Evas_Object *obj, Eina_Bool for_writing)
    void evas_object_image_data_copy_set(Evas_Object *obj, void *data)
    void evas_object_image_data_update_add(Evas_Object *obj, int x, int y, int w, int h)
    void evas_object_image_alpha_set(Evas_Object *obj, Eina_Bool has_alpha)
    Eina_Bool evas_object_image_alpha_get(const_Evas_Object *obj)
    void evas_object_image_smooth_scale_set(Evas_Object *obj, Eina_Bool smooth_scale)
    Eina_Bool evas_object_image_smooth_scale_get(const_Evas_Object *obj)
    void evas_object_image_preload(Evas_Object *obj, Eina_Bool cancel)
    void evas_object_image_reload(Evas_Object *obj)
    Eina_Bool evas_object_image_save(const_Evas_Object *obj, const_char_ptr file, const_char_ptr key, const_char_ptr flags)
    #Eina_Bool evas_object_image_pixels_import(Evas_Object *obj, Evas_Pixel_Import_Source *pixels)
    void evas_object_image_pixels_get_callback_set(Evas_Object *obj, void (*func) (void *data, Evas_Object *o), void *data)
    void evas_object_image_pixels_dirty_set(Evas_Object *obj, Eina_Bool dirty)
    Eina_Bool evas_object_image_pixels_dirty_get(const_Evas_Object *obj)
    void evas_object_image_load_dpi_set(Evas_Object *obj, double dpi)
    double evas_object_image_load_dpi_get(const_Evas_Object *obj)
    void evas_object_image_load_size_set(Evas_Object *obj, int w, int h)
    void evas_object_image_load_size_get(const_Evas_Object *obj, int *w, int *h)
    void evas_object_image_load_scale_down_set(Evas_Object *obj, int scale_down)
    int evas_object_image_load_scale_down_get(const_Evas_Object *obj)
    void evas_object_image_colorspace_set(Evas_Object *obj, Evas_Colorspace cspace)
    Evas_Colorspace evas_object_image_colorspace_get(const_Evas_Object *obj)
    void evas_object_image_native_surface_set(Evas_Object *obj, Evas_Native_Surface *surf)
    Evas_Native_Surface *evas_object_image_native_surface_get(const_Evas_Object *obj)

cdef extern from "evas/evas_object_image_python_extras.h":
    ctypedef enum Evas_Object_Image_Rotation:
            ROTATE_NONE
            ROTATE_90
            ROTATE_180
            ROTATE_270

    int evas_object_image_mask_fill(Evas_Object *src, Evas_Object *mask, Evas_Object *surface, int x_mask, int y_mask, int x_surface, int y_surface)
    void evas_object_image_rotate(Evas_Object *image, Evas_Object_Image_Rotation rotation)

cdef class Image(Object):
    pass

cdef class FilledImage(Image):
    pass
