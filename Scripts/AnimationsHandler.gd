extends Node
class_name AnimationsHandler


func handle_animations(sprite, velocity):
		#choose animations
	if velocity.y < 0:
		sprite.animation = "jump"
	elif velocity.y > 0:
		sprite.animation = "falling"
	elif velocity.x != 0:
		sprite.animation = "walk"
		sprite.flip_h = velocity.x < 0
	else:
		sprite.animation = "idle"
