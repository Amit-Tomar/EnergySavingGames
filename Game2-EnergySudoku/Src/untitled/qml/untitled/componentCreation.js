var sudoku =           [[1,2,3,4,5,6,7,8,9],
                       [4,5,6,7,8,9,1,2,3],
                       [7,8,9,1,2,3,4,5,6],

                       [2,3,4,5,6,7,8,9,1],
                       [5,6,7,8,9,1,2,3,4],
                       [8,9,1,2,3,4,5,6,7],

                       [3,4,5,6,7,8,9,1,2],
                       [6,7,8,9,1,2,3,4,5],
                       [9,1,2,3,4,5,6,7,8]]

var  sudokuProblem  =            [[1,2,3,4,5,6,7,8,9],
                                [4,5,6,7,8,9,1,2,3],
                                [7,8,9,1,2,3,4,5,6],

                                [2,3,4,5,6,7,8,9,1],
                                [5,6,7,8,9,1,2,3,4],
                                [8,9,1,2,3,4,5,6,7],

                                [3,4,5,6,7,8,9,1,2],
                                [6,7,8,9,1,2,3,4,5],
                                [9,1,2,3,4,5,6,7,8]]

var component;
var sudokuUI;

function createSudoku()
{
     component = Qt.createComponent("SudokuGrid.qml");
     if (component.status == Component.Ready)
         finishCreation();
     else
         component.statusChanged.connect(finishCreation);
 }

 function finishCreation()
 {
     console.log("Created Succ.")
     if (component.status == Component.Ready)
     {
         createSudokuProblem()
         sudokuUI = component.createObject(topParent, {"x": 1800 , "y": 1800});
         sudokuUI.opacity = 1
     }
 }
