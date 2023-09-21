def add_scoreboard nome, pontuaçao_player
    conteudo = "#{nome}\n#{pontuaçao_player}"
    File.write "ultimate_rank.txt", conteudo
end

def le_scoreboard
    scoreboard = File.read "ultimate_rank.txt"
    scoreboard.split "\n"
end

def campeao_superado dados, nome, pontuaçao_player
    if dados[1].to_i < pontuaçao_player
        add_scoreboard nome, pontuaçao_player
        puts "********* NEW RECORD *********"
    end
end
