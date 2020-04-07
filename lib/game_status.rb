# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Top column
  [1,4,7], # Middle column
  [2,5,8], # Bottom column
  [0,4,8], # Diag A
  [6,4,2], # Diag B
]

def won?(board)
  WIN_COMBINATIONS.any? do |win_state|
    if (win_state.all? {|index| position_taken?(board,index)}) && (win_state.all? {|index| board[index] == "X"} || win_state.all? {|index| board[index] == "O"})
      return win_state
    end
  end
end

def full?(board)
  return_value = true
  board.each do |index|
    if !position_taken?(board, index.to_i)
      return_value = false
    end
  end
  return return_value
end
