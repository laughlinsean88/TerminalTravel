extends MeshInstance3D

@onready var anim = $"../AnimationPlayer"

func _ready():
	anim.play_backwards("Action_001")
	await anim.animation_finished
	anim.play_backwards("Action_002")

