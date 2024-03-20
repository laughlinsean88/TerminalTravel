class_name BriefcaseAnim
extends MeshInstance3D

@onready var anim = $"../AnimationPlayer"

func _ready():
	GlobalSignals.on_complete_case.connect(close_case)
	anim.play_backwards("Action_001")
	await anim.animation_finished
	anim.play_backwards("Action_002")
	
func close_case():
	anim.play("Action_002")
	await anim.animation_finished
	anim.play("Action_001")
	
func open_case():
	anim.play_backwards("Action_001")
	await anim.animation_finished
	anim.play_backwards("Action_002")
	

