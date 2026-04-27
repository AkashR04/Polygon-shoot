extends CharacterBody2D


const SPEED = 100.0
# Lets get the player using on ready and root to get the Player from the scene
@onready var player = $/root/Game/Player

func _physics_process(delta: float) -> void:
	velocity = (player.global_position - global_position).normalized() * SPEED
	
	look_at(player.global_position)
	move_and_slide()
