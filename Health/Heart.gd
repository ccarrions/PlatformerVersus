extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var animation = $AnimationPlayer
onready var animtree = $AnimationTree

# Called when the node enters the scene tree for the first time.
func _ready():
	animtree.active = true
