extends KinematicBody

var run_speed : float = 8.0

var time : float = 0.0

var step_freq : float = 2.0 #kuinka usein
var step_height : float = 0.2 #kuinka korkea tää hahmo hyppy
var step_tilt : float = 8.0 #astieta

onready var boddy_hinge = $BodyHinge # $ = kutsuu nodea

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	boddy_hinge.translation.y = step_height * (1 + sin(2.0 * PI * step_freq * time))
	boddy_hinge.rotation_degrees.z = step_tilt * sin(PI * step_freq * time)
	time += delta
	
	move_and_slide(Vector3(0, 0, -run_speed))
