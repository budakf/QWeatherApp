import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Shapes 1.12
import QtQuick.Controls 2.5

Rectangle {
    id:settingsItem
    color: "transparent"

    Rectangle{
        id: returnMainPage
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.05
        anchors.top: parent.top
        anchors.topMargin: parent.height * 0.025
        width: Math.min(parent.height, parent.width) * 0.065
        height: Math.min(parent.height, parent.width) * 0.065
        color: backgorundColor

        MouseArea{
            anchors.fill: parent
            onClicked: {
                console.log("Clicked Return Main Page", width, height)
                view.visible = true
                indicator.visible = true
                settingsLoader.source = ""
                settingsWrapper.visible = true
            }
        }

        Canvas {
            id: canvasForLeftArrow
            // canvas size
            width: parent.width; height: parent.height
            // handler to override for drawing
            onPaint: {
                // get context to draw with
                var ctx = getContext("2d")
                // setup the stroke
                ctx.lineWidth = 4
                ctx.strokeStyle = parent.color
                // setup the fill
                ctx.fillStyle = "#E8ECED"  // #41656A
                // begin a new path to draw
                ctx.beginPath()
                ctx.moveTo(0, parent.height * 0.5)
                ctx.lineTo(parent.width, 0)
                ctx.lineTo(parent.width, parent.height)
                ctx.lineTo(0, parent.height * 0.5)
                ctx.closePath()
                ctx.fill()
                ctx.stroke()
            }
        }

    }

    Rectangle{
        id: choiceScreenWrapper
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: parent.height * 0.04 * -1.0
        width: Math.min(parent.height, parent.width) * 0.6
        height: Math.min(parent.height, parent.width) * 0.6
        color: "transparent"

        property variant cityNames : ["Liverpool", "Barcelona", "Kirsehir", "Istanbul", "Ankara", "İzmir"]

        ComboBox{
            id: firstChoice
            width: parent.width
            anchors.top: parent.top
            model:  parent.cityNames
            background: Rectangle{
                width: parent.width; height: parent.height
                border.color: "#41656A"
                border.width: 2
                color: backgorundColor
            }

        }

        ComboBox{
            id: secondChoice
            width: parent.width
            anchors.top: firstChoice.bottom
            anchors.topMargin: parent.height * 0.05
            model: parent.cityNames
            currentIndex:1
            background: Rectangle{
                width: parent.width; height: parent.height
                border.color: "#41656A"
                border.width: 2
                color: backgorundColor
            }

        }

        ComboBox{
            id: thirdChoice
            width: parent.width
            anchors.top: secondChoice.bottom
            anchors.topMargin: parent.height * 0.05
            model: parent.cityNames
            currentIndex:2
            background: Rectangle{
                width: parent.width; height: parent.height
                border.color: "#41656A"
                border.width: 2
                color: backgorundColor
            }
        }

        Rectangle{
            id: submitButton
            width: parent.width * 0.5
            height: parent.height * 0.18
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height * 0.25
            color:"#41656A"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    console.log("Clicked Save Button")
                    cities[0] = firstChoice.currentText
                    cities[1] = secondChoice.currentText
                    cities[2] = thirdChoice.currentText
                    console.log(cities[0])
                    console.log(cities[1])
                    console.log(cities[2])
                    citiesChanged()
                }
            }
            Text {
                id: text
                anchors.centerIn: parent
                text: qsTr("Save Cities")
                color: "#81cdbb"
            }
        }

    }

}
