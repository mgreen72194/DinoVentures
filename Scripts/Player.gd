extends KinematicBody2D
signal hit

#import libraries
var anim_handler = AnimationsHandler.new()
var input_handler = InputHandler.new()
var constants = PlayerConstants.new()

var screen_size
var jumping = false
var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity.x = 0
	$AnimatedSprite.play()
	
	velocity = input_handler.check_input(jumping, velocity, constants.H_SPEED, constants.V_SPEED, is_on_floor())
	input_handler.attack()
	
	#jumping logic
	anim_handler.handle_animations($AnimatedSprite, velocity)
	
	velocity.y += constants.GRAVITY
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
	#confine player to screen
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
