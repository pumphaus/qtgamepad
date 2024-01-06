# Qt Gamepad Legacy

A Qt 6 module that adds support for getting events from gamepad devices on multiple platforms.

This is Qt5's QtGamepad module ported to Qt6. I don't intend to develop it further; I'll just try to
keep compatibility with upcoming Qt releases.

I've tested the `evdev` and `android` plugin which works fine.

Supported Platforms:
Native Backends
 - Linux (evdev)
 - Window (xinput)
 - Android
 - OS X/iOS/tvOS

For other platforms there is a backend that uses SDL2 for gamepad support.

This module provides classes that can:
 - Read input events from game controllers (Button and Axis events), both from C++ and Qt Quick (QML)
 - Provide a queryable input state (by processing events)
 - Provide key bindings
