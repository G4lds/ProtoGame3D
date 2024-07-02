extends MarginContainer

const FALAS = [[[ # npc 0
	"dialogo numero 0 npc 0", ["ir dialogo 1","ir quest 0"],[1 , 2] # 0
	],[
	"dialogo numero 1 npc 0", ["ir dialogo 3","ir dialogo 4"],[3 , 4] # 1
	],[
	0, ["terminar quest","desistir"],[5 , 0] # 2
	],[
	"dialogo numero 3 npc 0", ["ir quest 1","ir dialogo 2"],[4 , -1] # 3
	],[
	1, ["terminar quest","ir dialogo 0"],[5 , -1] # 4
	],[
	"dialogo numero 5 npc 0", ["resposta 1","resposta 2"],[-1 , -1] # 5
	]],[[ # npc 1
	"dialogo numero 0 npc 0", ["ir dialogo 1","ir quest 0"],[1 , 2] # 0
	],[
	"dialogo numero 1 npc 0", ["ir dialogo 3","ir dialogo 4"],[3 , 4] # 1
	],[
	0, ["terminar quest","desistir"],[5 , 0] # 2
	],[
	"dialogo numero 3 npc 0", ["ir quest 1","ir dialogo 2"],[4 , -1] # 3
	],[
	1, ["terminar quest","ir dialogo 0"],[5 , -1] # 4
	],[
	"dialogo numero 5 npc 0", ["resposta 1","resposta 2"],[-1 , -1] # 5
	]]]
const QUESTS = [[[ # npc 0
	"dialogo da quest 0 npc 0 (0,1,0,0,0)",[0,1,0,0,0],[0,0,0,0,0] # 0
	],[
	"dialogo da quest 1 npc 0 (0,0,1,0,0)",[0,0,1,0,0],[0,0,0,0,0] # 1
	]],[[ # npc 1
	"dialogo da quest 0 npc 1 (0,0,0,1,0)",[0,0,0,1,0],[0,0,0,0,0] # 0
	],[
	"dialogo da quest 1 npc 1 (1,0,0,0,0)",[1,0,0,0,0],[0,0,0,0,0] # 1
	]]]

var quest_andamento = [false,false]
var posicoes = [0,0]
var npc_atual = 0

func falando(npc):
	npc_atual = npc
	caixa_texto(posicoes[npc],npc)

func caixa_texto(fala, npc):
	if FALAS[npc][fala][2][0] == -1:
		$VBoxContainer.visible = true
		$VBoxContainer/Margin2.visible = false
		$VBoxContainer/HBoxContainer2/Button2.visible = true
		$VBoxContainer/HBoxContainer2/Button1.visible = false
		
		if FALAS[npc][fala][2][1] == -1:
			$VBoxContainer/HBoxContainer2.visible = false
			
	elif FALAS[npc][fala][2][1] == -1:
		$VBoxContainer.visible = true
		$VBoxContainer/Margin2.visible = false
		$VBoxContainer/HBoxContainer2/Button1.visible = true
		$VBoxContainer/HBoxContainer2/Button2.visible = false
		
	else:
		$VBoxContainer.visible = true
		$VBoxContainer/Margin2.visible = true
		$VBoxContainer/HBoxContainer2/Button1.visible = true
		$VBoxContainer/HBoxContainer2/Button2.visible = true
		
	if FALAS[npc][fala][0] is int:
		$VBoxContainer/HBoxContainer/Texto.text = QUESTS[npc][FALAS[npc][fala][0]][0]
		$VBoxContainer/HBoxContainer2/Button1.text = FALAS[npc][fala][1][0]
		$VBoxContainer/HBoxContainer2/Button2.text = FALAS[npc][fala][1][1]
		quest_andamento[npc] = true
		
	else:
		$VBoxContainer/HBoxContainer/Texto.text = FALAS[npc][fala][0]
		$VBoxContainer/HBoxContainer2/Button1.text = FALAS[npc][fala][1][0]
		$VBoxContainer/HBoxContainer2/Button2.text = FALAS[npc][fala][1][1]
		quest_andamento[npc] = false
	
	visible = true
	

func quest(itens):
	var tem_item = true
	var inventario = []
	inventario = get_parent().get_parent().get_inventario()
	for i in range(len(itens)):
		inventario[i] -= itens[i]
		if inventario[i] == -1:
			tem_item = false
	if tem_item == true:
		get_parent().get_parent().set_inventario(inventario)
	return tem_item


func _on_button_1_pressed():
	visible = false
	if not quest_andamento[npc_atual]:
		posicoes[npc_atual] = FALAS[npc_atual][posicoes[npc_atual]][2][0]
		caixa_texto(posicoes[npc_atual], npc_atual)
	else:
		if quest(QUESTS[npc_atual][FALAS[npc_atual][posicoes[npc_atual]][0]][1]):
			quest_andamento[npc_atual] = false
			posicoes[npc_atual] = FALAS[npc_atual][posicoes[npc_atual]][2][0]
			caixa_texto(posicoes[npc_atual], npc_atual)
			print("aaa")
		else:
			print("bbb")
		
		
	


func _on_button_2_pressed():
	visible = false
	if not quest_andamento[npc_atual]:
		posicoes[npc_atual] = FALAS[npc_atual][posicoes[npc_atual]][2][1]
		caixa_texto(posicoes[npc_atual], npc_atual)
	else:
		if quest(QUESTS[npc_atual][FALAS[npc_atual][posicoes[npc_atual]][0]][2]):
			quest_andamento[npc_atual] = false
			posicoes[npc_atual] = FALAS[npc_atual][posicoes[npc_atual]][2][1]
			caixa_texto(posicoes[npc_atual], npc_atual)
			print("aaa")
		else:
			print("bbb")
