extends Resource
class_name InventorySlot

var item: ItemData = null
var count: int = 0

func is_empty() -> bool:
	return item == null or count <= 0

func can_stack(other: ItemData) -> bool:
	return not is_empty() and item == other and item.is_stackable and count < item.max_stack

func clear():
	item = null
	count = 0
