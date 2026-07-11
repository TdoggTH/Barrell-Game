extends CharacterBody3D

@export var gun: Node3D

@export var health: Node3D

@export var enemyBehaviour: Node3D

func die() -> void:
	queue_free()
