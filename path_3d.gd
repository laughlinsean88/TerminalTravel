extends Path3D

@onready var follow_path = $PathFollow3D
@onready var character = $PathFollow3D/npcOne

func _physics_process(delta):
	const move_speed := 4.0
	follow_path.progress += move_speed * delta
	character.get_node("AnimationPlayer").play("walk")
