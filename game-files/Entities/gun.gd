extends Node3D

@export var shooting: Node3D
@export var shootingTimer: Timer
@export var reloadTimer: Timer

@export var ammoCounter: Label3D

#How big the gun's mag size is
@export var magazineSize: int
var currentMag: int

#How many bullets the gun shoots per minute
@export var fireRate: int

@export var damage: int

signal shot_someone(damage: int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	shooting.magazineSize = magazineSize
	currentMag = magazineSize

	ammoCounter.text = String.num_int64(currentMag)

	print(shooting.magazineSize)

	#Should have this inside of Shooting node, but because we only have 1 gun it gets a pass
	var shotsPerSecond: int = fireRate / 60

	shootingTimer.wait_time = shotsPerSecond
	shootingTimer.stop()

	#reloads the weapon according to the specified previously specified initialisations
	shooting.reload()

func _process(delta: float) -> void:
	ammoCounter.text = String.num_int64(currentMag)

func shoot(gunRange: RayCast3D):
	if shootingTimer.is_stopped() and currentMag > 0 and reloadTimer.time_left == 0:
		currentMag -= 1

		var target = shooting.shoot(gunRange)
		if target:
			print("Gun: i shot ", target)
			#target.hit(damage) #rejig this in the enemy branch
		shootingTimer.start()

func reload() -> void:
	reloadTimer.start()


func _on_reload_timer_timeout() -> void:
	currentMag = magazineSize
