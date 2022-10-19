extends Area2D



var SPEED = 50
var GRAVITY = 10

func _ready():
	connect("body_entered", self, "collision")
	
func collision(body : Node):
	if body.has_method("take_damage"):
		body.take_damage()
	self.queue_free()
	

	

func _physics_process(delta):
	SPEED += GRAVITY
	position += SPEED * transform.y * delta
	
