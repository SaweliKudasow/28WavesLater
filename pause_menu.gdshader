shader_type canvas_item;

uniform sampler2D screen_tex : hint_screen_texture, filter_nearest;
uniform float blur_strength = 2.5;

void fragment() {
	vec2 size = SCREEN_PIXEL_SIZE * blur_strength;
	vec4 color = vec4(0.0);
	
	color += texture(screen_tex, SCREEN_UV + vec2(-size.x, 0.0));
	color += texture(screen_tex, SCREEN_UV + vec2(size.x, 0.0));
	color += texture(screen_tex, SCREEN_UV + vec2(0.0, -size.y));
	color += texture(screen_tex, SCREEN_UV + vec2(0.0, size.y));
	
	COLOR = color * 0.25;
}
