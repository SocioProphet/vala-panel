set(ENUM_FILES
        panel-platform.h
        settings-manager.c
        )
add_glib_enumtypes(ENUMSC ENUMSH vala-panel-enums ${ENUM_FILES})
set(LIBVALAPANEL_HEADERS
    client.h
    server.h
    definitions.h
    applet-widget-api.h
    applet-widget.h
    settings-manager.h
    panel-platform.h
    toplevel.h
    toplevel-config.h
    applet-info.h
    panel-layout.h
    ${ENUMSH})
set(LIBVALAPANEL_C_SOURCES
    toplevel-config.c
    settings-manager.c
    panel-platform.c
    applet-widget.c
    toplevel.c
    applet-info.c
    applet-manager.c
    panel-layout.c
    ${ENUMSC})

glib_compile_resources(GLIB_RESOURCES_LIB
    source
        libvalapanel.gresource.xml
)

#####
# Core Library
#####

# Build library for plugins and application
add_custom_target(vala-ide-lib SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/${APPNAME}.vapi)
add_library (${LIBNAME} SHARED
    ${LIBVALAPANEL_C_SOURCES}
    ${LIBVALAPANEL_HEADERS}
    ${GLIB_RESOURCES_LIB}
    definitions.h
    private.h
    applet-manager.h
)

target_link_libraries (${LIBNAME} util-gtk)
target_include_directories(${LIBNAME} PRIVATE ${CMAKE_SOURCE_DIR} ${CMAKE_BINARY_DIR} ${CMAKE_SOURCE_DIR}/util; ${CMAKE_SOURCE_DIR}/ui ${CMAKE_SOURCE_DIR}/util/gtk ${CMAKE_BINARY_DIR}/ui)

set_target_properties (${LIBNAME} PROPERTIES
    VERSION ${VERSION}
    SOVERSION ${SOVERSION})

install (TARGETS ${LIBNAME} DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT bin)

# Install lib stuffs
install (FILES ${CMAKE_BINARY_DIR}/${APPNAME}.pc DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig/ COMPONENT dev)
install (FILES ${CMAKE_CURRENT_SOURCE_DIR}/${APPNAME}.vapi DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/vala/vapi/ COMPONENT dev)
install (FILES ${CMAKE_CURRENT_SOURCE_DIR}/${APPNAME}.deps DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/vala/vapi/ COMPONENT dev)
install (FILES ${LIBVALAPANEL_HEADERS} DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/vala-panel/ COMPONENT dev)

add_feature_info(Toplevel ON "ValaPanel applets and panels framework")
