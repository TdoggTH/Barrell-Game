extends CharacterBody3D

@export var cameracontroller : Node3D
@export var PlayerModel : CollisionShape3D

@export var speed : int = 12	# 
@export var fall_acceleration : int = 50
var camAngleYaw : float 	#Angle of CameraController
var crouchHeight : float = 0.5  #height of crouch
var playerHeight  : float = 2.0
var crouching  = false

var acceleration : float = 0.2
var decceleration : float = 0.2

var inputDir : Vector2 = Vector2.ZERO
var target_velocity
var target_angle 

func crouch():
	if Input.is_action_pressed("crouch"):
		crouching = !crouching
		if crouching:
			PlayerModel.shape.height = crouchHeight
		else:
			PlayerModel.shape.height = playerHeight
		pass
	pass


func _ready():
	target_velocity = Vector3.ZERO
	#playerHeight = PlayerModel.transform.basis.y
	#crouchHeight = PlayerModel.basis.y / 2

func _physics_process(delta : float):
	
	
	if not is_on_floor():
		target_velocity += get_gravity() * delta
		print(target_velocity)
	elif is_on_floor():
		target_velocity.y = 0.0
		
	# Get camera rotation for the direction later
	var camera_basis = cameracontroller.player_rotation_right
	var forward = camera_basis.z
	var right = camera_basis.x


	forward.y = 0
	right.y = 0
	 #set CameraController Angle y
	
	#self.rotate_y(camAngleYaw)
	
	#print(transform.basis)
	


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
		currentV = lerp(currentV, Vector2(direction.x, direction.z)*speed, acceleration)
	else:
		currentV = currentV.move_toward(Vector2.ZERO, decceleration)

	target_velocity = Vector3(currentV.x, target_velocity.y, currentV.y)

	 #Vertical Velocity
	if Input.is_action_pressed("jump") and is_on_floor():
		target_velocity.y += 7

	
	#if not is_on_floor():
		#target_velocity.y = target_velocity.y - (fall_acceleration * delta)
		
	crouch()
		#while (PlayerModel.transform.basis.y != crouchHeight):
		#playerHeight = playerHeight.lerp(crouchHeight, (0.2))  #set playerHeight and desired CrouchHeight than transition between them with lerp
		#PlayerModel.transform.basis.y = (playerHeight)
		
		#print(playerHeight.lerp(crouchHeight, delta))
		
		#PlayerModel.global_transform.basis.y = crouchHeight #CollisionShape3D of type Player

		#need to make gun transform constant
		
	
	print(target_velocity)
	velocity = target_velocity
	move_and_slide()
