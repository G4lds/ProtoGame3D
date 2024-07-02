extends Node3D

@export var ID = -1


func _on_area_3d_body_entered(body):
	if "TIPO" in body and body.TIPO == "Player":
		get_parent().get_parent().npc_falando(true)
		get_parent().get_parent().falando(ID)
		print("area Entrada")


func _on_area_3d_body_exited(body):
	get_parent().get_parent().npc_falando(false)
	print("area saida")
