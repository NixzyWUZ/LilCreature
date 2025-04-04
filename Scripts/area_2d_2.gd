extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		Globais.AreaZoom = true


func _on_body_exited(body: Node2D) -> void:
	if body.name == "player":
		Globais.AreaZoom = false
	pass # Replace with function body.
