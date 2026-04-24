extends Area2D

# Defining direction as a Vector2 variable
var direction: Vector2
const SPEED = 4
#Now to define movement in physics method
func _physics_process(delta: float) -> void:
	global_position += direction * SPEED


func _on_timer_timeout() -> void:
	queue_free() # Replace with function body.
