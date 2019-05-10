import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Shapes 1.12
import QtQuick.Controls 2.5


Window {
    id: root
    visible: true
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
    title: qsTr("QWeatherApp")

    property variant cities : ["Liverpool", "Barcelona", "Kirsehir"]

    onCitiesChanged: {
        //weatherDataFirst.city = cities[0]
        //weatherDataSecond.city = cities[1]
        //weatherDataThird.city = cities[2]
    }

    property var weatherDataFirst: {
        'city': cities[0] ,
        'currentTemperature': "-" ,
        'minTemperature': "-" ,
        'maxTemperature': "-" ,
        'weatherDetails': "-"
    }

    property var weatherDataSecond: {
        'city': cities[1] ,
        'currentTemperature': "-" ,
        'minTemperature': "-" ,
        'maxTemperature': "-" ,
        'weatherDetails': "-"
    }

    property var weatherDataThird: {
        'city': cities[2] ,
        'currentTemperature': "-" ,
        'minTemperature': "-" ,
        'maxTemperature': "-" ,
        'weatherDetails': "-"
    }

    property color backgorundColor: "#81cdbb"
    property color canvas1Color: "#41656A"
    property color canvas2Color: "#3B5B5F"
    property color atmosphereColor: "#FFD063"

    Rectangle {
        id: background
        objectName: "backgroundObject"
        anchors.fill: parent
        color: backgorundColor

        signal dataReady

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

        SwipeView{
            id: view
            currentIndex: 0
            anchors.fill: parent

            onCurrentItemChanged: {
                console.log("currentIndex", currentIndex)
//                view.currentItem.city = "Liverpool"
//                view.currentItem.temperature = "25"
//                view.currentItem.degrees = "20° / 30°"
//                view.currentItem.sun = "gray"

                console.log(cities)
                console.log(weatherDataFirst.city)
                console.log(weatherDataSecond.city)
                console.log(weatherDataThird.city)
            }

            ViewItem{
                id: firstItem
                city: weatherDataFirst.city
                temperature: weatherDataFirst.currentTemperature
                degrees: weatherDataFirst.minTemperature + "° / " + weatherDataFirst.maxTemperature + "°"
                sun: atmosphereColor
            }

            ViewItem{
                id: secondItem
                city: weatherDataSecond.city
                temperature: weatherDataSecond.currentTemperature
                degrees: weatherDataSecond.minTemperature + "° / " + weatherDataSecond.maxTemperature + "°"
                sun: atmosphereColor
            }

            ViewItem{
                id: thirdItem
                city: weatherDataThird.city
                temperature: weatherDataThird.currentTemperature
                degrees: weatherDataThird.minTemperature + "° / " + weatherDataThird.maxTemperature + "°"
                sun: atmosphereColor
            }

        }

        PageIndicator{
            id: indicator
            count: view.count
            currentIndex: view.currentIndex
            anchors.bottom: background.bottom
            anchors.bottomMargin: parent.height * 0.05
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle{
            id:settingsWrapper
            anchors.right: parent.right
            anchors.rightMargin: parent.width * 0.05
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.025
            width: Math.min(parent.height, parent.width) * 0.06
            height: Math.min(parent.height, parent.width) * 0.06
            color: backgorundColor
            Image{
                id:settings
                source: "qrc:/icons/settings.svg"
                anchors.fill: parent
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        console.log("Clicked Settings")
                        settingsLoader.source = "SettingsPage.qml"
                        view.visible = false
                        indicator.visible = false
                        settingsWrapper.visible = false
                    }
                }
            }
        }

        onDataReady: {
            weatherDataFirst = WeatherCondition.getData()
        }

    }


    Loader{
        id:settingsLoader
        anchors.fill: parent
        focus: true
        onLoaded: {
            console.log("Settings Page Loaded")
        }
    }

    Component.onCompleted: {
        WeatherCondition.setCity(weatherDataFirst.city)
        WeatherCondition.takeWeatherForecastFromApiWithCityName()
    }

}
