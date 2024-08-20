class_name ShopOption
extends PanelContainer

@onready var name_label = $Name as Label
@onready var price_label = $Price as Label
var shop: Shop
var unit_type: Unit.UNIT_TYPE

func _on_button_pressed():
	shop.purchase_unit(self)
