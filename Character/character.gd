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

onready var anim_tree = $AnimationTree
onready var playback = anim_tree.get("parameters/playback")
onready var pivot = $Pivot

func _ready():
	anim_tree.active = true

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
		
	#Animations
	if Input.is_action_just_pressed("p1_move_right") and not Input.is_action_just_pressed("p1_move_left"):
		pivot.scale.x = 1
	if Input.is_action_just_pressed("p1_move_left") and not Input.is_action_just_pressed("p1_move_right"):
		pivot.scale.x = -1
	if is_on_floor():
		if abs(velocity.x) > 10:
			playback.travel("run")
		else:
			playback.travel("idle")
	else:
		if velocity.y < 0:
			if is_on_wall():
				playback.travel("wall_jump")
			else:
				 playback.travel("jump")
		else:
			if is_on_wall():
				playback.travel("wall_jump")
			else:
				playback.travel("fall")



func take_damage():
	LIVES -= 1
	if LIVES <= 0:
		die()

func die():
	self.global_position.x = -1000
	self.global_position.y = -1000
	DEAD = true 
	
	
	
	
func _process(delta):
	if DEAD:
		print(timer)
		timer -= delta
		if timer < 0:
			self.global_position.x = 800
			self.global_position.y = 500
			timer = 5
			DEAD = false
# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
