require_relative "UI_ultimate"

def valida_chute_num erro, chutes 
	cabecalho_chute erro, chutes
	loop do
		palpite_dado = pede_um_chute
		if chutes.include? palpite_dado
			palpite_repetido
		else
			return palpite_dado
		end
	end
end


def game_num aleatorio, tentativas, erro
	chances_dadas = tentativas
	chutes = []

	numero_sorteado = sorteia_numero aleatorio
	#puts numero_sorteado

	while erro < chances_dadas
		palpite_dado = valida_chute_num erro, chutes
		chutes << palpite_dado
		if palpite_dado == numero_sorteado
			mensagem_acerto
			break
		else
			if palpite_dado < numero_sorteado
				mensagem_maior
				erro += 1
			else
				mensagem_menor
				erro += 1
			end
		end
		if erro >= chances_dadas
			elimina_game
			break
		end
	end
	erro
end

def contador_forca chute_forca, palavra_secreta, erro
	contador_letra = 0
	letra = chute_forca[0]
	for i in palavra_secreta.chars
		if i.include? letra
			contador_letra += 1
		end
	end
	contador_letra
end

def mascaras_forca chutes, palavra_secreta
	mascara_palavra = ""
	for i in palavra_secreta.chars
		if chutes.include? i
			mascara_palavra << i
		else
			mascara_palavra << "_"
		end
	end
	mascara_palavra
end

def escolhendo_palavra_secreta balanceamento
	embaralhando_palavra_secreta
	dicionarios = File.read (balanceamento)
	patch_palavras = dicionarios.split "\n"
	palavra_secreta = patch_palavras[rand(patch_palavras.size)]
	palavra_secreta_embaralhada
	palavra_secreta.downcase
end

def valida_chute_word erro, chutes 
	cabecalho_chute erro, chutes
	loop do
		chute_forca = pede_tentativa
		if chutes.include? chute_forca
			palpite_repetido
		else
			return chute_forca
		end
	end
end

def game_word aleatorio, tentativas, balanceamento, erro, nivel
	chances_dadas = tentativas
	chutes = []
	erro = game_num aleatorio, tentativas, erro
	if erro >= chances_dadas
		
		erro = 10
	else
		proxima_fase
		palavra_secreta = escolhendo_palavra_secreta balanceamento
		#puts palavra_secreta
		

		while erro < chances_dadas
			mascara_chutes = mascaras_forca chutes, palavra_secreta
			pistas_mascara mascara_chutes
			chute_forca = valida_chute_word erro, chutes
			chutes << chute_forca

			if chute_forca.size == 1
				marca_letra = contador_forca chute_forca, palavra_secreta, erro
				if marca_letra == 0 #extrair para global
					mensagem_erro
					erro += 1
				else
					quantidade_letra marca_letra
				end	
			else
				if chute_forca == palavra_secreta
					if nivel == 5 
						mensagem_campeao
						break
					else
						mensagem_acerto
						break
					end
				else
					mensagem_erro
					erro += 1
				end
			end
		end
	end
	erro
end

def fora_do_game erros, tentativas
	if erros == tentativas
		elimina_game
	end
end

def calculo_pontuaçao erros
	penalidade = erros.to_i*(10)
	pontos_rodada = 100 - penalidade
end

def game_over nome, nivel, erros, tentativas
	novo_round = jogar_novamente? nome, nivel, erros, tentativas
	nao_jogar_novamente = novo_round == "N"
end


def jogar
	dar_boas_vindas
	nome = nome_do_player
	nivel = escolher_dificuldade
	erro = 0

	loop do
		case nivel
		when nivel = 1
			tentativas = 5
			aleatorio = 10
			erros = game_num aleatorio, tentativas, erro
			fora_do_game erros, tentativas
			chegou_ao_fim
		when nivel = 2
			tentativas = 3
			aleatorio = 20
			erros = game_num aleatorio, tentativas, erro
			fora_do_game erros, tentativas
			chegou_ao_fim
		when nivel = 3
			tentativas = 5
			aleatorio = 30 
			balanceamento = "dicionario4.txt"
			erros = game_word aleatorio, tentativas, balanceamento, erro, nivel
			fora_do_game erros, tentativas
			chegou_ao_fim
		when nivel = 4
			tentativas = 7
			aleatorio = 40
			balanceamento = "dicionario5.txt"
			erros = game_word aleatorio, tentativas, balanceamento, erro, nivel
			fora_do_game erros, tentativas
			chegou_ao_fim
		when nivel = 5
			tentativas = 7
			aleatorio = 50
			balanceamento = "dicionario7.txt"
			erros = game_word aleatorio, tentativas, balanceamento, erro, nivel
			fora_do_game erros, tentativas
			chegou_ao_fim
		end
		pontuaçao_player = calculo_pontuaçao erros
		score_registrado pontuaçao_player

		if game_over nome, nivel, erros, tentativas
			break
		else
			if nivel < 5 && erros < tentativas
				nivel += 1
			end
		end
	end
end




	