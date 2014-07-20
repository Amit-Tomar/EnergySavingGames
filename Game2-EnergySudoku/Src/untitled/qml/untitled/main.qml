import QtQuick 1.0
import "componentCreation.js" as MyScript

Rectangle
{
    id: topParent
    width : 900
    height: 700
    color : "grey"

    property int level  : 0
    property int currentSelected  : 0

    property variant dummy: MyScript

    function autoClick()
    {
        view.scale = .1
        view.opacity = 0 ;
        MyScript.sudokuUI.opacity  = 1
        MyScript.sudokuUI.setText( currentSelected, 1 )
        MyScript.sudokuProblem[Math.floor(currentSelected/9)][currentSelected%9] = 1
    }

    function printSudoku()
    {
        for( var i = 0; i < 8 ; ++i )
        {
            for( var j = 0; j < 8 ; ++j )
                console.debug(sudokuProblem[i][j] + " "  )

            console.log( "\n"  )
        }
    }

    function exchangeRows(row1,row2)
    {
        var tempRow = new Array(9)

        for( var i = 0 ; i <= 8 ; ++ i )
            tempRow[i] =MyScript.sudokuProblem[row1][i]

        for( i = 0 ; i <= 8 ; ++ i )
           MyScript.sudokuProblem[row1][i] =MyScript.sudokuProblem[row2][i]

        for( i = 0 ; i <= 8 ; ++ i )
           MyScript.sudokuProblem[row2][i] = tempRow[i]
    }

    function exchangeColumns(column1,column2)
    {
        var tempColumn = new Array(9)

        for( var i = 0 ; i <= 8 ; ++ i )
            tempColumn[i] =MyScript.sudokuProblem[i][column1]

        for( i = 0 ; i <= 8 ; ++ i )
           MyScript.sudokuProblem[i][column1] =MyScript.sudokuProblem[i][column2]

        for( i = 0 ; i <= 8 ; ++ i )
           MyScript.sudokuProblem[i][column2] = tempColumn[i]
    }

     function createSudokuProblem()
     {
     }

     Rectangle
     {
        id: errorRectangleRow
        y: 10
        color: "red"
        opacity: 0
        radius: 15
        width: parent.width * .8
        height: parent.height * .1
     }

     GridView
     {
         id: view
         width: 300; height: width
         x: 1500
         opacity: 0
         z: 10
         snapMode: ListView.SnapToItem
         boundsBehavior: Flickable.StopAtBounds
         clip: true
         scale: .1

         Behavior on scale { NumberAnimation { duration: 350 } }
         Behavior on opacity { NumberAnimation { duration: 350 } }

         onOpacityChanged: opacity == 0 ? view.x = topParent.x + topParent.width : {}

         model: numberModel
         delegate: Image
         {
             width : topParent.width / 12
             height: topParent.width / 12
             source: mouse.pressed ? "./button_pressed.png" : "./button.png"
             //Text { text: qsTr(name) ; font.pixelSize: 25 ; color: "red"; anchors.centerIn: parent}

             Image
             {
                 source: index+1 + ".png"
                 smooth: true
                 scale: .9
                 anchors.fill: parent
             }

             MouseArea
             {
                 id: mouse
                 anchors.fill: parent
                 enabled: parent.opacity
                 onClicked:
                 {
                     view.scale = .1
                     view.opacity = 0 ;
                     MyScript.sudokuUI.opacity  = 1
                     MyScript.sudokuUI.setText( currentSelected, index+1 )
                     MyScript.sudokuProblem[Math.floor(currentSelected/9)][currentSelected%9] = index + 1

                     console.log( "^^^^^^^[" + Math.floor(currentSelected/9) + "] [" + currentSelected%9 + " ]" + MyScript.sudokuProblem[Math.floor(currentSelected/9)][currentSelected%9] + " = " + index )
                 }
             }
         }

         ListModel
         {
            id : numberModel
            ListElement { name: "1" }
            ListElement { name: "2" }
            ListElement { name: "3" }
            ListElement { name: "4" }
            ListElement { name: "5" }
            ListElement { name: "6" }
            ListElement { name: "7" }
            ListElement { name: "8" }
            ListElement { name: "9" }
         }
     }

    Image
    {
        source: mouseSolve.pressed ? "./button_pressed.png" : "./button.png"

        width: 120
        anchors {right: parent.right ; rightMargin: 10 ; topMargin: 70 ; top: parent.top }

        Text
        {
            text: qsTr("Solve")
            anchors.centerIn: parent
            font.pixelSize: 25
        }

        MouseArea
        {
            id: mouseSolve
            anchors.fill: parent
            onClicked:
            {
                autoClick()
                MyScript.sudokuUI.solveSudoku()
                resetButton.opacity = 1
                errorMessage.text="Congrats!!!\n   Solved.."
            }
        }
    }



    Image
    {
        source: mouseCheck.pressed ? "./button_pressed.png" : "./button.png"

        width: 120
        anchors {right: parent.right ; rightMargin: 10 ; topMargin: 140 ; top: parent.top }

        Text
        {
            text: qsTr("Check")
            anchors.centerIn: parent
            font.pixelSize: 25
        }

        MouseArea
        {
            id: mouseCheck
            anchors.fill: parent
            onClicked:
            {
                if( false === MyScript.sudokuUI.checkSudokuValidityRow() )
                {
                    errorMessage.text = "Invalid Row"
                }

                else if( false === MyScript.sudokuUI.checkSudokuValidityColumn() )
                {
                    errorMessage.text="Invalid Column"
                }

                else if( false === MyScript.sudokuUI.checkSudokuValidityBox() )
                {
                    errorMessage.text="Invalid 3x3 Box"
                }

                else
                {
                    errorMessage.text="Congrats!!!\n   Solved.."
                }
            }
        }
    }

    Image
    {
        id: resetButton
        source: mouseReset.pressed ? "./button_pressed.png" : "./button.png"
        width: 120
        anchors {right: parent.right ; rightMargin: opacity == 0 ? 1500 : 10 ; topMargin: 210 ; top: parent.top }
        opacity: 0

        Text
        {
            text: qsTr("Reset")
            anchors.centerIn: parent
            font.pixelSize: 25
        }

        MouseArea
        {
            id: mouseReset
            anchors.fill: parent
            onClicked:
            {
                MyScript.sudokuUI.destroy()
                MyScript.createSudoku()
                resetButton.opacity = 0
                errorMessage.text=""
            }
        }
    }

    Text
    {
        id: errorMessage
        x: 720
        y: 350
        text: qsTr("")
        font.pixelSize: 25
        color: "white"
    }

    Image
    {
        source: "energySudoku.png"
        z: 2
        Behavior on opacity { NumberAnimation {duration: 350} }
        Behavior on z { NumberAnimation {duration: 350} }

        Image
        {
            id: selectBall
            source: "select.png"
            x: 235
            y: 280
            z : 2
            smooth: true
            scale: .55
        }

        MouseArea
        {
            anchors.fill: parent
        }

        MouseArea
        {
            width: 250
            height: 70
            x: 235
            y: 280

            onClicked:
            {
                level = 0
                selectBall.y = 280
            }
        }

        MouseArea
        {
            width: 250 + 35
            height: 70
            x: 235
            y: 280 + 85
            onClicked:
            {
                level = 1
                selectBall.y = 365
            }
        }

        MouseArea
        {
            width: 250 + 50
            height: 70
            x: 235
            y: 280 + 170
            onClicked:
            {
                level = 2
                selectBall.y = 452
            }
        }

        MouseArea
        {
            width: 250 + 50
            height: 70
            x: 575
            y: 620
            onClicked:
            {
                rulesMouse.enabled = false
                parent.opacity = 0
                parent.z = -1
                for( var i = 0; i <= 8 ; ++i )
                {
                    for( var j = 0; j <= 8 ; ++j )
                       MyScript.sudokuProblem[i][j]  = MyScript.sudoku[i][j]
                }
                MyScript.createSudoku()
            }
        }
    }

    Image
    {
        id: name
        source: "close.png"
        smooth: true
        scale: .4
        anchors.right: parent.right
        anchors.top : parent.top
        anchors.topMargin: -30
        anchors.rightMargin: - 20
        MouseArea
        {
            anchors.fill: parent
            onClicked: Qt.quit()
        }
    }

    Rectangle
    {
        id: rules
        z: 20
        opacity: 0
        width: rules.opacity == 0 ? 0 : parent.width
        height: rules.opacity == 0 ? 0 : parent.height
        anchors.centerIn: parent
        color: "#368596"

        Behavior on width { NumberAnimation { duration: 500 } }

        Text
        {
            anchors.centerIn: parent
            anchors.fill: parent
            wrapMode: Text.Wrap
            text: "Just like the original game Sudoku, Energy Sudoku is a logic-based, number-placement puzzle. The objective is to fill a 9×9 grid with images so that each column, each row, and each of the nine 3×3 sub-grids that compose the grid (also called boxes, blocks, regions) contains all of the images from 1 to 9. Instead of normal number from 1 to 9, Energy Sudoku is provided with 9 different images.

-------------
How to play
-------------

1. Chose a level (Level implies level of difficulty in solving the puzzle).
2. The blocks which are to be filled by the player are initially left blank.
3. To fill a block, click on it. Scroll the shown list and to chose one of the 9 images, click any image.
4. To check if your solution is correct, press t"


            +

            "he 'Check' button.
5. If you are not able to solve it, press the 'Solve' button to solve automatically.
6. To reset the game, press the reset button.
7. Press 'close' icon to exit at any moment.

-------------
Credits
-------------

Developed by  : Amit Tomar (amit.tomar@iiitb.org)
Icons credits : http://icongal.com/
Fonts credits : http://icongal.com/

Special thanks : Alark Sharma ( alarksharma@gmail.com )
"

            font.pixelSize: parent.opacity == 0 ? 1 : 20
            font.family: "calibri"
            color: "white"
            smooth: true
        }

        MouseArea
        {
            enabled: parent.opacity
            anchors.fill: parent
            onClicked: {  parent.opacity = 0}
        }
    }

    MouseArea
    {
        id: rulesMouse

        width: 200
        height: 100
        y: parent.height * .80
        x: parent.width * .02
        z: 20
        onClicked: rules.opacity = 1
    }
}
