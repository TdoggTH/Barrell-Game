class_name Barrell extends RigidBody3D

var is_picked_up : bool
var holder : Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	is_picked_up = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_picked_up:
		collision_layer = 2
		global_transform.origin = Vector3(
			holder.global_transform.origin.x,
			holder.global_transform.origin.y + 0.5,
			holder.global_transform.origin.z + 1
		)
	else: collision_layer = 1
