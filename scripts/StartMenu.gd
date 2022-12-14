extends Control



# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _on_StartButton_pressed():
	get_tree().change_scene("res://scenes/SandBox.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/StartButton.grab_focus()  # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_OptionsButton_pressed():
	pass # Replace with function body.
