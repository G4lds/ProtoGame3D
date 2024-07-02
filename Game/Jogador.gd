extends CharacterBody3D

const TIPO = "Player"
const VELOCIDADE = 5.0
const JUMP_VELOCITY = 12
const INERCIA = 33
const ACELERACAO = 5
const GRAVITY = 15
var acelecacao = Vector3(1,1,1)
var inventario = [0,0,0,0,0]


func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= GRAVITY * delta

	if Input.is_action_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	
		
	if direction:
		if acelecacao.x < INERCIA:
			acelecacao.x += 1 * abs(direction.x) * ACELERACAO
		if acelecacao.z < INERCIA:
			acelecacao.z += 1 * abs(direction.z) * ACELERACAO
		velocity.x = direction.x * VELOCIDADE * acelecacao.x / INERCIA
		velocity.z = direction.z * VELOCIDADE * acelecacao.z / INERCIA
		
	if acelecacao.x < 1:
		acelecacao.x = 1
		velocity.x = 0
	else:
		acelecacao.x -= 1
		velocity.x = sign(velocity.x) * VELOCIDADE * acelecacao.x / INERCIA
		
	if acelecacao.z < 1:
		acelecacao.z = 1
		velocity.z = 0
	else:
		acelecacao.z -= 1
		velocity.z = sign(velocity.z) * VELOCIDADE * acelecacao.z / INERCIA

	move_and_slide()
