extends Control


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("jogAR"):
		get_tree().change_scene_to_file("res://Scenes/Map!.tscn")
