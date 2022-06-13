require_relative 'tic_tac_toe'

class TicTacToeNode
  MARKS = [:x, :o]
  attr_reader :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
    @children = []
  end

  def switch_mark
    if @next_mover_mark == :x
      @next_mover_mark = :o 
    else
      @next_mover_mark = :x
    end
  end

  def losing_node?(evaluator)
    if @board.over? 
      return @board.won? && @board.winner != evaluator
    end
    if @next_mover_mark == evaluator 
      @children.all? {|child| child.losing_node?(evaluator)}
    else
      @children.any? {|child| child.losing_node?(evaluator)}
    end
    false
  end

  def winning_node?(evaluator)
    if @board.over?
      return @board.won? && @board.winner == evaluator
    end
    if @next_mover_mark == evaluator 
      @children.all? {|child| child.winning_node?(evaluator)}
    else
      @children.any? {|child| child.winning_node?(evaluator)}
    end
    false 
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    for row in 0..2
      for col in 0..2
        pos = [row,col]
        if @board.empty?(pos)
          prev_game_state = @board.dup
          prev_game_state[pos] = @next_mover_mark
          # make prev_move_pos = pos if it's the first move in the game 
          @children << TicTacToeNode.new(prev_game_state,@next_mover_mark, pos) #check
        end
      end
    end
    switch_mark
    @children
  end
end
