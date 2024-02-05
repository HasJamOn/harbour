extends Sprite2D
var normal_speed := 600.0
var boost_speed := 1500.0
var boost_active := false

var max_speed := normal_speed
var velocity := Vector2(0,0)
var steering_factor := 2.0

var boost_sparkle_ressource = load("res://ships/hasjamon/boost_sparkle.tscn")
var boost_sparkle = boost_sparkle_ressource

func _ready() -> void:
	boost_sparkle = boost_sparkle_ressource

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction := Vector2(0,0)
	direction.x = Input.get_axis("move_left","move_right")
	direction.y = Input.get_axis("move_up","move_down")
	
	if direction.length() > 1.0:
		direction = direction.normalized()
	
	if Input.is_action_just_pressed("boost"):
		if boost_active == false:
			boost_active = true
			max_speed = boost_speed
			get_node("Timer").start()
			#boost flair
			get_node("sparkle_Timer").start()
			boost_sparkle = boost_sparkle_ressource.instantiate()
			boost_sparkle.position.x -= 36
			self.add_child(boost_sparkle)
			$boostsound_audiostreamplayer.play()
		else:
			print("boost is already active")
	
	var desired_velocity := max_speed * direction
	var steering := desired_velocity - velocity
	velocity += steering * steering_factor * delta
	position += velocity * delta
	
	if direction.length() > 0.0:
		rotation = velocity.angle()
	#print(rotation_degrees)
	if rotation_degrees < -90:
		set_flip_v(true)
		#print("flip1")
	elif rotation_degrees < 90:
		set_flip_v(false)
		#print("flip2")
	elif rotation_degrees > -90:
		set_flip_v(true)
		#print("flip3")
	

	
func _on_timer_timeout() -> void:
	boost_active = false
	max_speed = normal_speed
	get_node("sparkle_Timer").stop()


func _on_sparkle_timer_timeout() -> void:
	boost_sparkle = boost_sparkle_ressource.instantiate()
	boost_sparkle.position.x -= 36
	self.add_child(boost_sparkle)
