# Generated from gamepad.pro.

#####################################################################
## declarative_gamepad Plugin:
#####################################################################

qt_internal_add_qml_module(GamepadLegacyQuickPrivate
    URI "QtGamepadLegacy"
    VERSION "${PROJECT_VERSION}"
    CLASS_NAME QGamepadModule
    SOURCES
        qgamepadmouseitem.cpp qgamepadmouseitem.h
        qtgamepadquicktypes_p.h
    NO_PLUGIN_OPTIONAL
    DEPENDENCIES QtQuick
    INTERNAL_MODULE
    PUBLIC_LIBRARIES
        Qt::Core
        Qt::GamepadLegacy
        Qt::Gui
        Qt::Qml
        Qt::Quick
)

#### Keys ignored in scope 13:.:.:gamepad.pro:<TRUE>:
# CXX_MODULE = "gamepad"
# IMPORT_VERSION = "1.$$QT_MINOR_VERSION"
# OTHER_FILES = "qmldir"
# TARGETPATH = "QtGamepad"
