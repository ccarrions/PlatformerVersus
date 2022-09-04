extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity1 = Vector2()

var GRAVITY = 6
var SPEED = 300
var JUMP_SPEED = -250

func _physics_process(delta):
	
	var move_input1 = Input.get_axis("move_left1", "move_right1")
	
	
	velocity1.x = move_input1*SPEED
	velocity1.y += GRAVITY
	velocity1 = move_and_slide(velocity1, Vector2.UP)
	
	if is_on_floor() and Input.is_action_just_pressed("move_up1"):
		velocity1.y = JUMP_SPEED
	

	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
