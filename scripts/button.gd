extends Area2D

export(PackedScene) var Projectile

export var SpawnX = 0
export var SpawnY = 0




func _ready():
	connect("body_entered", self, "on_press")
	
func on_press(body: KinematicBody2D):
	var projectile = Projectile.instance()
	get_parent().add_child(projectile)
	
	projectile.global_position.x = SpawnX
	projectile.global_position.y = SpawnY
