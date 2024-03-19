extends Control

@onready var tutorial = $Tutorial

func _on_timer_timeout():
	self.queue_free()
