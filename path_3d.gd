extends Path3D

@onready var follow_path = $PathFollow3D
@export var character: Array[Node3D] 
var i = 0

func _physics_process(delta):
	const move_speed := 4.0
	follow_path.progress += move_speed * delta
	character[i].get_node("AnimationPlayer").play("walk")

func change_character():
	i += 1
	if i == character.size(): i = 0
	print("change traveler")
	character[i].visible = true
	$Timer.start

func _on_timer_timeout():
	$Timer.stop
	character[i].visible = false
	change_character()

