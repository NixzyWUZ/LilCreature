extends Control

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Map!.tscn")

func _on_credits_pressed() -> void:
	$CreditsLabel.visible = true
	$Esc.visible = true

func _on_esc_pressed() -> void:
	$CreditsLabel.visible = false
	$Esc.visible = false
