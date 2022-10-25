extends KinematicBody2D

var GRAVITY = 9
var SPEED = 50
var velocity = Vector2()
var LeftFloor = true
var RightFloor = true
var threshold = 256

var target_pos = Vector2()

onready var Player1 = get_parent().get_child(1)
onready var Player2 = get_parent().get_child(2)

func _physics_process(delta):
	velocity.y += GRAVITY*delta
	_near_player()
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
			
	move_and_slide(velocity)
	
		
	
	
func _near_player():
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
	LeftFloor = true


func _on_CollisionLeft_body_exited(body):
	LeftFloor = false


func _on_CollisionRight_body_entered(body):
	RightFloor = true
	
func _on_CollisionRight_body_exited(body):
	RightFloor = false




func _on_HitArea_body_entered(body):
	if body == Player1 or body == Player2:
		body.take_damage()
		#knockback() ??
