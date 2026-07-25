class_name Enemy extends CharacterBody3D

@export var gun: Gun

@export var health: Health

@export var enemyBehaviour: EnemyBehaviour

func _ready() -> void:
	health.connect("dies", _enemy_dies)

func _enemy_dies() -> void:
	queue_free()
