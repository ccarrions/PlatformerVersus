extends Area2D

var SPEED = 50
var GRAVITY = 10



func _physics_process(delta):
	SPEED += GRAVITY
	position += SPEED * transform.y * delta
	
