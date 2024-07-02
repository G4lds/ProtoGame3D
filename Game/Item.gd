extends Node3D

@export var ID = -1


func _on_area_3d_body_entered(body):
	if "TIPO" in body and body.TIPO == "Player":
		body.inventario[ID] += 1
		print("area Entrada")
		queue_free()
