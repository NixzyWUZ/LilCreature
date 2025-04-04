extends Control

@export var scroll_speed := 50  # Pixels por segundo
var start_position := Vector2()

func _ready():
	start_position = $Label.position
	$Label.position = Vector2(start_position.x, size.y)

func _process(delta):
	$Label.position.y -= scroll_speed * delta
	
	# Quando o texto sair totalmente da tela, volta ao início ou muda de cena
	if $Label.position.y + $Label.size.y < 0:
		# Mudar de cena, reiniciar, ou qualquer outra ação
		print("Créditos finalizados")
		get_tree().change_scene_to_file("res://Scenes/nixzy_intro.tscn")  # Exemplo
