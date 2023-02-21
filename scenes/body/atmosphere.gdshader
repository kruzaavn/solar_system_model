shader_type spatial;

uniform vec4 color: source_color;
uniform sampler2D alpha;

float fresnel(vec3 normal, vec3 view) {
	
	float shade =  dot(normalize(normal), normalize(view));
	
	return texture(alpha, vec2(shade, 0.0)).r;
}


void fragment() {
	// Place fragment code here.
	
	ALBEDO = color.rgb;
		
	ALPHA = fresnel(NORMAL, VIEW);

}