extends MeshInstance3D

@onready var anim = $"../AnimationPlayer"

func _ready():
	GlobalSignals.on_complete_case.connect(close_case)
	anim.play_backwards("closeXL")

func close_case():
	anim.play("closeXL")

func open_case():
	anim.play_backwards("closeXL")
	
