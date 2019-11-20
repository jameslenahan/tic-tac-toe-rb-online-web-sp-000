# Helper Method
board = ["", "", "", "", "", "", "", "", ""]
def display_board(board)
  puts" #{board[0]} | #{board[1]} | #{board[2]} "
  puts"-----------"
  puts" #{board[3]} | #{board[4]} | #{board[5]} "
  puts"-----------"
  puts" #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(string)
  string.to_i - 1
end
  
def move(board, index, current_player = "X")
  board[index] = current_player
end

def valid_move?(board, index)
  if index == nil || index < 0 || index > 8
    false
  elsif position_taken?(board, index)
    false
  else
    true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end


def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def current_player(board)
  if turn_count(board)% 2 == 0
    current_player = "X"
  else
    current_player = "O"
end
return current_player
end


#MAKE MOVE ON BOARD
def move(board, index, token)
  board[index] = token
  play(board)
  
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [8, 4, 0], #left>right diagonal
  [6, 4, 2], #right>left diagonal
  [0, 3, 6], #left column
  [1, 4, 7], #middle column
  [2, 5, 8]  #right column

]

def won?(board)
  WIN_COMBINATIONS.each {|win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    position_1 = board[index_0]
    position_2 = board[index_1]
    position_3 = board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  }
  return false
end

def full?(board)
 board.all? {|index| index == "X" || index == "O"}
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if !won?(board) && full?(board)
    return true
  elsif won?(board) && full?(board)
    return true
  elsif won?(board) && !full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  index = []
  index = won?(board)
  if index == false
    return nil
  else
    if board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end
  