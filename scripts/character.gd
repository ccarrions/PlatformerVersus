extends KinematicBody2D

# Script for playable character

var velocity = Vector2()

# No finales
var GRAVITY = 9
var SPEED = 200
var JUMP_SPEED = -300
var ACCELERATION = 500
var WALL_JUMP = 150
var JUMP_WALL = 30


func _physics_process(delta):
	print(velocity.y)
	var move_input = Input.get_axis("move_left", "move_right")
	velocity = move_and_slide(velocity, Vector2.UP)
	velocity.x = move_toward(velocity.x, move_input*SPEED, ACCELERATION*delta)
	velocity.y += GRAVITY
	print(velocity.y)
	# Wall jump
	if (is_on_floor() or nextToWall()) and Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_SPEED
		if not is_on_floor() and nextToRightWall():
			velocity.x -= WALL_JUMP
			velocity.y -= JUMP_WALL
		if not is_on_floor() and nextToLeftWall():
			velocity.x += WALL_JUMP
			velocity.y -= JUMP_WALL	
			
	# Wall slide
	if nextToWall() and velocity.y > 30:
		
		if nextToRightWall() and Input.is_action_pressed("move_right"):
			velocity.y = 30
		if nextToLeftWall() and Input.is_action_pressed("move_left"):
			velocity.y = 30	


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
