Shader "Custom/Shader1"
{
Properties {
        _MainTex ("Texture", 2D) = "white" {}
        _GlitchAmount ("Glitch Amount", Range(0.0, 1.0)) = 0.1
        _GlitchSpeed ("Glitch Speed", Range(1.0, 10.0)) = 1.0
    }
 
    SubShader {
        Tags { "RenderType"="Opaque" }
        LOD 200
 
        CGPROGRAM
        #pragma surface surf Lambert
 
        sampler2D _MainTex;
        float _GlitchAmount;
        float _GlitchSpeed;
 
        struct Input {
            float2 uv_MainTex;
        };
 
        void surf (Input IN, inout SurfaceOutput o) {
            float2 uv = IN.uv_MainTex;
            float time = _Time.y * _GlitchSpeed;
            
            float glitchAmount = sin(time) * _GlitchAmount;
            float2 offset = float2(glitchAmount, 0.0);
            uv += offset;
 
            fixed4 c = tex2D(_MainTex, uv);
            o.Albedo = c.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}


