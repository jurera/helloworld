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

  tournament_new = Array.new(2,Array.new)
  
  tournament.flatten(1).each_with_index {|x,idx| 
    tournament_new[idx] = rps_game_winner(x)
  }
  
  i = 0
  j = 0
  tournament_final = Array.new
  while i < tournament_new.length
  
    tournament_final[j] = [tournament_new[i],tournament_new[i+1]]
    
    i+=2
    j+=1
  end   

  if tournament_final.length != 1  
    rps_tournament_winner(tournament_final)
  end
  
  

end

tournament = [
[
[ ["Armando", "P"], ["Dave", "S"] ],
[ ["Richard", "R"], ["Michael", "S"] ],
],
[
[ ["Allen", "S"], ["Omer", "P"] ],
[ ["David E.", "R"], ["Richard X.", "P"] ]
]
]
rps_tournament_winner(tournament)
