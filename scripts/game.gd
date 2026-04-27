extends Node2D

var enemy_scene = preload("res://scenes/enemies.tscn")
@onready var player = $Player
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var enemy = enemy_scene.instantiate()
	enemy.global_position = player.global_position
	
	while enemy.global_position.distance_squared_to(player.global_position) < 10000:
		enemy.global_position.x = randi_range(0, get_viewport_rect().size.x) 
		enemy.global_position.y = randi_range(0, get_viewport_rect().size.y) 
		
	add_child(enemy)
