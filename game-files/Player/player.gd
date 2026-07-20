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

@export var health: Node3D

@export var gun: Node3D
@export var gunRange: RayCast3D


func _ready():
	target_velocity = Vector3.ZERO

func _physics_process(delta : float):
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get camera rotation for the direction later
	var camera_basis = cameracontroller.player_rotation_right
	var forward = camera_basis.z
	var right = camera_basis.x

	forward.y = 0
	right.y = 0

	transform.basis = camera_basis

	# Get direction and adjust to where camera is facing
	inputDir = Input.get_vector(
		"move_left", "move_right",
		"move_forward", "move_back")
	var direction = (
		camera_basis
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

	if Input.is_action_pressed("shoot"):
		gun.shoot(gunRange)
	if Input.is_action_pressed("reload"):
		gun.reload()


func die() -> void:
	pass
