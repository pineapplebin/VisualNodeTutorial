extends GraphNode


func _ready():
	set_slot(0, true, 1, Color(1, 1, 1, 1), true, 1, Color(1, 1, 1, 1))


func _on_close_request():
	var graph = get_parent() as GraphEdit

	# disconnect all lines connected to this node
	var lines = graph.get_connection_list()
	for line in lines:
		if line.get("from") == name || line.get("to") == name:
			graph.disconnect_node(line.get("from"), line.get("from_port"), line.get("to"), line.get("to_port"))

	# remove itself
	queue_free()


func _on_resize_request(new_minsize: Vector2):
	size = new_minsize
