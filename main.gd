extends Node2D

onready var new_text = preload("text bubble.tscn")

#  adds new text to the screen
func AddText(strText, bAnchorRight=false):
	var txt = new_text.instance()
	txt.add_text(strText)
	if bAnchorRight:
		txt.set_anchor(MARGIN_LEFT, 1.0)#  currently this puts the text offscreen
	$"text area".add_child(txt)
	print("Text: '" + strText + "' has been successfully added.")
	DeleteOld()
	RealignText()

#  deletes text once there is too much on screen (when the combined height of the text is larger than that of the "text area")
func DeleteOld():
	if $"text area".get_child_count() <= 0:
		return
	else:
		var current_text = $"text area".get_children()
		var text_height = 0
		var cleared_old_text = false
		while not cleared_old_text:
			for i in current_text:
				text_height += i.get_size().y
			if text_height >= $"text area".get_size().y:
				$"text area".remove_child(current_text[0])
				text_height = 0
				current_text = $"text area".get_children()
			else:
				cleared_old_text = true
	return

#  spaces out the text appropriately onscreen so that nothing is on top of each other
func RealignText():
	var space_filled = 0
	for i in $"text area".get_children():
		var text_space = i.get_size().y
		i.set_position(Vector2(i.get_position().x, (text_space + space_filled)))
		space_filled += text_space

# Called when the node enters the scene tree for the first time.
func _ready():
	AddText("Hey cool, words")
	AddText("yo wat up my dudes")
	AddText("this is totally sick bro")
	AddText("this is totally sick bro")
	AddText("this is totally sick bro")
	AddText("this is totally sick bro")
	AddText("this is totally sick bro")
	AddText("this is totally sick bro")
	AddText("this is totally sick bro")
	AddText("that's a yikes there")

func _process(delta):
	pass
