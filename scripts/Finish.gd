extends Area2D

export var WinScreen = "res://scenes/WinScreen.tscn"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var root = get_parent().get_parent().get_parent().get_parent().get_parent().get_child(1).get_child(1)

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", self, "win") # Replace with function body.
	print(root)
	
func win(body: Node):
	$Win.play()
	if body.get_name() == "Player1":
		root.visible = true
		root.get_child(1).visible = true
		get_tree().paused = true
		
	elif body.get_name() == "Player2":
		root.visible = true
		root.get_child(2).visible = true
		get_tree().paused = true
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
