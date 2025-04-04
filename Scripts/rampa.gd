extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		body.rotation = -44.8
		



func _on_body_exited(body: Node2D) -> void:
	if body.name == "player":
		body.rotation = 0
