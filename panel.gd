extends PathFollow3D

@export var item : WorldItem
var move_speed = 2.0

func _ready():
	GlobalSignals.on_pick_up.connect(check_item)

func _physics_process(delta):
	self.progress += move_speed * delta

func check_item():
	if item == null or item.is_queued_for_deletion(): return
	if item.has_picked_up == true:
		move_speed = 0
		
	
