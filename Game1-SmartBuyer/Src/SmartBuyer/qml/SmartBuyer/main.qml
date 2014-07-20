import QtQuick 1.0

Rectangle
{
    width : 800
    height: 600

    Image
    {
        width: 800
        height: 600
        z: 5
        source: "./Home.png"
        smooth: true

        Behavior on opacity { NumberAnimation { duration : 500 } }

        MouseArea
        {
            anchors.fill: parent
            onClicked: parent.opacity = 0
            enabled: parent.opacity
        }
    }

    Rectangle
    {
        id: leftBG
        x: 10
        y: 54
        width: 538
        height: 524
        color: "#e6e6e6"
    }

    Text
    {
        x: 50
        y: 10
        text: qsTr("Home Appliances and consumption")
        font.pixelSize: 25
        color: "#92d050"
    }

    Grid
    {
        x: 15
        y: 60
        columns: 4
        spacing: 10

        property int imageWidth  : 120
        property int imageHeight : 120

        Repeater
        {
            id: repeat
            model : 16

            function itemPressed( index, selectionStatus, name, power, source )
            {
                if( true == selectionStatus )
                {
                    bucketModel.insert(0, {"name": name, "power": power , "imageSource": source, "uniqueId" : index })
                }

                else
                {
                    for( var i = 0 ; i < bucketModel.count ; ++ i )
                    {
                        if ( index == bucketModel.get(i).uniqueId )
                            bucketModel.remove( i )
                    }
                }

                var totalPower = 0 ;
                for( var i = 0 ; i < bucketModel.count ; ++ i )
                {
                    console.log("\ntwice " + bucketModel.get(i).power)
                    totalPower += bucketModel.get(i).power  ;
                }

                totalPowerConsumedText.text = ""
                totalPowerConsumedText.text = totalPower + " Watts"
            }

            Image
            {
                function getName(index)
                {
                         if ( index == 0 )
                             return "Blender"
                         else if ( index == 1 )
                             return "Bulb"
                         else if ( index == 2 )
                             return "CFL"
                         else if ( index == 3 )
                             return "Coffe Maker"
                         else if ( index == 4 )
                             return "Computer"
                         else if ( index == 5 )
                             return "Dryer"
                         else if ( index == 6 )
                             return "Iron"
                         else if ( index == 7 )
                             return "Lamp"
                         else if ( index == 8 )
                             return "Laptop"
                         else if ( index == 9 )
                             return "Microwave"
                         else if ( index == 10 )
                             return "Music System"
                         else if ( index == 11 )
                             return "Projector"
                         else if ( index == 12 )
                             return "Refrigerator"
                         else if ( index == 13 )
                             return "Table Fan"
                         else if ( index == 14 )
                             return "TV"
                         else if ( index == 15 )
                             return "Washing Machine"

                }

                function getPower(index)
                {
                      if ( index == 0 )
                          return 300
                      else if ( index == 1 )
                          return 100
                      else if ( index == 2 )
                          return 20
                      else if ( index == 3 )
                          return 1500
                      else if ( index == 4 )
                          return 120
                      else if ( index == 5 )
                          return 1500
                      else if ( index == 6 )
                          return 1100
                      else if ( index == 7 )
                          return 100
                      else if ( index == 8 )
                          return 100
                      else if ( index == 9 )
                          return 1200
                      else if ( index == 10 )
                          return 50
                      else if ( index == 11 )
                          return 300
                      else if ( index == 12 )
                          return 540
                      else if ( index == 13 )
                          return 25
                      else if ( index == 14 )
                          return 60
                      else if ( index == 15 )
                          return 450
                }

                function getSource(index)
                {
                          if ( index == 0 )
                              return "Blender.png"
                          else if ( index == 1 )
                              return "Bulb.png"
                          else if ( index == 2 )
                              return "CFL.png"
                          else if ( index == 3 )
                              return "CoffeMaker.png"
                          else if ( index == 4 )
                              return "Computer.png"
                          else if ( index == 5 )
                              return "Dryer.png"
                          else if ( index == 6 )
                              return "Iron.png"
                          else if ( index == 7 )
                              return "Lamp.png"
                          else if ( index == 8 )
                              return "Laptop.png"
                          else if ( index == 9 )
                              return "Microwave.png"
                          else if ( index == 10 )
                              return "MusicSystem.png"
                          else if ( index == 11 )
                              return "Projector.png"
                          else if ( index == 12 )
                              return "Refrigerator.png"
                          else if ( index == 13 )
                              return "TableFan.png"
                          else if ( index == 14 )
                              return "TV.png"
                          else if ( index == 15 )
                              return "WashingMachine.png"

                }

                function getDummySource(index)
                {
                      if ( index == 0 )
                          return "Blender.png"
                      else if ( index == 1 )
                          return "Bulb.png"
                      else if ( index == 2 )
                          return "CFL.png"
                      else if ( index == 3 )
                          return "CoffeMaker.png"
                      else if ( index == 4 )
                          return "Computer.png"
                      else if ( index == 5 )
                          return "Dryer.png"
                      else if ( index == 6 )
                          return "Iron.png"
                      else if ( index == 7 )
                          return "Lamp.png"
                      else if ( index == 8 )
                          return "Laptop.png"
                      else if ( index == 9 )
                          return "Microwave.png"
                      else if ( index == 10 )
                          return "MusicSystem.png"
                      else if ( index == 11 )
                          return "Projector.png"
                      else if ( index == 12 )
                          return "Refrigerator.png"
                      else if ( index == 13 )
                          return "TableFan.png"
                      else if ( index == 14 )
                          return "TV.png"
                      else if ( index == 15 )
                          return "WashingMachine.png"
                }

                property bool isSelected : false
                property string name : getName(index)
                property int power   : getPower(index)

                sourceSize.width: parent.imageWidth; sourceSize.height: parent.imageHeight ;
                smooth: true
                source: getSource(index)
                property string dummySource: getDummySource(index)
                MouseArea
                {
                    anchors.fill: parent
                    onClicked:
                    {
                               if( true == parent.isSelected )
                               {
                                    selectionHighlight.opacity = 0
                                    parent.isSelected = false
                               }
                               else
                               {
                                   selectionHighlight.opacity = .75
                                   parent.isSelected = true
                               }
                               repeat.itemPressed(index, parent.isSelected, parent.name, parent.power, parent.dummySource )
                    }
                }

                Rectangle
                {
                    id: selectionHighlight
                    anchors.fill: parent
                    z: parent.z - 1
                    opacity: 0
                    color: "#92d050"
                }
            }
        }
    }

    Rectangle
    {
        id: rightBG
        x: 560
        y: 54
        width: 228
        height: 524
        color: "#e6e6e6"

        Text
        {
             text: qsTr("No items selected yet")
             font.pixelSize: 20
             anchors.centerIn: parent
             opacity: 0 == bucketModel.count ? 1 : 0
        }

        Text {
            x: 25
            y: 7
            width: 162
            height: 17
            text: qsTr("Shopping Basket")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            font.bold: true
        }

        Rectangle
        {
            color: "#92d050"
            width: 170
            height: 35
            anchors{ bottom: parent.bottom; bottomMargin: 35; left:parent.left ; leftMargin: 20 }
        }

        Text
        {
            id: totalPowerBanner
            text: "Total Power"
            anchors{ bottom: parent.bottom; bottomMargin: 35; left:parent.left ; leftMargin: 45 }
            font.pixelSize: 22
            color:"black"
        }

        Text
        {
            id: totalPowerConsumedText
            text: "0 Watts"
            anchors.horizontalCenter: totalPowerBanner.horizontalCenter
            anchors.top: totalPowerBanner.bottom
            anchors.topMargin: 5
            font.pixelSize: 20
            font.bold: true
            color:"grey"
        }



        ListView {
            id: view_right
            x: 9
            y: 44
            width: 211
            height: 400
            clip: true            
            spacing: 20

//            add: Transition
//            {
//                 NumberAnimation { properties: "opacity"; from: 0; duration: 1; }
//            }


//            displaced: Transition
//            {
//                NumberAnimation { properties: "x,y"; duration: 300 }
//            }

            model: ListModel
            {
                id: bucketModel
//                ListElement
//                {
//                    name: "Fridge"
//                    power: 10
//                    imageSource: "Fridge.png"
//                    uniqueId: 0
//                }

            }
            delegate:

                Rectangle
                {
                    x: -3
                    width: 220
                    height: 120
                    color:"lightgrey"
                    Behavior on y { NumberAnimation {duration:  300} }

                    Text
                    {
                        x: 10
                        y: 85
                        z: 2
                        text: power + " Watt"
                        font.pixelSize: 25
                        color: "black"
                    }

                    Text
                    {
                        x: 10
                        y: 50
                        z: 2
                        text: "I consume"
                        font.pixelSize: 22
                        color: "#6d6c6c"
                    }

                    Rectangle
                    {
                        anchors{ left: parent.left ; right: parent.right; top: parent.top; bottom: parent.bottom ; bottomMargin: 80 }
                        color: "#92d050"

                        Text
                        {
                            anchors.centerIn: parent
                            text: "I am " + name
                            font.pixelSize: if( text == "I am Washing Machine" )
                                            {17 } else { 20 }
                            color: "black"
                            z: 2
                        }
                    }

                    Image
                    {
                        anchors { bottom: parent.bottom; right: parent.right; rightMargin: 5 ; bottomMargin: 5 }
                        sourceSize.width:  70
                        sourceSize.height: 70
                        source: imageSource
                    }
                }
            }
        }
    }
