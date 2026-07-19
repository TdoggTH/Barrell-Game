extends Control

var paused : bool = false
var tween : Tween

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tween = create_tween()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_pressed("menu") and not paused:
		if not tween.is_valid():
			tween = create_tween()
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			await tween.tween_interval(0.5).finished
			paused = !paused
			tween.kill()

	elif Input.is_action_pressed("menu") and paused:
		if not tween.is_valid():
			tween = create_tween()
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
			await tween.tween_interval(0.5).finished
			paused = !paused
			tween.kill()
