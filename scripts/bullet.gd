extends Area2D

var SPEED = 100

func _physics_process(delta):
	position += SPEED * transform.x * delta
	
<<<<<<< Updated upstream
<<<<<<< Updated upstream
=======
=======
>>>>>>> Stashed changes
	
func _ready():
	connect("body_entered", self, "on_body_entered")
	

	
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
