extends MarginContainer

const FALAS = [[[ # npc 1
	"dialogo numero 0 npc 1", ["resposta 1","resposta 2"],[1 , 2] # 0
	],[
	"dialogo numero 1 npc 1", ["resposta 1","resposta 2"],[1 , 2] # 1
	],[
	"dialogo numero 2 npc 1", ["resposta 1","resposta 2"],[1 , 2] # 2
	],[
	"dialogo numero 3 npc 1", ["resposta 1","resposta 2"],[1 , 2] # 3
	],[
	"dialogo numero 4 npc 1", ["resposta 1","resposta 2"],[1 , 2] # 4
	],[
	"dialogo numero 5 npc 1", ["resposta 1","resposta 2"],[1 , 2] # 5
	]],[[ # npc 2
	"dialogo numero 0 npc 2", ["resposta 1","resposta 2"],[1 , 2] # 0
	],[
	"dialogo numero 1 npc 2", ["resposta 1","resposta 2"],[1 , 2] # 1
	],[
	"dialogo numero 2 npc 2", ["resposta 1","resposta 2"],[1 , 2] # 2
	],[
	"dialogo numero 3 npc 2", ["resposta 1","resposta 2"],[1 , 2] # 3
	],[
	"dialogo numero 4 npc 2", ["resposta 1","resposta 2"],[1 , 2] # 4
	],[
	"dialogo numero 5 npc 2", ["resposta 1","resposta 2"],[1 , 2] # 5
	]]]

var posicoes = [0,0]
var npc_atual = 0

func falando(npc):
	npc_atual = npc
	caixa_texto(posicoes[npc],npc)

func caixa_texto(fala, npc):
	visible = true
	$VBoxContainer/HBoxContainer/Texto.text = FALAS[npc][fala][0]
	$VBoxContainer/HBoxContainer2/Button1.text = FALAS[npc][fala][1][0]
	$VBoxContainer/HBoxContainer2/Button2.text = FALAS[npc][fala][1][1]
	



func _on_button_1_pressed():
	visible = false
	posicoes[npc_atual] = FALAS[npc_atual][posicoes[npc_atual]][2][0]
	caixa_texto(posicoes[npc_atual], npc_atual)


func _on_button_2_pressed():
	visible = false
	posicoes[npc_atual] = FALAS[npc_atual][posicoes[npc_atual]][2][1]
	caixa_texto(posicoes[npc_atual], npc_atual)
