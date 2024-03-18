extends PathFollow3D



func _physics_process(delta):
	const move_speed := 2.0
	self.progress += move_speed * delta
