class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError
  end

  def self.winner(player1, player2)
    # YOUR CODE HERE
    result=[]
    arr=['S','R','P']
    com=[['R','S'],['S','P'],['P','R'],['R','R'],['S','S'],['P','P']]
    if arr.include? player1[1] and arr.include? player2[1]
    result << player1[1] << player2[1]
    if com.include?result
      return player1
    else
      return player2
    end
    end
    raise RockPaperScissors::NoSuchStrategyError,"Strategy must be one of R,P,S"
  end

  def self.tournament_winner(tournament)
    # YOUR CODE HERE
    if tournament[0][0].is_a?(String)
       return self.winner(tournament[0],tournament[1])
      else
        self.winner( self.tournament_winner(tournament[0]), self.tournament_winner(tournament[1]))
    end
  end
end
