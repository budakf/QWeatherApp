import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Shapes 1.12

Window {
    id: root
    visible: true
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
    title: qsTr("QWeatherApp")

    property string currentTemperature : "35"
    property string minTemperature : "30"
    property string maxTemperature : "40"

    property color backgorundColor: "#81cdd7"
    property color canvas1Color: "#41656A"
    property color canvas2Color: "#3B5B5F"
    property color atmosphereColor: "#FFD063"

    Rectangle {
        id: background
        anchors.fill: parent
        color: backgorundColor

        Text {
            id:text
            anchors.top: parent.top
            anchors.topMargin: parent.height*0.2
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: parent.width * 0.05 * -1
            text: currentTemperature
            font.pixelSize: 80
            color: "white"
            //°C
        }

        Rectangle {
            id: atmosphere
            color: atmosphereColor
            width: Math.min(parent.height, parent.width) * 0.09
            height: atmosphere.width
            radius: width/2
            anchors.left: text.right
            anchors.leftMargin: parent.width * 0.03
            anchors.top: parent.top
            anchors.topMargin: parent.height*0.235
        }

        Text {
            id: minMaxDegree
            color: "white"
            text: minTemperature+"° / " + maxTemperature + "°"
            font.pixelSize: 30
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: text.bottom
            anchors.topMargin: parent.height*0.03
        }

        Canvas {
            id: canvas
            // canvas size
            width: parent.width; height: parent.height
            // handler to override for drawing
            onPaint: {
                // get context to draw with
                var ctx = getContext("2d")
                // setup the stroke
                ctx.lineWidth = 4
                ctx.strokeStyle = canvas1Color
                // setup the fill
                ctx.fillStyle = canvas1Color
                // begin a new path to draw
                ctx.beginPath()
                // top-left start point
                ctx.moveTo(0, parent.height*0.6)
                ctx.lineTo(parent.width, parent.height*0.8)
                ctx.lineTo(parent.width, parent.height)
                ctx.lineTo(0, parent.height)
                ctx.closePath()
                ctx.fill()
                ctx.stroke()
            }
        }

        Canvas {
            id: canvas2
            // canvas size
            width: parent.width; height: parent.height
            // handler to override for drawing
            onPaint: {
                // get context to draw with
                var ctx = getContext("2d")
                // setup the stroke
                ctx.lineWidth = 1
                ctx.strokeStyle = canvas2Color
                // setup the fill
                ctx.fillStyle = canvas2Color
                // begin a new path to draw
                ctx.beginPath()
                // top-left start point
                ctx.moveTo(parent.width, parent.height*0.6)
                ctx.lineTo(parent.width*0.5, parent.height*0.7)
                ctx.lineTo(parent.width, parent.height*0.8)
                ctx.closePath()
                ctx.fill()
                ctx.stroke()
            }
        }

    }

}
