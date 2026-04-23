extends CharacterBody2D


const SPEED = 300.0
#const JUMP_VELOCITY = -400.0
func get_input():
	# This makes the characters right side keep facing the position the mouse is in.
	look_at(get_global_mouse_position())
	#Now lets define velocity to set CharacterBody2D's velocity
	#Lets get Vector2D local nodes's x axis by using transform.x
	#lets get -1 or 1 according to key binding which is passed on to input.getAxis([-1],[1])
	#Multiply it by variable speed to define the speed at which it would be moving example -300 or 300
	velocity.x = Input.get_axis("left","right") * SPEED
	velocity.y = Input.get_axis("up","down") * SPEED
	#Lets use lerp function to make the movement a little bit smoother
	#This makes adding real velocity to current velocity bit smoother
	velocity = lerp(get_real_velocity(), velocity, 0.1)

func _physics_process(delta: float) -> void:
	# To Add the gravity. but we don't need it so lets comment it
	#if not is_on_floor():
		#velocity += get_gravity() * delta

	# Handle jump. but we don't need it so lets comment it
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	# Calling function to move according to input, scratch that idea since everytime it calls the function it will just get the top input
	get_input()
	move_and_slide()
