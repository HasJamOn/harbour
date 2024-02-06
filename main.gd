extends Node2D
var ships := {} # Empty Dictionary for storing the ships and giving them a number to identify them by.
var ship_id := 0
var ship_id_max := 0
var ship_current = null

var ship_default = load("res://ships/default/ship_default.tscn")
var ship_example = load("res://ships/hasjamon/ship_example.tscn")
var ship_unicorn = load("res://ships/hasjamon/ship_unicorn.tscn")
var ship_monkeyrocket = load("res://ships/hasjamon/ship_monkeyrocket.tscn")

func ship_add(ship_id, ship_name):
	ships[ship_id] = ship_name

func _ready() -> void:
	# Load and add the default ship
	if ship_default != null:
		ship_current = ship_default.instantiate()
		ship_current.position = Vector2(500,300)
		self.add_child(ship_current)
	print("Loaded and added default ship.")
	
	ship_add(ship_id, ship_default)
	ship_id += 1
	ship_add(ship_id, ship_example)
	ship_id += 1
	ship_add(ship_id, ship_unicorn)
	ship_id += 1
	ship_add(ship_id, ship_monkeyrocket)
	ship_id_max = ship_id
	ship_id = 0

func _process(delta: float) -> void:
	var ship_position = ship_current.position
	var ship_rotation = ship_current.rotation
	if Input.is_action_just_pressed("ship_next"):
		if ship_current != null:
			if ship_id >= ship_id_max:
				ship_current.queue_free()
				ship_id = 0
				ship_current = ships[ship_id].instantiate()
				ship_current.position = ship_position
				ship_current.rotation = ship_rotation
				self.add_child(ship_current)
			else:
				ship_current.queue_free()
				ship_id += 1
				ship_current = ships[ship_id].instantiate()
				ship_current.position = ship_position
				ship_current.rotation = ship_rotation
				self.add_child(ship_current)
		else: 
			print("ship_current is null")
	if Input.is_action_just_pressed("ship_previous"):
		if ship_current != null:
			if ship_id > ship_id_max:
				ship_current.queue_free()
				ship_id = 0
				ship_current = ships[ship_id].instantiate()
				ship_current.position = ship_position
				ship_current.rotation = ship_rotation
				self.add_child(ship_current)
			else:
				ship_current.queue_free()
				ship_id -= 1
				if ship_id < 0:
					ship_id = ship_id_max
				ship_current = ships[ship_id].instantiate()
				ship_current.position = ship_position
				ship_current.rotation = ship_rotation
				self.add_child(ship_current)
		else: 
			print("ship_current is null")
		
