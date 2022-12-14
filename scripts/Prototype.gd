extends Node

onready var players:= {
	"1": {
		viewport = $GridContainer/ViewportContainer/Viewport,
		camera = $GridContainer/ViewportContainer/Viewport/Camera2D,
		player = $GridContainer/ViewportContainer/Viewport/Prototype/Player1,
		
	},
	"2": {
		viewport = $GridContainer/ViewportContainer2/Viewport,
		camera = $GridContainer/ViewportContainer2/Viewport/Camera2D,
		player = $GridContainer/ViewportContainer/Viewport/Prototype/Player2,
	
	}
}


func _ready() -> void:
	$music.play()
	players["2"].viewport.world_2d = players["1"].viewport.world_2d
	for node in players.values():
		var remote_transform = RemoteTransform2D.new()
		remote_transform.remote_path = node.camera.get_path()
		node.player.add_child(remote_transform)
