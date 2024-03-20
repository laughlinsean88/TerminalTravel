extends MeshInstance3D

@onready var anim = $"../AnimationPlayer"
@export var case_num = 2

func _ready():
	GlobalSignals.on_complete_case.connect(close_case)
	anim.play_backwards("MClose")
	
func close_case(case : int):
	if case == case_num:
		anim.play("MClose")
	else: return

func open_case():
	anim.play_backwards("MClose")
