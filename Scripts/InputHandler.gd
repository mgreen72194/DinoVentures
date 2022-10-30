extends Node
class_name InputHandler

#checking for player input
func check_input(jumping, velocity, h_speed, v_speed, on_floor):
	var left = Input.is_action_pressed("move_left")
	var right = Input.is_action_pressed("move_right")
	var jump = Input.is_action_just_pressed("jump")
	if left:
		velocity.x -= h_speed
	if right:
		velocity.x += h_speed
	if jump and on_floor:
		jumping = true
		#play jumping anim
		velocity.y = v_speed
	if jumping and on_floor:
		jumping = false
	return velocity

func attack():
	#Spawn fireball
	if Input.is_action_just_released("q_attack"):
		print("Attacking")
