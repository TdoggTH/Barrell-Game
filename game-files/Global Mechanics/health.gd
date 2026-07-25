class_name Health extends Node

signal dies

@export var maxHealthPoints: int

var currentHealthPoints: int

func _ready() -> void:
	currentHealthPoints = maxHealthPoints

func _process(_delta: float) -> void:
	# Update health status
	if currentHealthPoints <= 0:
		dies.emit()

func take_damage(damage) -> void:
	currentHealthPoints -= damage
