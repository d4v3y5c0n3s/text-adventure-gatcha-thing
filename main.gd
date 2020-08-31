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
	AlignText()

#  aligns the text so that they are in order, deletes text once there is too much on screen (when the combined height of the text is larger than that of the "text area")
func AlignText():
	var current_text = $"text area".get_children()
	var text_height = 0
	var text_aligned = false
	while not text_aligned:
		for i in current_text:
			text_height += i.get_size().y

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	pass
