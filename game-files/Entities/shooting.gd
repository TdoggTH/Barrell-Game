extends Node3D

var magazineSize: int
var fireRate: int

@export var shot: RayCast3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print()

func shoot(gunRange: RayCast3D) -> CharacterBody3D:
	#Use the passed ray to shoot and find any intersections
	#returns the target hit if there is an object in the intersection
	#returns null if there is nothing in the raycast
	var hit = gunRange.get_collider()
	return hit
	#if hit:
		#hit.


## Reload function spawns all the bullets in the magazine in an invisible state ready to be used
func reload():
	pass
