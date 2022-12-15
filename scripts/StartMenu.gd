extends Control



# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _on_StartButton_pressed():
	$MarginContainer/StartButtons.visible = false
	$MarginContainer/LevelSelect.visible = true
	

func _on_QuitButton_pressed():
	get_tree().quit()

# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/StartButtons/StartButton.grab_focus()
	$menusong.play()  # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_CreditsButton_pressed():
	get_tree().change_scene("res://scenes/Credits.tscn")


func _on_OptionsButton_pressed():
	pass # Replace with function body.


func _on_BackButton_pressed():
	$MarginContainer/StartButtons.visible = true
	$MarginContainer/LevelSelect.visible = false


func _on_Level_1_pressed():
	get_tree().change_scene("res://scenes/Levels/SandBox.tscn")


func _on_Level_2_pressed():
	get_tree().change_scene("res://scenes/Levels/LevelProt.tscn")


func _on_Level_3_pressed():
	get_tree().change_scene("res://scenes/Levels/Level3.tscn")


func _on_Level_4_pressed():
	get_tree().change_scene("res://scenes/Levels/Level4.tscn")
