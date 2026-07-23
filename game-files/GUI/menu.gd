extends Control

var paused : bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	get_tree()
	
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	
	
	if Input.is_action_pressed("menu") and not paused :
		var tween = create_tween()
		if tween.is_running() and not tween.has_tweeners():
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			await tween.tween_interval(0.1).finished
			paused = !paused
		
			
	elif Input.is_action_pressed("menu") and paused:
		var tween = create_tween()
		if tween.is_running() and not tween.has_tweeners():
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
			await tween.tween_interval(0.1).finished
			paused = !paused
			
	pass
	
