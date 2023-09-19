extends Area2D

# signals:
signal hit

@export var speed = 400
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	hide()
	var start_position = Vector2(screen_size.x/2, screen_size.y/2)
	start(start_position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	
	# Bind movement actions to changes in velocity
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		
	# Normalize velocity and play the animation
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()	
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	# Change animations based on direction
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocity.x < 0 # true if going down
	elif velocity.y != 0:
		$AnimatedSprite2D.animation = "up"
		$AnimatedSprite2D.flip_v = velocity.y > 0


func start(pos):
	# start the game
	position = pos
	show()
	$CollisionShape2D.disabled = false


func _on_body_entered(body):
	# if hit, the player disappears
	hide()
	
	hit.emit()
	
	# disable hitbox so it doesn't trigger more than once
	$CollisionShape2D.set_deferred("disabled", true)
