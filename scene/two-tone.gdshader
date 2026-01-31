shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

void fragment() {
    COLOR = texture(screen_texture, SCREEN_UV);
	COLOR.rgb = vec3(COLOR.r + COLOR.g + COLOR.b)/3.0;
}
void vertex() {
	// Called for every vertex the material is visible on.
}



//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
