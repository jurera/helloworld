class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  
  s1 = game[0][1]
  s2 = game[1][1]
  
  raise NoSuchStrategyError unless (s1[/[r,p,s]/i]) != nil && (s2[/[r,p,s]/i]) != nil
  
  if s1 == s2 || (s1 == 'R'&& s2 == 'S') || (s1 == 'S'&& s2 == 'P') || (s1 == 'P'&& s2 == 'R')
  return game[0]
  else 
  return game[1]
  end
  
  
end

def rps_tournament_winner(tournament)
  
  arr_2 = Array.new
  arr_1 = Array.new
  
  tournament.each_with_index {|t_1,i_1| 
     
     t_1.each_with_index {|t_2,i_2|
        print t_2, "\n"    
        #arr_2[i_2] = rps_game_winner(t_2)
     }
     #arr_1[i_1] = rps_game_winner(arr_2)
      
  }
  
  #rps_game_winner(arr_1)

end

#tournament = [[["Dave", "S"], ["Richard", "R"]], [["Allen", "S"], ["Richard X.", "P"]]]

tournament = [
	[
		[ ["Armando", "P"], ["Dave", "S"] ],
		[ ["Richard", "R"], ["Michael", "S"] ],
	],
	[
		[ ["Allen", "S"], ["Omer", "P"] ],
		[ ["David E.", "R"], ["Richard X.", "P"] ]
	],
	[
		[ ["Armando", "P"], ["Dave", "S"] ],
		[ ["Richard", "R"], ["Michael", "S"] ],
	],
	[
		[ ["Allen", "S"], ["Omer", "P"] ],
		[ ["David E.", "R"], ["Richard X.", "P"] ]
	]
]

print rps_tournament_winner(tournament)

