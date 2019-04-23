import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Shapes 1.12

Window {
    id: root
    visible: true
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
    title: qsTr("QWeatherApp")

    Rectangle{
        id: background
        anchors.fill: parent
        color: "#81cdd7"

        Text{
            id:text
            anchors.top: parent.top
            anchors.topMargin: parent.height*0.25
            anchors.horizontalCenter: parent.horizontalCenter
            text: "35°C"
            font.pixelSize: 60
            color: "white"
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
                ctx.strokeStyle = "#41656A"
                // setup the fill
                ctx.fillStyle = "#41656A"
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
                ctx.strokeStyle = "#3B5B5F"
                // setup the fill
                ctx.fillStyle = "#3B5B5F"
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
