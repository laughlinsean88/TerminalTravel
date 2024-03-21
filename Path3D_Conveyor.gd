extends Path3D

@export var panel :Array[PackedScene]
@onready var timer = $Timer
var speed_increase = 0

var j = 1
@export var panel_max = 17

func _ready():
	start_system()

func _on_timer_timeout():
	
	for i in range(j,j+1):
		var body = panel[i].instantiate()
		body.move_speed += speed_increase
		add_child(body)
	j += 1
	
	var count = j
	if count == panel_max:
		j = 0
	
func start_system():
		var head = panel[0].instantiate()
		add_child(head)
		timer.start()

func speed_up()-> void:
	speed_increase += 0.25
	print(speed_increase)
