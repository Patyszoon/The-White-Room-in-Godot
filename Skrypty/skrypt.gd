extends CharacterBody3D

@export var speed = 12

var target_velocity = Vector3.ZERO

func _ready():
	pass 
	
func _process(delta):
	pass

func _physics_process(delta: float):
	var direction = Vector3.ZERO
	
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_down"):
		direction.z += 1
	if Input.is_action_pressed("move_up"):
		direction.z -= 1
		
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.look_at(position + direction, Vector3.UP)

	if direction != Vector3.ZERO:
		target_velocity.x = direction.x * speed
		target_velocity.z = direction.z * speed

	velocity = target_velocity
	move_and_slide()
	
