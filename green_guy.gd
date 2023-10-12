extends CharacterBody2D

const speed = 200

@export var player: Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D

func _physics_process(_delta: float) -> void:
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = dir * speed
	move_and_slide()
	
func makepath() -> void:
	nav_agent.target_position = player.global_position

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play()


func _on_path_timer_timeout():
	makepath()
