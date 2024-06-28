extends MarginContainer

@export_multiline var TEXTO = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/HBoxContainer/Texto.text = TEXTO

