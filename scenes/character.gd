extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2()

var GRAVITY = 6
var SPEED = 300
var JUMP_SPEED = -250

func _physics_process(delta):
	
	var move_input = Input.get_axis("move_left", "move_right")
	
	
	velocity.x = move_input*SPEED
	velocity.y += GRAVITY
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_SPEED
	

	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
