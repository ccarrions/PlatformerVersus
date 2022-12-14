extends KinematicBody2D

var GRAVITY = 9
var SPEED = 50
var velocity = Vector2()
var LeftFloor = true
var RightFloor = true
var Cicle = false
var ControlPlayer1 = false
var ControlPlayer2 = false
export var threshold = 128
var cooldown = false
var timer = 2
var CollisionVelocity = 0


var target_pos = Vector2()

onready var Tilemap = get_parent().get_node("TileMap")
onready var Player1 = get_parent().get_node("Player1")
onready var Player2 = get_parent().get_node("Player2")

func _ready():
	velocity.x = SPEED

func nextToRightWall():
	return $RightWall.is_colliding()

func nextToLeftWall():
	return $LeftWall.is_colliding()
	

func _physics_process(delta):
	velocity.y += GRAVITY*delta
	if cooldown == true:
		if timer > 1.5:
			if CollisionVelocity > 0 and LeftFloor:
				velocity.x = -CollisionVelocity
			elif CollisionVelocity < 0 and RightFloor:
				velocity.x = -CollisionVelocity
		else:
			velocity.x = 0
		timer -= delta
		if timer < 0:
			cooldown = false
			timer = 2
	_near_player()
	if not cooldown:
		if global_position.distance_to(target_pos) < threshold:
			if global_position.x > target_pos.x:
				if LeftFloor:
					velocity.x = -SPEED
				else:
					velocity.x = 0
			elif global_position.x < target_pos.x:
				if RightFloor:
					velocity.x = SPEED
				else:
					velocity.x = 0
		else:
			if nextToLeftWall():
				velocity.x = SPEED
			elif nextToRightWall():
				velocity.x = -SPEED
			elif not RightFloor: # Va hasta la derecha
				velocity.x = -SPEED
			elif not LeftFloor: # llega a la derecha ("se empieza un ciclo") y empeza a ir a la izquierda
				velocity.x = SPEED
			
	move_and_slide(velocity)
	
		
	
	
func _near_player():
	if ControlPlayer1:
		target_pos = Player2.global_position
	elif ControlPlayer2:
		target_pos = Player1.global_position
	else:
		var Distance_P1 = global_position.distance_to(Player1.global_position)
		var Distance_P2 = global_position.distance_to(Player2.global_position)
		if Distance_P1 < Distance_P2:
			target_pos = Player1.global_position
		elif Distance_P1 > Distance_P2:
			target_pos = Player2.global_position
		
	


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_CollisionLeft_body_entered(body):
	if body == Tilemap:
		LeftFloor = true


func _on_CollisionLeft_body_exited(body):
	if body == Tilemap:
		LeftFloor = false


func _on_CollisionRight_body_entered(body):
	if body == Tilemap:
		RightFloor = true
	
func _on_CollisionRight_body_exited(body):
	if body == Tilemap:
		RightFloor = false




func _on_HitArea_body_entered(body):
	if (body == Player1 and not ControlPlayer1) or (body == Player2 and not ControlPlayer2):
		cooldown = true
		CollisionVelocity = velocity.x
		body.take_damage()
		
	
		#knockback() ??

func _on_TakeControl_body_entered(body):
	if body == Player1:
		print("ControlPlayer1")
		ControlPlayer1 = true
		ControlPlayer2 = false
	elif body == Player2:
		print("ControlPlayer2")
		ControlPlayer1 = false
		ControlPlayer2 = true
		
