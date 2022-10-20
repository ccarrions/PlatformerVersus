extends Node2D


var lives = 3
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	
	if lives == 2:
		$Heart3.hide()
	if lives == 1:
		$Heart2.hide()	
	if lives == 0:
		$Heart1.hide()	

func decrease():
	print(lives)
	if lives > 0:
		lives -= 1 

func reset():
	lives = 3
	$Heart1.show()
	$Heart2.show()
	$Heart3.show()		
		
