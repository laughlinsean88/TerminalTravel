extends MeshInstance3D

@onready var anim = $"../AnimationPlayer"

func _ready():
	GlobalSignals.on_complete_case.connect(close_case)
	anim.play_backwards("MClose")
	
func close_case():
	anim.play("MClose")
	
func open_case():
	anim.play_backwards("MClose")
