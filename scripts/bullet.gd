extends Area2D

var SPEED = 100

func _physics_process(delta):
	position += SPEED * transform.x * delta
	
<<<<<<< Updated upstream
=======
	
func _ready():
	connect("body_entered", self, "on_body_entered")
	

	
>>>>>>> Stashed changes
