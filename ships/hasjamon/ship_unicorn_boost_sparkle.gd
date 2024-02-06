extends Sprite2D
var random = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("Timer").start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var random_range = random.randf_range(-1.0,1.0)
	position.x -= 0.1
	position.y += random_range
	scale = Vector2(random_range * 0.05, random_range * 0.05)
	rotation += 1.0


func _on_timer_timeout() -> void:
	queue_free()
