extends Node3D

var magazineSize: int
var fireRate: int


@export var shot: RayCast3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print()

func shoot() -> CharacterBody3D:
	#Create a ray that comes from a variable(? not created yet) and if the ray intersects with an enemy, return true so the parent method can determine the amount of damage done
	#return false if no intersection
	print("shooting from shooting.gd")
	var hit = shot.get_collider()
	if hit:
		print("i hit ", hit)
	return hit
	#if hit:
		#hit.


## Reload function spawns all the bullets in the magazine in an invisible state ready to be used
func reload():
	pass
