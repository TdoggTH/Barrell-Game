extends CharacterBody3D

@export var cameracontroller : Node3D

# How fast the player moves in meters per second.
@export var speed = 12
# The downward acceleration when in the air, in meters per second squared.
@export var fall_acceleration = 14
var acceleration = 0.2
var decceleration = 0.2

var inputDir : Vector2 = Vector2.ZERO
var target_velocity

func _ready():
	target_velocity = Vector3.ZERO

func _physics_process(delta : float):
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get camera rotation for the direction later
	var camera_basis = cameracontroller.global_transform.basis
	var forward = camera_basis.z
	var right = camera_basis.x

	print(cameracontroller.global_transform.basis)

	print(Basis(right.normalized(), Vector3(0, 1, 0), forward.normalized()))

	forward.y = 0
	right.y = 0




	print(Basis(right.normalized(), Vector3(0, 1, 0), forward.normalized()))

	# Get direction and adjust to where camera is facing
	inputDir = Input.get_vector(
		"move_left", "move_right",
		"move_forward", "move_back")
	var direction = (
		Basis(right.normalized(), Vector3(0, 1, 0), forward.normalized())
		* Vector3(inputDir.x, 0 , inputDir.y)
		).normalized()

	var currentV = Vector2(target_velocity.x, target_velocity.z)

	if direction:
		currentV = lerp(currentV, Vector2(direction.x,
		direction.z)*speed, acceleration)
	else:
		currentV = currentV.move_toward(Vector2.ZERO, decceleration)

	target_velocity = Vector3(currentV.x, velocity.y, currentV.y)

	 #Vertical Velocity
	if Input.is_action_pressed("jump") and is_on_floor():
		target_velocity.y += 50

	if not is_on_floor():
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)

	velocity = target_velocity
	move_and_slide()
