extends CharacterBody2D

@onready var ap = $AnimatedSprite2D
@onready var cs = $CollisionShape2D
@onready var ladder_ray_cast: RayCast2D = $LadderRayCast

const SPEED = 220.0
const JUMP_VELOCITY = -320.0

func _physics_process(delta: float) -> void:
	var ladderColiider = ladder_ray_cast.get_collider()
	
	if ladderColiider: 
		_ladder_climb(delta)
		print("can climb")
		ap.play("idle")
	else:
		_moviment(delta)
	
	move_and_slide()
	
func _ladder_climb(delta):
	var direction := Vector2.ZERO
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")
	
	if direction: 
		velocity = direction * SPEED
	else:
		velocity = Vector2.ZERO
	
func _moviment(delta):
	#Animação caindo
	if velocity.y > 0:
		$AnimatedSprite2D.play("falling")
	
		# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		
		if direction > 0:
			velocity.x = direction * SPEED
			ap.flip_h = false
			cs.position.x = 8
			ladder_ray_cast.position.x = 7
			ap.play("Walk")
		else:
			velocity.x = direction * SPEED
			ap.flip_h = true
			cs.position.x = -8
			ladder_ray_cast.position.x = -7
			ap.play("Walk")
	
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		ap.play("idle")
		
		if Input.is_action_pressed("ui_up"):
			ap.play("lookUP")
		else:
			ap.play("idle")
	
	#crouch
	if Input.is_action_pressed("ui_down"):
		$AnimatedSprite2D.play("crouch")
		cs.rotation_degrees = 90
		cs.position.y = 9.0
	else:
		cs.rotation_degrees = 0
		cs.position.y = 0
