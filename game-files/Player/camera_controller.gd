extends Node3D

@export var cameraController : Node3D

var mouse_sensitivity : float = 0.01
var capture_mouse : bool
var mouse_input : Vector2
var crotation : Vector3

var player_rotation_right : Basis

func _unhandled_input(event: InputEvent) -> void:
	capture_mouse = event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED
	if capture_mouse:
		mouse_input.x += -event.screen_relative.x * mouse_sensitivity
		mouse_input.y += -event.screen_relative.y * mouse_sensitivity
		update_camera_rotationx(mouse_input)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	mouse_input = Vector2.ZERO


func update_camera_rotationx(input: Vector2) -> void:
	crotation.x += input.y
	crotation.y += input.x
	crotation.x = clamp(crotation.x, deg_to_rad(-60), deg_to_rad(60))

	var player_rotation_up = Vector3(crotation.x, 0.0, 0.0)
	player_rotation_right = Basis.from_euler(Vector3(0.0, crotation.y, 0.0))
	#print(player_rotation_up)
	#print(Basis.from_euler(player_rotation))

	#print(Vector3(crotation.x, crotation.y, 0.0))

	player_rotation_up = Basis.from_euler(player_rotation_up)

	#print(player_rotation_up)

	cameraController.transform.basis = player_rotation_up
