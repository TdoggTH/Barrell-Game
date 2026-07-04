extends Node3D

var magazineSize: int
var fireRate: int


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print()
	reload()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:

	if Input.is_action_pressed("reload"):
		#might need to check if reloading is neccessary, like a if ammo != max_ammo
		reload()

func shoot() -> bool:
	#Create a ray that comes from a variable(? not created yet) and if the ray intersects with an enemy, return true so the parent method can determine the amount of damage done
	#return false if no intersection
	print("shooting from shooting.gd")
	return true


## Reload function spawns all the bullets in the magazine in an invisible state ready to be used
func reload():
	pass
