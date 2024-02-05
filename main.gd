extends Node2D
var ships := {} # Empty Dictionary for storing the ships and giving them a number to identify them by.
var ship_id := 0
var max_ship_id := 0
var current_ship = null

var default_ship = load("res://ships/default_ship/default_ship.tscn")
var example_ship = load("res://ships/hasjamon/example_ship.tscn")
var hayley_ship = load("res://ships/hasjamon/hayley_ship.tscn")

func add_ship(ship_id, ship_name):
	ships[ship_id] = ship_name

func _ready() -> void:
	# Load and add the default ship
	if default_ship != null:
		current_ship = default_ship.instantiate()
		current_ship.position = Vector2(500,300)
		self.add_child(current_ship)
	print("Loaded and added default ship.")
	
	add_ship(ship_id, default_ship)
	ship_id += 1
	add_ship(ship_id, example_ship)
	ship_id += 1
	add_ship(ship_id, hayley_ship)
	max_ship_id = ship_id
	ship_id = 0

func _process(delta: float) -> void:
	var ship_position = current_ship.position
	var ship_rotation = current_ship.rotation
	if Input.is_action_just_pressed("next_ship"):
		if current_ship != null:
			if ship_id >= max_ship_id:
				current_ship.queue_free()
				ship_id = 0
				current_ship = ships[ship_id].instantiate()
				current_ship.position = ship_position
				current_ship.rotation = ship_rotation
				self.add_child(current_ship)
			else:
				current_ship.queue_free()
				ship_id += 1
				current_ship = ships[ship_id].instantiate()
				current_ship.position = ship_position
				current_ship.rotation = ship_rotation
				self.add_child(current_ship)
		else: 
			print("There is no ship to remove")
	if Input.is_action_just_pressed("previous_ship"):
		if current_ship != null:
			if ship_id >= max_ship_id:
				current_ship.queue_free()
				ship_id = 0
				current_ship = ships[ship_id].instantiate()
				current_ship.position = ship_position
				current_ship.rotation = ship_rotation
				self.add_child(current_ship)
			else:
				current_ship.queue_free()
				ship_id -= 1
				if ship_id < 0:
					ship_id = max_ship_id
				current_ship = ships[ship_id].instantiate()
				current_ship.position = ship_position
				current_ship.rotation = ship_rotation
				self.add_child(current_ship)
		else: 
			print("There is no ship to remove")
		
