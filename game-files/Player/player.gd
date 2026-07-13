extends CharacterBody3D

@export var cameracontroller : Node3D

# How fast the player moves in meters per second.
@export var speed = 12
# The downward acceleration when in the air, in meters per second squared.
@export var fall_acceleration = 1
var acceleration = 0.2
var decceleration = 0.2

var inputDir : Vector2 = Vector2.ZERO
var target_velocity

func _ready():
	target_velocity = Vector3.ZERO
	print(transform.basis)
	

func _rotatePlayer(player_rotation):
	global_transform.basis = Basis.from_euler(player_rotation)
	#print(player_rotation)

func _physics_process(delta : float): 
	if not is_on_floor():
		velocity += get_gravity() * delta
	

	transform.basis = cameracontroller.transform.basis
	
	inputDir = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var currentV = Vector2(target_velocity.x, target_velocity.z)
	var direction = (transform.basis * Vector3(inputDir.x, 0 , inputDir.y)).normalized()
	#var direction = (transform.basis * Vector3(inputDir.x, 0 , inputDir.y)).normalized()
	print(inputDir.x, " ", inputDir.y,)
	
	if direction:
		currentV = lerp(currentV, Vector2(direction.x, direction.z)*speed, acceleration)
	else:
		currentV = currentV.move_toward(Vector2.ZERO, decceleration)
	
	target_velocity = Vector3(currentV.x, velocity.y, currentV.y)
	velocity = target_velocity
	
	move_and_slide()
	
	 #Vertical Velocity
	if Input.is_action_pressed("jump") and is_on_floor():
		target_velocity.y = 0
		target_velocity.y += 50

	if not is_on_floor():
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)
