extends Area2D

var SPEED = 100

func _physics_process(delta):
	position += SPEED * transform.x * delta
	
