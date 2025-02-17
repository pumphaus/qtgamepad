/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Gamepad module
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick
import QtQuick.Window
import QtGamepadLegacy

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Gamepad Mouse Item")

    Text {
        id: instructionLabel
        anchors.centerIn: parent
        text: qsTr("Simulate mouse input using a Gamepad")
    }
    Text {
        id: outputLabel
        anchors.horizontalCenter: instructionLabel.horizontalCenter
        anchors.top: instructionLabel.bottom
        text: ""
    }

    Connections {
        target: GamepadManager
        function onGamepadConnected(deviceId) { gamepad1.deviceId = deviceId }
    }

    Gamepad {
        id: gamepad1
        deviceId: GamepadManager.connectedGamepads.length > 0 ? GamepadManager.connectedGamepads[0] : -1

        onButtonAChanged: {
            if (value == true) {
                gamepadMouse.mouseButtonPressed(Qt.LeftButton);
                outputLabel.text = "Mouse click at: " + gamepadMouse.mousePosition.x + "," + gamepadMouse.mousePosition.y;
            } else {
                gamepadMouse.mouseButtonReleased(Qt.LeftButton);
                outputLabel.text = "";
            }
        }
    }

    GamepadMouseItem {
        id: gamepadMouse
        anchors.fill: parent
        gamepad: gamepad1
        active: true

        Rectangle {
            id: cursor
            width: 9
            height: 9
            radius: 4.5
            x: gamepadMouse.mousePosition.x
            y: gamepadMouse.mousePosition.y
            color: "transparent"
            border.color: "red"
            Rectangle {
                x: cursor.width * 0.5 - 0.5
                y: 1
                width: 1
                height: cursor.height - 2
                color: "black"
            }
            Rectangle {
                x: 1
                y: cursor.height * 0.5 - 0.5
                height: 1
                width: cursor.width - 2
                color: "black"
            }
        }
    }



    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log("clicked at: " + mouse.x + "," + mouse.y);
        }
    }
}
