extends KinematicBody2D

const ACCELERATION = 500
const MAX_SPEED = 80
const FRICTION = 500

var velocity = Vector2.ZERO # Vector2 - x and y position combined

func _physics_process(delta): #called everytime physics updates
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		#velocity += input_vector * ACCELERATION * delta
		#velocity = velocity.clamped(MAX_SPEED) //te 2 linijki zastąpione kolejną
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	
	#move_and_collide(velocity * delta) handles movement and collisons - automatically works for colliders
	velocity = move_and_slide(velocity)
	#unlike move and collide, you should not multiply by delta
	#also, adding velocity = makes slight lags in corners disappear cuz it remembers velocity that was before going into a corner
	
		
#comment c:
