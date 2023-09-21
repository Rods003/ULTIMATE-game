def dar_boas_vindas
	puts "\n\n"
	puts "///////// SEJAM BEM VINDOS AO \\\\\\\\\\\\\\\\\\"
	puts "///////// ULTIMATE GAME!!! \\\\\\\\\\\\\\\\\\"
	puts "\n\n"
	puts "Vambora ver se você está a altura do desafio!"
end

def campeao_ultimate dados 
	puts "\n"
	puts "***   O nosso atual campeão é:   ***"
	puts "      #{dados[0]} com #{dados[1]} pontos !!!"
	puts "\n\n"
end

def nome_do_player
	puts "Insira seu nome, desafiante: "
	nome = gets.strip
	puts "\n"
	puts "Olá #{nome}, vamos começar..."
	nome
end

def escolher_dificuldade
	puts "\n\n"
	puts "Em qual dificuldade você gostaria de jogar?"
	puts "(1) Ok (2) Interessante (3) Campeão (4) Lenda (5) ULTIMATE"
	nivel = gets.strip
	nivel.to_i
end

def sorteia_numero aleatorio
	puts "\n\n"
	puts "***Estamos sorteando um número para o seu desafio...***"
	numero_sorteado = rand(aleatorio)
	puts "\n"
	puts "Número escolhido! Ele está entre 0 e #{aleatorio.to_i}"
	puts "Bora começar..."
	numero_sorteado
end

def pede_um_chute
	puts "\n\n"
	puts "Qual foi o número sorteado?"
	chute = gets.strip
	chute.to_i
end

def proxima_fase
	puts "\n\n"
	puts "***FASE DOIS***"
	puts "Parabéns, se você chegou até aqui significa que você superou o primeiro desafio!"
	puts "\n"
	puts "Agora, vamos ver se você tem o que é preciso para passar da segunda etapa..."
	puts "Salve-se da FORCA!"
end

def desenha_forca erro
	cabeca = "   "
    corpo = " "
    pernas = "   "
    bracos = "   "
    if erro >= 1
        cabeca = "(_)"
    end
    if erro >= 2
        bracos = " | "
        corpo = "|"
    end
    if erro >= 3
        bracos = "/|\\"
    end
    if erro >= 4
        pernas = "/ \\"
    end

    puts "  _______       "
    puts " |/      |      "
    puts " |      #{cabeca}  "
    puts " |      #{bracos}  "
    puts " |       #{corpo}  "
    puts " |      #{pernas}  "
    puts " |              "
    puts "_|___           "
    puts

end

def embaralhando_palavra_secreta
	puts "\n\n"
	puts "A palavra secreta está sendo definida..."
end

def palavra_secreta_embaralhada
	puts "Palavra definida! Vamos começar"
end

def pede_tentativa
	puts "\n"
	puts "Insira uma palavra ou uma letra:"
	chute_forca = gets.strip.downcase
end

def cabecalho_chute erro, chutes
	puts "\n"
	puts "Erros até agora #{erro}..."
	puts "Seus chutes até agora foram: #{chutes}"
	puts "\n"
end

def palpite_repetido
	puts "\n\n"
	puts "Você já tentou essa, por favor tente uma nova."
end


def quantidade_letra marca_letra
	puts "\n\n"
	puts "***Essa letra aparece #{marca_letra} vezes na nossa palavra secreta!***"
end

def pistas_mascara mascara_chutes
	puts "--- Até agora temos as seguintes pistas: #{mascara_chutes} ---"
end

def mensagem_acerto
	puts "\n"
	puts "Você acertou!!"
end

def mensagem_maior
	puts "\n"
	puts "Errado! O número que você procura é maior..."
end

def mensagem_menor
	puts "\n"
	puts "Errado! O número que você procura é menor..."
end

def mensagem_erro
	puts "\n"
	puts "Errado!"
end

def mensagem_campeao
	puts "\n"
	puts "PARABÉNS VOCÊ É O CAMPEÃO DO ULTIMATE GAME!"
	puts
    puts "       ___________      "
    puts "      '._==_==_=_.'     "
    puts "      .-\\:      /-.    "
    puts "     | (|:.     |) |    "
    puts "      '-|:.     |-'     "
    puts "        \\::.    /      "
    puts "         '::. .'        "
    puts "           ) (          "
    puts "         _.' '._        "
    puts "        '-------'       "
    puts
end

def elimina_game
	puts "\n\n"
	puts "********* Você perdeu e está eliminado do ULTIMATE game! Boa sorte na próxima *********"
end

def chegou_ao_fim
	puts "\n\n"
	puts "THE END"
end

def score_registrado pontuaçao_player
	puts "\n\n\n"
	puts "*** SEU SCORE: #{pontuaçao_player} PONTOS ***"
end

def jogar_novamente? nome, nivel, erros, tentativas
	if nivel == 5 || erros == tentativas
		puts "\n"
		puts "#{nome}, você deseja jogar novamente? (S/N)"
		novo_round = gets.strip.upcase
	else
		puts "\n"
		puts "Gostaria de um desafio maior #{nome}? (S/N)"
		novo_round = gets.strip.upcase
	end
	novo_round
end