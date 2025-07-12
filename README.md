IMPORTANT FOR THE CODE TO WORK!

This most be attached to your node3D for you fps arms model, well, that's what I did at least. My FPS arms are also a child of the camera, but they don't really need to be I assume.
Also, there is some comments explaining in the script itself, but you may need to read this to figure it out. The y_mouse_input is set in a different script, I get the event.relative.x from an unhandled_input function
which I then set to the y_mouse_input like this:

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		if abs(event.relative.x) > 1: # This can be changed to your liking to set how intense the movement needs to be for the arms to rotate, or just remove it if you don't want anything like that
			fps_arms.y_mouse_input = event.relative.x


My code is a bit wonky as the model is flipped around and needs to be at -180 to face the camera's direction, so you obviously need to adjust the first number on target_y to the normal rotation you want the arms at.
And you may need to set the - that follows it to a +.

That's about all, hopefully this helps someone and they can actually figure the code out with my explanations...
