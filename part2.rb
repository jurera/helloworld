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

def rps_tournament_winner(game)
  if game[0][1].class==String
    rps_game_winner(game)
  else  
    a1=rps_tournament_winner(game[0])
    a2=rps_tournament_winner(game[1])
    rps_tournament_winner([a1,a2])
  end
end

#tournament = [[["Dave", "S"], ["Richard", "R"]], [["Allen", "S"], ["Richard X.", "P"]]]

tournament = [
  [
    [ ["A1", "P"], ["A2", "S"] ],
    [ ["A3", "R"],  ["A4", "S"] ],           
  ],
  [
    [ ["Armando", "P"], ["Dave", "S"] ],
    [ ["Richard", "R"],  ["Michael", "S"] ], 
  ],
  [
    [ ["Armando", "P"], ["Dave", "S"] ],
    [ ["Richard", "R"],  ["Michael", "S"] ], 
  ],
  [
    [ ["Armando", "P"], ["Dave", "S"] ],
    [ ["Richard", "R"],  ["Michael", "S"] ], 
  ]
]
print rps_tournament_winner(tournament)

