extends Area2D

# Defining direction as a Vector2 variable
var direction: Vector2
const SPEED = 10
#Adding explosion when bullets hit the enemy
var explosion_scene = preload("res://scenes/explosion.tscn")
#Now to define movement in physics method
func _physics_process(delta: float) -> void:
	global_position += direction * SPEED


func _on_timer_timeout() -> void:
	queue_free() # Replace with function body.


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		#print("Enemy hit")
		
		body.queue_free()
		queue_free()
		
		var explosion = explosion_scene.instantiate()
		#Lets the set the explosion scene's position to this scene's position
		explosion.global_position = global_position
		explosion.emitting = true
		#Now to make variance in explosion lets make the lifetime a bit more random
		explosion.lifetime = randf_range(0.3, 0.5)
		
		$/root/Game.add_child(explosion)
