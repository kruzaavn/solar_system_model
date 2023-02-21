shader_type spatial;

uniform vec4 color: source_color;
uniform vec4 fresnel_color: source_color;
uniform sampler2D fresnel_curve;
uniform sampler2D cloud_texture;
uniform float cloud_cut: hint_range(0.0, 1.0, 0.01);
uniform float wind_speed: hint_range(10.0, 20.0, 0.1);

vec4 apply_fresnel_layer(vec3 normal, vec3 view, vec4 base_color_layer, vec4 fresnel_color_layer) {
	
	float shade =  dot(normalize(normal), normalize(view));
	
	float fresnel_value = texture(fresnel_curve, vec2(shade, 0.0)).r;
	
	vec4 layer = mix(base_color_layer, fresnel_color_layer, fresnel_value);
	
	return layer;
}

vec4 apply_cloud_layer(vec4 base_color, vec2 uv, float time) {
	
	vec2 sample_location = vec2(uv.x + (time * 1.0/wind_speed), uv.y );
	
	float cloud = texture(cloud_texture, sample_location).r;
	
	if (cloud >= cloud_cut) {
		base_color = vec4(cloud, cloud, cloud, 1.0);
	} 
	
	return base_color;
}


void fragment() {
	// Place fragment code here.
	
    vec4 albedo = apply_fresnel_layer(NORMAL, VIEW, color, fresnel_color);
	
	albedo = apply_cloud_layer(albedo, UV, TIME);
	
	ALBEDO = albedo.rgb;
		
	ALPHA = albedo.a;
	METALLIC = 0.0;
	ROUGHNESS = 1.0;
}