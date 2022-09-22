extends KinematicBody2D

# Script for playable character

var velocity = Vector2()

# No finales
var GRAVITY = 10
var SPEED = 200
var JUMP_SPEED = -300
var ACCELERATION = 900
var WALL_JUMP = 250
var JUMP_WALL = 300
var WALL_SLIDE = 20

export var controls: Resource = null

func _physics_process(delta):
	var move_input = Input.get_axis(controls.move_left, controls.move_right)
	velocity = move_and_slide(velocity, Vector2.UP)
	velocity.x = move_toward(velocity.x, move_input*SPEED, ACCELERATION*delta)
	velocity.y += GRAVITY	
	# Wall jump
	if Input.is_action_just_pressed(controls.jump):
		if is_on_floor():
			velocity.y = JUMP_SPEED
		if (not is_on_floor()) && nextToLeftWall():
			velocity.x += WALL_JUMP
			velocity.y -= JUMP_WALL
		if (not is_on_floor()) && nextToRightWall():
			velocity.x -= WALL_JUMP
			velocity.y -= JUMP_WALL
	if Input.is_action_just_released(controls.jump) && velocity.y < 0:
		velocity.y = 0	
			
	# Wall slide
	if nextToWall() and velocity.y > 20:
		
		if nextToRightWall() and Input.is_action_pressed(controls.move_right):
			velocity.y = WALL_SLIDE
		if nextToLeftWall() and Input.is_action_pressed(controls.move_left):
			velocity.y = WALL_SLIDE


func nextToWall():
	return nextToRightWall() or nextToLeftWall()

func nextToRightWall():
	return $RightWall.is_colliding()

func nextToLeftWall():
	return $LeftWall.is_colliding()		

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
