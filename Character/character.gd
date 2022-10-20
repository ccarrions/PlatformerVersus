extends KinematicBody2D

var velocity = Vector2()
var LIVES = 1
var GRAVITY = 9
var SPEED = 250
var JUMP_SPEED = -300
var ACCELERATION = 1000
var WALL_JUMP = 100
var JUMP_WALL = 200
var timer = 5
var DEAD = false

export var controls: Resource = null

func _physics_process(delta):
	if not DEAD:
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







func take_damage():
	LIVES -= 1
	if LIVES <= 0:
		die()

func die():
	DEAD = true
	self.global_position.x = 800
	self.global_position.y = 500
	$CollisionShape2D.set_deferred("disabled", true)
	self.hide()
	
	
	
	
func _process(delta):
	if DEAD:
		timer -= delta
		if timer < 0:
			self.global_position.x = 500
			self.global_position.y = 800
			LIVES = 1
			timer = 5
			DEAD = false
			$CollisionShape2D.set_deferred("disabled", false)
			self.show()
			
			
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
