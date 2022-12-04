extends KinematicBody2D

var velocity = Vector2()
var LIVES = 3
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

export var controls: Resource = null
export(NodePath) var selecLives
export var RespawnX = 0
export var RespawnY = 0
onready var Lives = get_node(selecLives)


func _ready():
	anim_tree.active = true



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
			
		#Animations
		if Input.is_action_just_pressed(controls.move_right) and not Input.is_action_just_pressed(controls.move_left):
			pivot.scale.x = 1
		if Input.is_action_just_pressed(controls.move_left) and not Input.is_action_just_pressed(controls.move_right):
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
	Lives.decrease()
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
		if timer < 0: # Respawn
			self.global_position.x = RespawnX
			self.global_position.y = RespawnY
			LIVES = 3
			timer = 5
			velocity.x = 0
			velocity.y = 0
			Lives.reset()
			DEAD = false
			$CollisionShape2D.set_deferred("disabled", false)
			self.show()
