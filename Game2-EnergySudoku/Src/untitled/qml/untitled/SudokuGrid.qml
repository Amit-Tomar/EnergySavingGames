import QtQuick 1.0
import "componentCreation.js" as MyScript

Item
{
    id: topParent
    anchors.fill: parent

    property int level1Difficulty : 2
    property int level2Difficulty : 45
    property int level3Difficulty : 55

    function checkSudokuValidityColumn()
    {
        var arr = new Array(9)

        for( var i = 0 ; i < 9 ; ++ i)
            arr[i] = 0

        // check all columns
        for( i = 0 ; i <= 8 ; ++ i)
        {
            for( var j = 0 ; j <= 8 ; ++ j)
            {
                if(MyScript.sudokuProblem [j][i] == -1 )
                {
                    return false
                }

                arr[MyScript.sudokuProblem[j][i]] = arr[MyScript.sudokuProblem[j][i]] + 1
            }

            for( var k = 0 ; k < 9 ; ++ k)
            {
                if( arr[k] > 1  )
                {
                    return false
                }
            }

            for( k = 0 ; k < 9 ; ++ k)
                arr[k] = 0
        }

        return true
    }

    function checkSudokuValidityBox()
    {
        var arr = new Array(9)

        // ---- 1
        for( var i = 0 ; i < 9 ; ++ i)
            arr[i] = 0

        for( i = 0 ; i <= 2 ; ++ i)
        {
            for( var j = 0 ; j <= 2 ; ++ j)
            {
                arr[MyScript.sudokuProblem[i][j]] = arr[MyScript.sudokuProblem[i][j]] + 1
            }
        }

        for( var k = 0 ; k < 9 ; ++ k)
        {
            if( arr[k] > 1  )
            {
                return false
            }
        }

        //---- 2
        for( var i = 0 ; i < 9 ; ++ i)
            arr[i] = 0

        for( i = 0 ; i <= 2 ; ++ i)
        {
            for( var j = 3 ; j <= 5 ; ++ j)
            {
                arr[MyScript.sudokuProblem[i][j]] = arr[MyScript.sudokuProblem[i][j]] + 1
            }
        }

        for( var k = 0 ; k < 9 ; ++ k)
        {
            if( arr[k] > 1  )
            {
                return false
            }
        }

        // ----3

        for( var i = 0 ; i < 9 ; ++ i)
            arr[i] = 0

        for( i = 0 ; i <= 2 ; ++ i)
        {
            for( var j = 6 ; j <= 8 ; ++ j)
            {
                arr[MyScript.sudokuProblem[i][j]] = arr[MyScript.sudokuProblem[i][j]] + 1
            }
        }

        for( var k = 0 ; k < 9 ; ++ k)
        {
            if( arr[k] > 1  )
            {
                return false
            }
        }

        // ----4

        for( var i = 0 ; i < 9 ; ++ i)
            arr[i] = 0

        for( i = 3 ; i <= 5 ; ++ i)
        {
            for( var j = 0 ; j <= 2 ; ++ j)
            {
                arr[MyScript.sudokuProblem[i][j]] = arr[MyScript.sudokuProblem[i][j]] + 1
            }
        }

        for( var k = 0 ; k < 9 ; ++ k)
        {
            if( arr[k] > 1  )
            {
                return false
            }
        }

        // ----5

        for( var i = 0 ; i < 9 ; ++ i)
            arr[i] = 0

        for( i = 3 ; i <= 5 ; ++ i)
        {
            for( var j = 3 ; j <= 5 ; ++ j)
            {
                arr[MyScript.sudokuProblem[i][j]] = arr[MyScript.sudokuProblem[i][j]] + 1
            }
        }

        for( var k = 0 ; k < 9 ; ++ k)
        {
            if( arr[k] > 1  )
            {
                return false
            }
        }

        // ----6

        for( var i = 0 ; i < 9 ; ++ i)
            arr[i] = 0

        for( i = 3 ; i <= 5 ; ++ i)
        {
            for( var j = 6 ; j <= 8 ; ++ j)
            {
                arr[MyScript.sudokuProblem[i][j]] = arr[MyScript.sudokuProblem[i][j]] + 1
            }
        }

        for( var k = 0 ; k < 9 ; ++ k)
        {
            if( arr[k] > 1  )
            {
                return false
            }
        }

        // ----7

        for( var i = 0 ; i < 9 ; ++ i)
            arr[i] = 0

        for( i = 6 ; i <= 8 ; ++ i)
        {
            for( var j = 0 ; j <= 2 ; ++ j)
            {
                arr[MyScript.sudokuProblem[i][j]] = arr[MyScript.sudokuProblem[i][j]] + 1
            }
        }

        for( var k = 0 ; k < 9 ; ++ k)
        {
            if( arr[k] > 1  )
            {
                return false
            }
        }

        // ----8

        for( var i = 0 ; i < 9 ; ++ i)
            arr[i] = 0

        for( i = 6 ; i <= 8 ; ++ i)
        {
            for( var j = 3 ; j <= 5 ; ++ j)
            {
                arr[MyScript.sudokuProblem[i][j]] = arr[MyScript.sudokuProblem[i][j]] + 1
            }
        }

        for( var k = 0 ; k < 9 ; ++ k)
        {
            if( arr[k] > 1  )
            {
                return false
            }
        }

        // ----8

        for( var i = 0 ; i < 9 ; ++ i)
            arr[i] = 0

        for( i = 6 ; i <= 8 ; ++ i)
        {
            for( var j = 6 ; j <= 8 ; ++ j)
            {
                arr[MyScript.sudokuProblem[i][j]] = arr[MyScript.sudokuProblem[i][j]] + 1
            }
        }

        for( var k = 0 ; k < 9 ; ++ k)
        {
            if( arr[k] > 1  )
            {
                return false
            }
        }

        //----

        return true
    }


    function checkSudokuValidityRow()
    {
        var arr = new Array(9)

        for( var i = 0 ; i < 9 ; ++ i)
            arr[i] = 0

        // check all rows
        for( i = 0 ; i <= 8 ; ++ i)
        {
            for( var j = 0 ; j <= 8 ; ++ j)
            {
                if(MyScript.sudokuProblem [i][j] === -1 )
                {
                    console.log( "Element in row number " + i + " left blank." )
                    return false
                }

                arr[MyScript.sudokuProblem[i][j]] = arr[MyScript.sudokuProblem[i][j]] + 1
            }

            for( var k = 0 ; k < 9 ; ++ k)
            {
                if( arr[k] > 1  )
                {
                    console.log( "Error in element number " + k )
                    return false
                }
            }

            for( k = 0 ; k < 9 ; ++ k)
                arr[k] = 0
        }

        return true
    }

    function createSudokuProblem()
    {
        console.log("Counting " + Math.random() * 100 +1 )

        var count = 0
        // Randomize the problem set
        exchangeRows   (0, (Math.random() * 100 +1 ) > 50 ? 1 : 2 )
        exchangeColumns(3, (Math.random() * 100 +1 ) > 50 ? 4 : 5 )

        exchangeRows   (3, (Math.random() * 100 +1 ) > 50 ? 4 : 5 )
        exchangeColumns(0, (Math.random() * 100 +1 ) > 50 ? 1 : 2 )

        exchangeRows   (6, (Math.random() * 100 +1 ) > 50 ? 7 : 8 )
        exchangeColumns(6, (Math.random() * 100 +1 ) > 50 ? 7 : 8 )

        //----

        exchangeColumns(1, (Math.random() * 100 +1 ) > 50 ? 7 : 4 )
        exchangeColumns(4, (Math.random() * 100 +1 ) > 50 ? 7 : 7 )

        exchangeRows(1, (Math.random() * 100 +1 ) > 50 ? 7 : 4 )
        exchangeRows(4, (Math.random() * 100 +1 ) > 50 ? 7 : 7 )

        // Save the randomize problem
        for( var i = 0; i <= 8 ; ++i )
           for( var j = 0; j <= 8 ; ++j )
                MyScript.sudoku[i][j] =MyScript.sudokuProblem[i][j]

        // remove elements based on algo
            while(1)
            {
                console.log("Here")
                count = 0

                var x = Math.floor((Math.random()*100)%9)
                var y = Math.floor((Math.random()*100)%9)

                MyScript.sudokuProblem[x][y] = -1
                console.log("value : " +MyScript.sudokuProblem[0][0] )

                for( var i = 0; i <= 8 ; ++i )
                {
                    for( var j = 0; j <= 8 ; ++j )
                        if( -1 ===MyScript.sudokuProblem[i][j] )
                        {
                            ++ count
                            if( level == 0 ? count >= level1Difficulty : ( level ==1 ? count >=level2Difficulty : count >=level3Difficulty ) )
                            {
                               i = 99; j = 99 ; count = -1
                            }
                        }
                }

                if( -1 == count )
                    break;
            }

            console.log("Sudoku problem made succ.")
            return 0
    }

    property int namer: createSudokuProblem()

    function solveSudoku()
    {
        var k = 0
        for( var i = 0; i <= 8 ; ++i )
        {
            for( var j = 0; j <= 8 ; ++j, ++k )
            {
                repeat.itemAt(k).angleOfRotation = 360
                repeat.itemAt(k).label = MyScript.sudoku[i][j]
                repeat.itemAt(k).mouseEnabled  = false
                MyScript.sudokuProblem [i][j] = MyScript.sudoku[i][j]
            }
        }
    }

    function bringSelection(x,y,index)
    {
        view.opacity = 1
        view.x = x
        view.y = y
        view.scale = 1
        topParent.opacity = .95
        currentSelected = index
        view.positionViewAtIndex(index,ListView.Center)
    }

    function setText(index, number)
    {
        repeat.itemAt( index ).label = number
        repeat.itemAt( index ).selectionOpacity = 0
    }

    property string seperatorColor: "#4cb3c8"
    property int seperatorWidth: 2

    Rectangle
    {
        width: seperatorWidth
        color: seperatorColor
        height: parent.height * .98
        x: 238
        y: 10
        opacity: 1
    }

    Rectangle
    {
        width: seperatorWidth
        color: seperatorColor
        height: parent.height * .98
        x: 238 * 2 - 8
        y: 10
        opacity: 1
    }

    Rectangle
    {
        width: parent.width * .75
        height: seperatorWidth
        color: seperatorColor
        x: 10
        y: 238
        opacity: 1
    }

    Rectangle
    {
        width: parent.width * .75
        height: seperatorWidth
        color: seperatorColor
        x: 10
        y: 238 * 2 - 8
        opacity: 1
    }

    Grid
    {
        id: grid
        columns: 9
        spacing: 5
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        width: parent.width * .88
        height: parent.width * .88

        Repeater
        {
            id: repeat
            model: 81
            Image
            {
                id: name
                source: mouse.pressed ? "./button_pressed.png" : "./button.png"
                width : parent.width / 11
                height: name.width

                property alias angleOfRotation: rotateTransform.angle

                transform: Rotation
                {
                    id: rotateTransform
                    origin.x: 30; origin.y: 30; axis { x: 0; y: 1; z: 0 } angle: 0
                    Behavior on angle { NumberAnimation { duration: (50 * index) } }
                }

                property alias label: tex.text
                property alias labelColor: tex.color
                property alias selectionOpacity: selection.opacity
                property alias shadowOpacity: shadow.opacity
                property alias mouseEnabled: mouse.enabled

                Text
                {
                    id: tex ;
                    text: (-1 == MyScript.sudokuProblem [Math.floor(index/9)][index%9] ? "" :MyScript.sudokuProblem [Math.floor(index/9)][index%9])
                    font.pixelSize: 25; anchors.centerIn: parent; opacity: 0
                }

                MouseArea
                {
                    id: mouse
                    anchors.fill: parent
                    onClicked:
                    {
                        if( index < 50 )
                            bringSelection(parent.x + 10, parent.y + 10, index)
                        else if( index > 71 )
                            bringSelection(parent.x + 10, parent.y + 10 - 200, index)
                        else
                            bringSelection(parent.x + 10, parent.y + 10 - 175, index)

                        selection.opacity = 1
                    }

                    // For clearing the selection
                    onPressAndHold:
                    {
                        MyScript.sudokuProblem[Math.floor(currentSelected/9)][currentSelected%9] = -1
                        tex.text = ""
                    }
                }

                Image
                {
                   id: selection
                   opacity: 0
                   source: "./button_pressed.png"
                   anchors
                   {
                       left: parent.left ; right: parent.right ; bottom: parent.bottom; top: parent.top
                       leftMargin: -10 ; rightMargin : -10 ; topMargin: -10; bottomMargin : -10
                   }
                }

                Rectangle
                {
                   id: shadow
                   color: "black"
                   opacity: .5
                   radius: 10
                   z: parent.z - 1

                   property real margin: - .35

                   anchors
                   {
                       left: parent.left ; right: parent.right ; bottom: parent.bottom; top: parent.top
                       leftMargin: margin ; rightMargin : margin ; topMargin: margin; bottomMargin : margin
                   }
                }

                Image
                {
                    source: name.label == "" ? "./button.png" : name.label + ".png"
                    smooth: true
                    scale: .9
                    anchors.fill: parent
                }
            }
        }
    }

    Component.onCompleted:
    {
        for( var i = 0 ; i <= 80 ; ++i )
            if ( "" != repeat.itemAt(i).label )
            {
                repeat.itemAt(i).mouseEnabled  = false
            }

            else
            {
                repeat.itemAt(i).labelColor = "steelblue"
                repeat.itemAt(i).shadowOpacity = false
            }
    }

Rectangle
{
    anchors.fill: parent
    z: 5000
    opacity: topParent.opacity == 1 ? 0 : .9
    color: "black"
    MouseArea
    {
        anchors.fill: parent
        onClicked: {}
    }
}

}
