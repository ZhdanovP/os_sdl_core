import QtQuick 2.0

Item {
    anchors.fill: parent

    ListView {
        id: applicationListView
        model: ApplicationListModel {}

        anchors.horizontalCenter: parent.horizontalCenter
        //y: searchDeviceText.height
        width:parent.width
        height:parent.height


        //highlightFollowsCurrentItem: false
        //flickableDirection: Flickable.AutoFlickDirection
        //interactive: true

        //highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
        //focus: true


        delegate: Item{
            width: parent.width
            height: sdlIcon.height
            Image { id:sdlIcon;source: icon}
            Text  {
                x: sdlIcon.width
                text: name
                color: "#1d81d5"
                font.pixelSize: 40
                MouseArea {
                  anchors.fill: parent
                  onClicked: {
                      menuContainer.go("SDLPlayerView.qml")
                    }
                }
            }
        }

    }

    Text{
        id: backtext
        anchors.horizontalCenter: parent.horizontalCenter
        y: applicationListView.height
        text: "Back"
        color: "#1d81d5"
        font.pixelSize: 30
        Image{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: backtext.verticalCenter
            source: "res/buttons/long_oval_btn.png"
        }
        MouseArea {
          anchors.fill: parent
          onClicked: {
              menuContainer.back()
            }
        }
    }
}
