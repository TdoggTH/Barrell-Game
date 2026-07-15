extends Control

var paused : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_pressed("menu") and not paused:
		paused = !paused
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	elif Input.is_action_pressed("menu") and paused:
		paused = !paused
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

	pass
