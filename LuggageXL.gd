extends MeshInstance3D

@onready var anim = $"../AnimationPlayer"
@export var case_num = 3

func _ready():
	GlobalSignals.on_complete_case.connect(close_case)
	anim.play_backwards("closeXL")

func close_case(case : int):
	if case == case_num:
		anim.play("closeXL")
	else: return
