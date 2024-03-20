extends Node3D

@onready var anim = $AnimationPlayer
@onready var timer = $Timer

func _process(_delta):
	if timer.is_stopped():
		timer.start

func _on_timer_timeout():
	anim.play("stop")
