# Generated from gamepad.pro.

#####################################################################
## Gamepad Module:
#####################################################################

qt_internal_add_module(GamepadLegacy
    NO_GENERATE_METATYPES
    PLUGIN_TYPES legacygamepads
    SOURCES
        qgamepad.cpp qgamepad.h
        qgamepadbackend.cpp qgamepadbackend_p.h
        qgamepadbackendfactory.cpp qgamepadbackendfactory_p.h
        qgamepadbackendplugin.cpp qgamepadbackendplugin_p.h
        qgamepadkeynavigation.cpp qgamepadkeynavigation.h
        qgamepadmanager.cpp qgamepadmanager.h
        qtgamepadglobal.h
    DEFINES
        QT_BUILD_GAMEPAD_LIB
    LIBRARIES
        Qt::CorePrivate
    PUBLIC_LIBRARIES
        Qt::Core
        Qt::Gui
    PRIVATE_MODULE_INTERFACE
        Qt::CorePrivate
)

if(ANDROID)
    set_property(TARGET GamepadLegacy APPEND PROPERTY QT_ANDROID_BUNDLED_JAR_DEPENDENCIES
        jar/QtAndroidGamepad.jar
    )
    set_property(TARGET GamepadLegacy APPEND PROPERTY QT_ANDROID_LIB_DEPENDENCIES
        plugins/legacygamepads/libplugins_legacygamepads_androidgamepad.so
    )
endif()

#### Keys ignored in scope 12:.:.:gamepad.pro:<TRUE>:
# ANDROID_FEATURES = "android.hardware.gamepad"
qt_internal_add_docs(GamepadLegacy
    doc/qtgamepad.qdocconf
)

