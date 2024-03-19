extends MeshInstance3D

@onready var anim = $"../AnimationPlayer"

func _ready():
	anim.play_backwards("MClose")
