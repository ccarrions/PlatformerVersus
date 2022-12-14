extends Area2D

export var WinScreen = "res://scenes/WinScreen.tscn"

var Winner = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var root = get_tree().get_current_scene().get_node("GUI").get_node("WinScreen")

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", self, "win") # Replace with function body.
	
func win(body: Node):

	if body.get_name() == "Player1" and not Winner:
		Winner = true
		$Win.play()
		yield($Win, "finished")
		root.visible = true
		root.get_child(1).visible = true
		get_tree().paused = true
		
	elif body.get_name() == "Player2":
		Winner = true
		$Win.play()
		yield($Win, "finished")
		root.visible = true
		root.get_child(2).visible = true
		get_tree().paused = true
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
