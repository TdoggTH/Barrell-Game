extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reload()

signal shoot

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var bullet
	if Input.is_action_pressed("shoot"):
		#i just realised that this needs to be a signal, if this continues that means that all the enemies will shoot at the same time as you LOL
		translate(Vector3(0,0,0))
	if Input.is_action_pressed("reload"):
		#might need to check if reloading is neccessary, like a if ammo != max_ammo
		reload()

## Reload function spawns all the bullets in the magazine in an invisible state ready to be used
func reload():
	pass
