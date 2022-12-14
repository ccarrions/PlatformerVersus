extends Node

onready var credits_container = $ScrollContainer/VBoxContainer
onready var scroll_container = $ScrollContainer
var scroll_speed = 1
var scroll_ended = false


func _ready():
	pass
	scroll_container.scroll_vertical = 0
	set_physics_process(false)
	yield(get_tree().create_timer(1), "timeout")
	set_physics_process(true)
	
	
func _physics_process(delta):
	var last_scroll = scroll_container.scroll_vertical
	scroll_container.scroll_vertical += scroll_speed
	var new_scroll = scroll_container.scroll_vertical
	if new_scroll == last_scroll:
		_try_end_scroll()
func _try_end_scroll():
	if not scroll_ended:
		scroll_ended = true
		yield(get_tree().create_timer(2), "timeout")
		get_tree().change_scene("res://scenes/StartMenu.tscn")
		
