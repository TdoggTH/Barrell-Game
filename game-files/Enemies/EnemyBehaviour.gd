extends Node

@export var gun: Node3D
@export var gunRange: RayCast3D

var seePlayer: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	if gun.currentMag > 0:
		gun.shoot(gunRange)
	if gun.currentMag == 0:
		gun.reload()
