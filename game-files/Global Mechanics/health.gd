extends Node3D

@export var character: CharacterBody3D
@export var maxHealthPoints: int

var currentHealthPoints: int

func _ready() -> void:
	currentHealthPoints = maxHealthPoints

func _process(_delta: float) -> void:
	# Update health status
	if currentHealthPoints <= 0:
		character.die()

func take_damage(damage) -> void:
	currentHealthPoints -= damage
