require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)

    initial_state = TicTacToeNode.new(game, mark)
    queue = [initial_state]
    result = nil

    until queue.empty?
      current_state = queue.shift

      if current_state.winning_node?(mark)
        return current_state.prev_move_pos
      elsif !current_state.losing_node?(mark)
        result = current_state.prev_move_pos
      end

      current_state.children.each do |child|
        queue << child 
      end

      result
      raise "error" if result.nil?
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
