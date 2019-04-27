import QtQuick 2.0


Rectangle{
    id:viewItem
    color: "transparent"

    property alias city : textCity.text
    property alias temperature : textTemperature.text
    property alias sun: atmosphere.color
    property alias degrees: minMaxDegree.text

    Text {
        id:textCity
        anchors.top: parent.top
        anchors.topMargin: parent.height * 0.1
        anchors.horizontalCenter: parent.horizontalCenter
        //text: cityName
        font.pixelSize: 40
        color: "#E8ECED"
    }

    Text {
        id:textTemperature
        anchors.top: parent.top
        anchors.topMargin: parent.height*0.2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: parent.width * 0.05 * -1
        //text: currentTemperature
        font.pixelSize: 80
        color: "#E8ECED"
    }

    Rectangle {
        id: atmosphere
        //color: atmosphereColor
        width: Math.min(parent.height, parent.width) * 0.09
        height: atmosphere.width
        radius: width/2
        anchors.left: textTemperature.right
        anchors.leftMargin: parent.width * 0.03
        anchors.top: parent.top
        anchors.topMargin: parent.height*0.235
    }

    Text {
        id: minMaxDegree
        color: "#E8ECED"
        //text: minTemperature+"° / " + maxTemperature + "°"
        font.pixelSize: 30
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: textTemperature.bottom
        anchors.topMargin: parent.height*0.03
    }


}






//    Rectangle{
//        id: choices
//        width: Math.min(parent.height, parent.width) * 0.1
//        height: choices.width * 0.2
//        color: "transparent"
//        anchors.bottom: background.bottom
//        anchors.bottomMargin: parent.height * 0.05
//        anchors.horizontalCenter: parent.horizontalCenter

//        Rectangle{
//            id: choice1
//            width: parent.width * 0.2
//            height: choice1.width
//            radius: choice1.width * 0.5
//            color: backgorundColor

//        }
//        Rectangle{
//            id: choice2
//            width: choice1.width
//            height: choice1.height
//            radius: width * 0.5
//            color: "lightgray"
//            anchors.left : choice1.right
//            anchors.leftMargin: choice1.width
//        }
//        Rectangle{
//            id: choice3
//            width: choice1.width
//            height: choice1.height
//            radius: width * 0.5
//            color: "lightgray"
//            anchors.left : choice2.right
//            anchors.leftMargin: choice2.width
//        }

//    }
