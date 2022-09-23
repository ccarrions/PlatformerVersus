extends KinematicBody2D

var velocity = Vector2()

<<<<<<< Updated upstream
var GRAVITY = 9
=======
onready var death = $Death

var GRAVITY = 15
>>>>>>> Stashed changes
var SPEED = 250
var JUMP_SPEED = -300
var ACCELERATION = 1000
var WALL_JUMP = 100
var JUMP_WALL = 200


func _physics_process(delta):
	var move_input = Input.get_axis("move_left", "move_right")
	velocity = move_and_slide(velocity, Vector2.UP)
	velocity.x = move_toward(velocity.x, move_input*SPEED, ACCELERATION*delta)
	velocity.y += GRAVITY
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_SPEED
	
	if is_on_wall() and Input.is_action_just_pressed("move_left"):
		velocity.y = -JUMP_WALL
		velocity.x = -WALL_JUMP
	if is_on_wall() and Input.is_action_just_pressed("move_right"):
		velocity.y = -JUMP_WALL
		velocity.x = WALL_JUMP
<<<<<<< Updated upstream
	
=======
		
	if Input.is_action_just_released("jump") and velocity.y < 0 and not is_on_wall():
		velocity.y = 0	
>>>>>>> Stashed changes
		
		
			
	# Wall slide
	if is_on_wall() and velocity.y > 30:
		velocity.y = 30	
<<<<<<< Updated upstream
<<<<<<< Updated upstream

=======
	
	if position.y > 210:
		Respawn()
=======
>>>>>>> Stashed changes
	

func Respawn():
	position.x = -50
	position.y = 20
	velocity.x = 0
	velocity.y = 0
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
