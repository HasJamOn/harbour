extends Sprite2D
var normal_speed := 300.0
var boost_speed := 3000.0

var max_speed := normal_speed
var velocity := Vector2(0,0)
var steering_factor := 2.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction := Vector2(0,0)
	direction.y = Input.get_axis("move_up","move_down")
	direction.x = 1.0
	
	if direction.length() > 1.0:
		direction = direction.normalized()
	
	if Input.is_action_just_pressed("boost"):
		max_speed = boost_speed
		get_node("Timer").start()
	
	var desired_velocity := max_speed * direction
	var steering := desired_velocity - velocity
	velocity += steering * steering_factor * delta
	position += velocity * delta
	
	if direction.length() > 0.0:
		rotation = velocity.angle()
	
func _on_timer_timeout() -> void:
	max_speed = normal_speed
