extends Path3D

@onready var follow_path = $PathFollow3D

func _physics_process(delta):
	const move_speed := 2.0
	follow_path.progress += move_speed * delta
