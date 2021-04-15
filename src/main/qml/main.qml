import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Window {
    id: mainWindow
    width: 520
    height: 100
    visible: true
    color: "#00000000"
    title: qsTr("PC Power Plug Reminder")
    flags: Qt.Window | Qt.FramelessWindowHint

    FontLoader {
        id: montserrate_regular
        name: "./fonts/Montserrat-Regular"
    }
    Rectangle {
        id: mainBackground
        color: "#202631"
        radius: 10
        border.color: "#00000000"
        anchors.fill: parent
        layer.textureSize.height: 1
        layer.samples: 16
        layer.mipmap: false
        layer.format: ShaderEffectSource.RGBA
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 10
        anchors.topMargin: 10

        DropShadow {
                id: rectShadow
                anchors.fill: mainBackground
                cached: true
                horizontalOffset: 0
                verticalOffset: 3
                radius: 15
                samples: 50
                color: "#4f000000"
                smooth: true
                source: mainBackground
            }

        Image {
            id: image
            x: 0
            y: 0
            width: 83
            height: 80
            source: "img/sun.svg"
            sourceSize.width: 83
            sourceSize.height: 80
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: date_display
            x: 89
            y: 47
            color: "#e6ffffff"
            text: qsTr("Monday April 12, 2021")
            anchors.bottom: parent.bottom
            font.pixelSize: 14
            anchors.bottomMargin: 16
            font.family: "Montserrat"
        }

        Text {
            id: time_display
            x: 107
            color: "#ffffff"
            text: qsTr("12:41 PM")
            anchors.top: parent.top
            font.pixelSize: 28
            anchors.topMargin: 13
            font.family: "Montserrat Medium"
        }

        Image {
            id: app_close_btn
            x: 281
            y: 8
            width: 20
            height: 20
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            source: "img/app close icon.svg"
            anchors.rightMargin: 20
            sourceSize.height: 20
            sourceSize.width: 20
            fillMode: Image.PreserveAspectFit

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: Qt.quit()
            }
        }

        Image {
            id: settings_btn
            x: 281
            y: 8
            width: 20
            height: 20
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: app_close_btn.left
            source: "img/Settings icon.svg"
            anchors.rightMargin: 20
            sourceSize.height: 20
            sourceSize.width: 20
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: battery_level_icon
            x: 274
            y: 13
            width: 12
            height: 22
            anchors.verticalCenter: battery_level_display_text.verticalCenter
            anchors.right: battery_level_display_text.left
            source: "img/Battery 90.svg"
            anchors.verticalCenterOffset: 2
            anchors.rightMargin: 10
            fillMode: Image.PreserveAspectFit
            sourceSize.width: 12
            sourceSize.height: 22
        }

        Text {
            id: battery_level_display_text
            x: 314
            color: "#ffffff"
            text: qsTr("100%")
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: settings_btn.left
            font.pixelSize: 28
            anchors.rightMargin: 40
            anchors.verticalCenterOffset: 1
            font.family: "Montserrat Medium"
        }

        Image {
            id: power_plug_indicator
            x: 283
            y: 16
            width: 16
            height: 17
            anchors.verticalCenter: battery_level_display_text.verticalCenter
            anchors.right: battery_level_icon.left
            source: "img/not charging icon.svg"
            anchors.verticalCenterOffset: 2
            fillMode: Image.PreserveAspectFit
            sourceSize.width: 16
            sourceSize.height: 17
            anchors.rightMargin: 5
        }
    }

    DragHandler {
        onActiveChanged: if (active) {
            mainWindow.startSystemMove()
        }
    }


}
