from evas.c_evas cimport Eina_Bool, Eina_List
from evas.c_evas cimport Evas_Object, const_Evas_Object, Evas_Coord
from object cimport Object

cdef extern from *:
    ctypedef char* const_char_ptr "const char *"

cdef extern from "Python.h":
    ctypedef struct PyTypeObject:
        PyTypeObject *ob_type

cdef extern from "Elementary.h":

    # Map                   (api:DONE  cb:DONE  doc:TODO  py3:TODO)
    ctypedef void *Elm_Map_Overlay
    ctypedef void *Elm_Map_Route
    ctypedef void *Elm_Map_Name
    ctypedef void (*Elm_Map_Overlay_Get_Cb)(void *data, Evas_Object *map, Elm_Map_Overlay *overlay)
    ctypedef void (*Elm_Map_Overlay_Del_Cb)(void *data, Evas_Object *map, Elm_Map_Overlay *overlay)
    ctypedef void (*Elm_Map_Route_Cb)(void *data, Evas_Object *map, Elm_Map_Route *route)
    ctypedef void (*Elm_Map_Name_Cb)(void *data, Evas_Object *map, Elm_Map_Name *name)

    ctypedef enum Elm_Map_Overlay_Type:
        ELM_MAP_OVERLAY_TYPE_NONE
        ELM_MAP_OVERLAY_TYPE_DEFAULT
        ELM_MAP_OVERLAY_TYPE_CLASS
        ELM_MAP_OVERLAY_TYPE_GROUP
        ELM_MAP_OVERLAY_TYPE_BUBBLE
        ELM_MAP_OVERLAY_TYPE_ROUTE
        ELM_MAP_OVERLAY_TYPE_LINE
        ELM_MAP_OVERLAY_TYPE_POLYGON
        ELM_MAP_OVERLAY_TYPE_CIRCLE
        ELM_MAP_OVERLAY_TYPE_SCALE

    ctypedef enum Elm_Map_Route_Method:
        ELM_MAP_ROUTE_METHOD_FASTEST
        ELM_MAP_ROUTE_METHOD_SHORTEST
        ELM_MAP_ROUTE_METHOD_LAST

    ctypedef enum Elm_Map_Route_Type:
        ELM_MAP_ROUTE_TYPE_MOTOCAR
        ELM_MAP_ROUTE_TYPE_BICYCLE
        ELM_MAP_ROUTE_TYPE_FOOT
        ELM_MAP_ROUTE_TYPE_LAST

    ctypedef enum Elm_Map_Source_Type:
        ELM_MAP_SOURCE_TYPE_TILE
        ELM_MAP_SOURCE_TYPE_ROUTE
        ELM_MAP_SOURCE_TYPE_NAME
        ELM_MAP_SOURCE_TYPE_LAST

    ctypedef enum Elm_Map_Zoom_Mode:
        ELM_MAP_ZOOM_MODE_MANUAL
        ELM_MAP_ZOOM_MODE_AUTO_FIT
        ELM_MAP_ZOOM_MODE_AUTO_FILL
        ELM_MAP_ZOOM_MODE_LAST

    Evas_Object             *elm_map_add(Evas_Object *parent)
    void                     elm_map_zoom_set(Evas_Object *obj, int zoom)
    int                      elm_map_zoom_get(const_Evas_Object *obj)
    void                     elm_map_zoom_mode_set(Evas_Object *obj, Elm_Map_Zoom_Mode mode)
    Elm_Map_Zoom_Mode        elm_map_zoom_mode_get(const_Evas_Object *obj)
    void                     elm_map_zoom_min_set(Evas_Object *obj, int zoom)
    int                      elm_map_zoom_min_get(const_Evas_Object *obj)
    void                     elm_map_zoom_max_set(Evas_Object *obj, int zoom)
    int                      elm_map_zoom_max_get(const_Evas_Object *obj)
    void                     elm_map_region_get(const_Evas_Object *obj, double *lon, double *lat)
    void                     elm_map_region_bring_in(Evas_Object *obj, double lon, double lat)
    void                     elm_map_region_show(Evas_Object *obj, double lon, double lat)
    void                     elm_map_canvas_to_region_convert(const_Evas_Object *obj, Evas_Coord x, Evas_Coord y, double *lon, double *lat)
    void                     elm_map_region_to_canvas_convert(const_Evas_Object *obj, double lon, double lat, Evas_Coord *x, Evas_Coord *y)
    void                     elm_map_paused_set(Evas_Object *obj, Eina_Bool paused)
    Eina_Bool                elm_map_paused_get(const_Evas_Object *obj)
    void                     elm_map_rotate_set(Evas_Object *obj, double degree, Evas_Coord cx, Evas_Coord cy)
    void                     elm_map_rotate_get(const_Evas_Object *obj, double *degree, Evas_Coord *cx, Evas_Coord *cy)
    void                     elm_map_wheel_disabled_set(Evas_Object *obj, Eina_Bool disabled)
    Eina_Bool                elm_map_wheel_disabled_get(const_Evas_Object *obj)
    void                     elm_map_user_agent_set(Evas_Object *obj, char *user_agent)
    char                    *elm_map_user_agent_get(const_Evas_Object *obj)
    Eina_List               *elm_map_overlays_get(Evas_Object *obj)
    Elm_Map_Overlay         *elm_map_overlay_add(Evas_Object *obj, double lon, double lat)
    void                     elm_map_overlay_del(Elm_Map_Overlay *overlay)
    Elm_Map_Overlay_Type     elm_map_overlay_type_get(Elm_Map_Overlay *overlay)
    void                     elm_map_overlay_data_set(Elm_Map_Overlay *overlay, void *data)
    void                    *elm_map_overlay_data_get(Elm_Map_Overlay *overlay)
    void                     elm_map_overlay_hide_set(Elm_Map_Overlay *overlay, Eina_Bool hide)
    Eina_Bool                elm_map_overlay_hide_get(Elm_Map_Overlay *overlay)
    void                     elm_map_overlay_displayed_zoom_min_set(Elm_Map_Overlay *overlay, int zoom)
    int                      elm_map_overlay_displayed_zoom_min_get(Elm_Map_Overlay *overlay)
    void                     elm_map_overlay_paused_set(Elm_Map_Overlay *overlay, Eina_Bool paused)
    Eina_Bool                elm_map_overlay_paused_get(Elm_Map_Overlay *overlay)
    Eina_Bool                elm_map_overlay_visible_get(Elm_Map_Overlay *overlay)
    void                     elm_map_overlay_content_set(Elm_Map_Overlay *overlay, Evas_Object *obj)
    const_Evas_Object       *elm_map_overlay_content_get(Elm_Map_Overlay *overlay)
    void                     elm_map_overlay_icon_set(Elm_Map_Overlay *overlay, Evas_Object *icon)
    const_Evas_Object       *elm_map_overlay_icon_get(Elm_Map_Overlay *overlay)
    void                     elm_map_overlay_region_set(Elm_Map_Overlay *overlay, double lon, double lat)
    void                     elm_map_overlay_region_get(Elm_Map_Overlay *overlay, double *lon, double *lat)
    void                     elm_map_overlay_color_set(Elm_Map_Overlay *overlay, int r, int g, int b, int a)
    void                     elm_map_overlay_color_get(Elm_Map_Overlay *overlay, int *r, int *g, int *b, int *a)
    void                     elm_map_overlay_show(Elm_Map_Overlay *overlay)
    void                     elm_map_overlay_get_cb_set(Elm_Map_Overlay *overlay, Elm_Map_Overlay_Get_Cb get_cb, void *data)
    void                     elm_map_overlay_del_cb_set(Elm_Map_Overlay *overlay, Elm_Map_Overlay_Del_Cb del_cb, void *data)
    void                     elm_map_overlays_show(Eina_List *overlays)
    Elm_Map_Overlay         *elm_map_overlay_class_add(Evas_Object *obj)
    void                     elm_map_overlay_class_append(Elm_Map_Overlay *clas, Elm_Map_Overlay *overlay)
    void                     elm_map_overlay_class_remove(Elm_Map_Overlay *clas, Elm_Map_Overlay *overlay)
    void                     elm_map_overlay_class_zoom_max_set(Elm_Map_Overlay *clas, int zoom)
    int                      elm_map_overlay_class_zoom_max_get(Elm_Map_Overlay *clas)
    Eina_List               *elm_map_overlay_group_members_get(Elm_Map_Overlay *grp) # group ??
    Elm_Map_Overlay         *elm_map_overlay_bubble_add(Evas_Object *obj)
    void                     elm_map_overlay_bubble_follow(Elm_Map_Overlay *bubble, Elm_Map_Overlay *parent)
    void                     elm_map_overlay_bubble_content_append(Elm_Map_Overlay *bubble, Evas_Object *content)
    void                     elm_map_overlay_bubble_content_clear(Elm_Map_Overlay *bubble)
    Elm_Map_Overlay         *elm_map_overlay_line_add(Evas_Object *obj, double flon, double flat, double tlon, double tlat)
    Elm_Map_Overlay         *elm_map_overlay_polygon_add(Evas_Object *obj)
    void                     elm_map_overlay_polygon_region_add(Elm_Map_Overlay *overlay, double lon, double lat)
    Elm_Map_Overlay         *elm_map_overlay_circle_add(Evas_Object *obj, double lon, double lat, double radius)
    Elm_Map_Overlay         *elm_map_overlay_scale_add(Evas_Object *obj, Evas_Coord x, Evas_Coord y)
    Elm_Map_Overlay         *elm_map_overlay_route_add(Evas_Object *obj, Elm_Map_Route *route)
    void                     elm_map_tile_load_status_get(const_Evas_Object *obj, int *try_num, int *finish_num)
    const_char_ptr          *elm_map_sources_get(const_Evas_Object *obj, Elm_Map_Source_Type type)
    void                     elm_map_source_set(Evas_Object *obj, Elm_Map_Source_Type type, const_char_ptr source_name)
    const_char_ptr           elm_map_source_get(const_Evas_Object *obj, Elm_Map_Source_Type type)
    Elm_Map_Route           *elm_map_route_add(Evas_Object *obj, Elm_Map_Route_Type type, Elm_Map_Route_Method method, double flon, double flat, double tlon, double tlat, Elm_Map_Route_Cb route_cb, void *data)
    void                     elm_map_route_del(Elm_Map_Route *route)
    double                   elm_map_route_distance_get(Elm_Map_Route *route)
    const_char_ptr           elm_map_route_node_get(Elm_Map_Route *route)
    const_char_ptr           elm_map_route_waypoint_get(Elm_Map_Route *route)
    Elm_Map_Name            *elm_map_name_add(const_Evas_Object *obj, const_char_ptr address, double lon, double lat, Elm_Map_Name_Cb name_cb, void *data)
    void                     elm_map_name_del(Elm_Map_Name *name)
    const_char_ptr           elm_map_name_address_get(Elm_Map_Name *name)
    void                     elm_map_name_region_get(Elm_Map_Name *name, double *lon, double *lat)

