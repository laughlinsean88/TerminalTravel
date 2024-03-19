class_name BriefcaseAnim
extends MeshInstance3D

@onready var anim = $"../AnimationPlayer"
@export var case_num = 1

	
func _ready():
	GlobalSignals.on_complete_case.connect(close_case)
	anim.play_backwards("Action_001")
	await anim.animation_finished
	anim.play_backwards("Action_002")
	
func close_case(case : int):
	if case == case_num:
		anim.play("Action_002")
		await anim.animation_finished
		anim.play("Action_001")
	else: return

