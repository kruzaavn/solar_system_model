shader_type spatial;

uniform vec4 color: source_color;
uniform vec4 fresnel_color: source_color;
uniform sampler2D fresnel_curve;

vec3 apply_fresnel(vec3 normal, vec3 view, vec3 base_color_layer, vec3 fresnel_color_layer) {
	
	float shade =  dot(normalize(normal), normalize(view));
	
	float fresnel_value = texture(fresnel_curve, vec2(shade, 0.0)).r;
	
	vec3 layer = mix(base_color_layer, fresnel_color_layer, fresnel_value);
	
	return layer;
}


void fragment() {
	// Place fragment code here.
	
    vec3 albedo = apply_fresnel(NORMAL, VIEW, color.rgb, fresnel_color.rgb);
	
	ALBEDO = albedo;
		
	ALPHA = 0.2;

}