extends Camera2D

@export var target : CharacterBody2D = null

func _ready():
	SignalBus.connect("set_camera_target", aquire_target)
	handle_signals()

func _physics_process(_delta):
	follow_target()

func follow_target()-> void:
	if target == null: return
	
	position = target.position
	
func aquire_target(target_charBody : CharacterBody2D)-> void:
	target = target_charBody
	
func handle_signals()-> void:
	pass
	
