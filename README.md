Swap between ships using the left and right arrow keys.

How to add a ship:

step 1: Create your own username folder under res://ships/"username"/ and add your ship's .tscn and .gd and any other scenes and scripts you create. (Assets go in separate assets/username/ folder)

step 2: Create variable that loads your ship resource:

  var ship_default = load("res://ships/default/ship_default.tscn")
  
  var ship_example = load("res://ships/hasjamon/ship_example.tscn")
  
  var ship_you = load("res://ships/you/ship_you.tscn")
  
step 3: increase ship_id and then use ship_add with your variable.

  ship_id += 1
  
  ship_add(ship_id, ship_example)
  
  ship_id += 1
  
  ship_add(ship_id, ship_you)

There you go. Now you should be able to swap to your ship as well. After confirming it works, you can commit to github and share your creation.
