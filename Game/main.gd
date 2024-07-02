extends Node3D

func falando(npc):
	$Control/Dialogo.falando(npc)

func npc_falando(falando):
		$Control/Dialogo.visible = falando

func _process(delta):
	$Control/Hud/TextEdit.text = str($Jogador.inventario[0]) +" | "+ str($Jogador.inventario[1]) +" | "+ str($Jogador.inventario[2]) +" | "+ str($Jogador.inventario[3]) +" | "+ str($Jogador.inventario[4])
	pass
