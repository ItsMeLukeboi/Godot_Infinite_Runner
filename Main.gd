extends Spatial

#player movement variables
var run_speed : float = 10.0
var jump_lenght : float = 6.0
var jump_height : float = 2.0

onready var player = $Player
onready var camera_pivot = $CameraPivot

var initial_roadcount :int = 5
var road_scenes = [
	load("res://Road1.tscn"),
	load("res://Road2.tscn"),
	load("res://Road3.tscn"),
]
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	player.setup_jump(jump_lenght, jump_height, run_speed)
	
	for i in range(initial_roadcount):
		var road = make_random_road()
		road.translation.z = -(i+1) * 50
		add_child(road)


func _physics_process(delta):
	camera_pivot.translation = player.translation
	camera_pivot.translation.y = 0
	camera_pivot.translation.x = 0

func make_random_road():
	var road_scene = road_scenes[randi() % road_scenes.size()]
	var road = road_scene.instance()
	return road
