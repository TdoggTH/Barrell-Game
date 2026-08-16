class_name Barrell extends RigidBody3D

@export var health: Health

@onready var entities: Node3D = get_parent()

var is_picked_up : bool
var holder : Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(get_node("./"))
	health.connect("dies", _barrell_explode)
	is_picked_up = false

	entities.player.connect("pickup_interactable", _get_picked_up)
	print("barrell is ready")

func _barrell_explode() -> void:
	queue_free()

func _get_picked_up(storageVector) -> void:
	global_transform.origin = storageVector

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
