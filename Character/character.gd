extends KinematicBody2D


var velocity = Vector2()

var GRAVITY = 9
var SPEED = 250
var JUMP_SPEED = -300
var ACCELERATION = 1000
var WALL_JUMP = 100
var JUMP_WALL = 200

export var controls: Resource = null

func _physics_process(delta):
	var move_input = Input.get_axis(controls.move_left, controls.move_right)
	velocity = move_and_slide(velocity, Vector2.UP)
	velocity.x = move_toward(velocity.x, move_input*SPEED, ACCELERATION*delta)
	velocity.y += GRAVITY
	if is_on_floor() and Input.is_action_just_pressed(controls.jump):
		velocity.y = JUMP_SPEED
	
	if is_on_wall() and Input.is_action_just_pressed(controls.move_left):
		velocity.y = -JUMP_WALL
		velocity.x = -WALL_JUMP
	if is_on_wall() and Input.is_action_just_pressed(controls.move_right):
		velocity.y = -JUMP_WALL
		velocity.x = WALL_JUMP
	
		
		
			
	# Wall slide
	if is_on_wall() and velocity.y > 30:
		velocity.y = 30	

	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
