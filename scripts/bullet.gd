extends Area2D

var SPEED = 100

func _physics_process(delta):
	position += SPEED * transform.x * delta
	
func _ready():
	connect("body_entered", self, "collision")
	
func collision(body : Node):
	if body.has_method("take_damage"):
		body.take_damage()
	self.queue_free()
	
