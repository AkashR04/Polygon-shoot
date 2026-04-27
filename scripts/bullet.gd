extends Area2D

# Defining direction as a Vector2 variable
var direction: Vector2
const SPEED = 10
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
