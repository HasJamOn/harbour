Swap between ships using the left and right arrow keys.

How to add a ship:
step 1: Create your own username folder under res://ships/"username" and add your ship's .tscn and .gd and any other pieces you create.
step 2: Create variable that loads your ship resource:
  var default_ship = load("res://ships/default_ship/default_ship.tscn")
  var example_ship = load("res://ships/hasjamon/example_ship.tscn")
  var example_ship = load("res://ships/you/your_ship.tscn")
step 3: increase ship_id and then use add_ship with your variable.
  ship_id += 1
  add_ship(ship_id, example_ship)
  ship_id += 1
  add_ship(ship_id, your_ship)

There you go. Now you should be able to swap to your ship as well. After confirming it works, you can commit to github and share your creation.
