extends CharacterBody2D

# Prep a signal for collisions
signal hit
# How fast the player will move (pixels/sec).
@export var speed = 400
# Size of the game window.
var screen_size

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

func get_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1	
	velocity = velocity.normalized() * speed
	if velocity.length() > 0:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	if velocity.x != 0:
		$AnimatedSprite2D.flip_h = velocity.x < 0
	#var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#velocity = input_dir * speed

func _physics_process(delta):
	get_input()
	move_and_slide()

#func _on_body_entered(body):
	#hide()
	#hit.emit()
	#$CollisionShape2D.set_deferred("disabled", true)
