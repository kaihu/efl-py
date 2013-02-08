cdef extern from "Evas.h":

    ctypedef int Evas_Callback_Type
    cdef int EVAS_CALLBACK_MOUSE_IN
    cdef int EVAS_CALLBACK_MOUSE_OUT
    cdef int EVAS_CALLBACK_MOUSE_DOWN
    cdef int EVAS_CALLBACK_MOUSE_UP
    cdef int EVAS_CALLBACK_MOUSE_MOVE
    cdef int EVAS_CALLBACK_MOUSE_WHEEL
    cdef int EVAS_CALLBACK_MULTI_DOWN
    cdef int EVAS_CALLBACK_MULTI_UP
    cdef int EVAS_CALLBACK_MULTI_MOVE
    cdef int EVAS_CALLBACK_FREE
    cdef int EVAS_CALLBACK_KEY_DOWN
    cdef int EVAS_CALLBACK_KEY_UP
    cdef int EVAS_CALLBACK_FOCUS_IN
    cdef int EVAS_CALLBACK_FOCUS_OUT
    cdef int EVAS_CALLBACK_SHOW
    cdef int EVAS_CALLBACK_HIDE
    cdef int EVAS_CALLBACK_MOVE
    cdef int EVAS_CALLBACK_RESIZE
    cdef int EVAS_CALLBACK_RESTACK
    cdef int EVAS_CALLBACK_DEL
    cdef int EVAS_CALLBACK_HOLD
    cdef int EVAS_CALLBACK_CHANGED_SIZE_HINTS
    cdef int EVAS_CALLBACK_IMAGE_PRELOADED
    cdef int EVAS_CALLBACK_CANVAS_FOCUS_IN
    cdef int EVAS_CALLBACK_CANVAS_FOCUS_OUT
    cdef int EVAS_CALLBACK_RENDER_FLUSH_PRE
    cdef int EVAS_CALLBACK_RENDER_FLUSH_POST
    cdef int EVAS_CALLBACK_CANVAS_OBJECT_FOCUS_IN
    cdef int EVAS_CALLBACK_CANVAS_OBJECT_FOCUS_OUT
    cdef int EVAS_CALLBACK_IMAGE_UNLOADED
    cdef int EVAS_CALLBACK_RENDER_PRE
    cdef int EVAS_CALLBACK_RENDER_POST
    cdef int EVAS_CALLBACK_IMAGE_RESIZE
    cdef int EVAS_CALLBACK_DEVICE_CHANGED
    cdef int EVAS_CALLBACK_LAST

