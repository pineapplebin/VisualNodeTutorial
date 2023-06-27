extends Control

@export var node: PackedScene = load("res://scenes/simple_graph_node.tscn")
@export var node_initial_position: Vector2 = Vector2(40, 40)


func _on_add_node_btn_pressed():
	var instance = node.instantiate() as GraphNode

	var length = $GraphEdit.get_child_count()
	instance.position_offset += node_initial_position + Vector2(10, 10) * length

	$GraphEdit.add_child(instance)


func _on_run_button_pressed():
	pass  # Replace with function body.


func _on_graph_edit_connection_request(
	from_node: StringName, from_port: int, to_node: StringName, to_port: int
):
	if from_node == to_node:
		return
	$GraphEdit.connect_node(from_node, from_port, to_node, to_port)


func _on_graph_edit_disconnection_request(
	from_node: StringName, from_port: int, to_node: StringName, to_port: int
):
	$GraphEdit.disconnect_node(from_node, from_port, to_node, to_port)
