extends CharacterBody3D



const SPEED = 5.0
const JUMP_VELOCITY = 15
const INERCIA = 60
const ACELERACAO = 5
const GRAVITY = 15
var acelecacao = Vector3(1,1,1)


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
		velocity.x = direction.x * SPEED * acelecacao.x / INERCIA
		velocity.z = direction.z * SPEED * acelecacao.z / INERCIA
	else:
		if acelecacao.x < 1:
			acelecacao.x = 1
			velocity.x = 0
		else:
			acelecacao.x -= 1
			velocity.x = sign(velocity.x) * SPEED * acelecacao.x / INERCIA
			
		if acelecacao.z < 1:
			acelecacao.z = 1
			velocity.z = 0
		else:
			acelecacao.z -= 1
			velocity.z = sign(velocity.z) * SPEED * acelecacao.z / INERCIA
			
		
	print(acelecacao)

	move_and_slide()
