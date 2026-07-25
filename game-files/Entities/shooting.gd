class_name Shooting extends Node

var magazineSize: int
var fireRate: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

#Use the passed ray to shoot and find any intersections
#returns the target hit if there is an object in the intersection
#returns null if there is nothing in the raycast
func shoot(gunRange: RayCast3D) -> CharacterBody3D:

	var hit = gunRange.get_collider()
	if hit and hit.is_class("CharacterBody3D"):
		return hit
	return null
