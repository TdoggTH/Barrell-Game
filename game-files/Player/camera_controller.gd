extends Node3D

var mouse_sensitivity : float = 0.05
var capture_mouse : bool
var mouse_input : Vector2
var crotation : Vector3

func _unhandled_input(event: InputEvent) -> void:
	capture_mouse = event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED
	if capture_mouse:
		mouse_input.x += -event.screen_relative.x * mouse_sensitivity
		mouse_input.y += -event.screen_relative.y * mouse_sensitivity
		print(mouse_input)
		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	mouse_input = Vector2.ZERO
	update_camera_rotation(mouse_input)

func update_camera_rotation(input: Vector2) -> void:
	crotation.x += input.y
	crotation.y += input.x 
	crotation.x = clamp(crotation.x, deg_to_rad(-90), deg_to_rad(90))
	
	var player_rotation = Vector3(0.0, crotation.y, 0.0)
	var camera_rotation = Vector3(crotation.x,0.0, 0.0)
	
	transform.basis = Basis.from_euler(camera_rotation)
	transform.basis = Basis.from_euler(player_rotation)
	
	crotation.z = 0.0
