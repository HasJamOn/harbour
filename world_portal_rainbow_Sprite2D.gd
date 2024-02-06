extends Sprite2D
var scale_rate := Vector2(0.001,0.001)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	scale += scale_rate
	if scale > Vector2(1.03,1.03):
		scale_rate = Vector2(-0.001,-0.001)
	if scale < Vector2(0.97,0.97):
		scale_rate = Vector2(0.001,0.001)
