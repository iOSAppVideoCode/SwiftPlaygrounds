class TicTacToeGame: CustomStringConvertible {

  enum MarkType: String {
    case none = "-"
    case x = "X"
    case o = "O"
  }
  var board: [MarkType]

  enum State: String {
    case xTurn = "X's Turn"
    case oTurn = "O's Turn"
    case xWin = "X Wins!"
    case oWin = "O Wins!"
    case tie = "Tie Game"
  }
  var state: State

  init() {
//    board = [MarkType]()
//    for _ in 0..<9 {
//      board.append(TicTacToeGame.MarkType.none)
//    }
    board = [MarkType](repeating: .none, count: 9)
    state = .xTurn
  }

  func pressedSquareAt(_ index: Int) {
    if (board[index] != .none) {
      print("The square is not empty")
      return
    }
    switch state {
    case .xWin, .oWin, .tie:
      print("This game is over already.  No more moves allowed")
      return
    case .xTurn:
      board[index] = .x
      state = .oTurn
    case .oTurn:
      board[index] = .o
      state = .xTurn
    }
    checkForWin()
  }

  func checkForWin() {
    // Check for a tie BEFORE checking for win
    if !board.contains(.none) {
      state = .tie
    }

    var linesOf3 = [String]()
//    linesOf3.append("\(board[0].rawValue)\(board[1].rawValue)\(board[2].rawValue)")
    linesOf3.append(getBoardString([0, 1, 2]))
    linesOf3.append(getBoardString([3, 4, 5]))
    linesOf3.append(getBoardString([6, 7, 8]))
    linesOf3.append(getBoardString([0, 3, 6]))
    linesOf3.append(getBoardString([1, 4, 7]))
    linesOf3.append(getBoardString([2, 5, 8]))
    linesOf3.append(getBoardString([0, 4, 8]))
    linesOf3.append(getBoardString([2, 4, 6]))

    for lineOf3 in linesOf3 {
      if lineOf3 == "XXX" {
        state = .xWin
      } else if lineOf3 == "OOO" {
        state = .oWin
      }
    }
  }

  func getBoardString(_ indicies: [Int] = [0,1,2,3,4,5,6,7,8]) -> String {
    var gameString = ""
    for index in indicies {
      gameString += board[index].rawValue
    }
    return gameString
  }

  var description: String {
    return "\(state) Board: \(getBoardString())"
  }

}

/* ----------------- Official Playground testing ----------------- */
var game = TicTacToeGame()
//game.board[0] = .x
//game

game.pressedSquareAt(0)  // X is moving in the upper left
game.pressedSquareAt(1) // O is moving in the top center
game.pressedSquareAt(3)  // below the other X
game.pressedSquareAt(2) // O is moving to the top right
game.pressedSquareAt(6) // X wins the game!!!!

var game2 = TicTacToeGame()
game2.board = [.x, .x, .o,
                .none, .none, .none,
                .o, .none, .none]
game2.pressedSquareAt(8)
game2.pressedSquareAt(4)


var game3 = TicTacToeGame()
game3.board = [.x, .x, .o,
    .o, .o, .x,
    .x, .o, .none]
game3.pressedSquareAt(8)

