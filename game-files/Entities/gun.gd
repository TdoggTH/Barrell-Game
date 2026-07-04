extends Node3D

@export var shooting: Node3D
@export var shootingTimer: Timer

#How big the gun's mag size is
@export var magazineSize: int

#How many bullets the gun shoots per minute
@export var fireRate: int

@export var damage: int

signal shot_someone(damage: int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	shooting.magazineSize = magazineSize

	var shotsPerSecond: int = fireRate / 60

	shootingTimer.wait_time = shotsPerSecond
	shootingTimer.stop()

	#reloads the weapon according to the specified previously specified initialisations
	shooting.reload()

func shoot():
	if shootingTimer.is_stopped() == true:
		if shooting.shoot():
			emit_signal("shot_someone", damage)
		shootingTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
