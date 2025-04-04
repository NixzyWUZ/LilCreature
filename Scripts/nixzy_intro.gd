extends Control

@export var duration :float = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(duration).timeout
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
