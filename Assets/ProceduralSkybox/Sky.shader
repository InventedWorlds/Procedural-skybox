
Shader "My shader/Sky" {
    Properties {
        _ColorDay ("ColorDay", Color) = (0.7725491,0.9843138,0.9921569,0.7019608)
        _ColorNight ("ColorNight", Color) = (0.01960784,0.02352941,0.03529412,1)
        _SunRadA ("SunRadA", Range(0, 0.1)) = 0.0223301
        _SunRadB ("SunRadB", Range(0, 0.1)) = 0.04155833
        _SunInten ("SunInten", Float ) = 1.7
        _cloudtext ("cloudtext", 2D) = "white" {}
        _niiseText ("niiseText", 2D) = "white" {}
        _SkyFar ("SkyFar", Range(0, 1)) = 0.2789011
        _CloudCuloff ("CloudCuloff", Float ) = 25
        _CloudTin ("CloudTin", Float ) = 0.1
        _CloudDis ("CloudDis", Range(0, 1)) = 0.9126214
        _MoveX ("MoveX", Float ) = 0
        _MoveZ ("MoveZ", Float ) = 0
        _CloudColor ("CloudColor", Color) = (1,1,1,1)
        _NightCloudColor ("NightCloudColor", Color) = (0.1137255,0.1098039,0.1176471,1)
        _CloudColorSnd ("CloudColorSnd", Color) = (0.9137256,0.9294118,0.9333334,1)
        _NightCloudColorSnd ("NightCloudColorSnd", Color) = (0.172549,0.1803922,0.1843137,1)
        _CloudColorTrd ("CloudColorTrd", Color) = (0.7843138,0.8980393,0.8980393,1)
        _NightCloudColorTrd ("NightCloudColorTrd", Color) = (0.08235294,0.08235294,0.08235294,1)
        _CoudDest ("CoudDest", Range(0, 1)) = 1
        _CoudDestSnd ("CoudDestSnd", Range(0, 1)) = 1
        _CoudDestTrd ("CoudDestTrd", Range(0, 1)) = 1
        _dessolve ("dessolve", Range(0, 10)) = 0
        _dessolveSnd ("dessolveSnd", Range(0, 10)) = 0
        _dessolveTrd ("dessolveTrd", Range(0, 10)) = 3.473291
        _SkyFarPeristie ("SkyFarPeristie", Range(0, 1)) = 0.3177361
        _CloudCuloffPeristie ("CloudCuloffPeristie", Float ) = 25
        _CloudTinPeristie ("CloudTinPeristie", Float ) = 0.25
        _CloudDisPeristie ("CloudDisPeristie", Range(0, 1)) = 0.9126214
        _MoveXPeristie ("MoveXPeristie", Float ) = 0
        _MoveZPeristie ("MoveZPeristie", Float ) = 0
        _CloudColorPerist ("CloudColorPerist", Color) = (1,1,1,1)
        _NightCloutColorPerist ("NightCloutColorPerist", Color) = (0.1146735,0.1198805,0.1544118,1)
        _CoudDesPeristie ("CoudDesPeristie", Range(0, 1)) = 0
        _dessolvePeristie ("dessolvePeristie", Range(0, 10)) = 0
        _SkyFarSloistie ("SkyFarSloistie", Range(0, 1)) = 0.3177361
        _CloudCuloffSloistie ("CloudCuloffSloistie", Float ) = 25
        _CloudTinSloistie ("CloudTinSloistie", Float ) = 0.35
        _CloudDisSloistie ("CloudDisSloistie", Range(0, 1)) = 0.9126214
        _MoveXSloistie ("MoveXSloistie", Float ) = 0
        _MoveZSloistie ("MoveZSloistie", Float ) = 0
        _CoudDesSloistie ("CoudDesSloistie", Range(0, 1)) = 0.1660586
        _dessolveSloistie ("dessolveSloistie", Range(0, 10)) = 0
        _SunsetColor ("SunsetColor", Color) = (0.9176471,0.3921569,0.1960784,1)
        _GroundLocation ("GroundLocation", Range(0, 1)) = 0.5
        _SharpHor ("SharpHor", Float ) = 5
        _HorWight ("HorWight", Range(0, 2)) = 2
        _SunsetSize ("SunsetSize", Float ) = 2
        _SunsetArc ("SunsetArc", Range(0, 1)) = 0.1629818
        _HorDest ("HorDest", Float ) = 7
        _SunsetEmbient ("SunsetEmbient", Float ) = 0.7
        _Highres ("Highres", Float ) = 5
        _HorizonCutoff ("HorizonCutoff", Float ) = 200
        _GroundColor ("GroundColor", Color) = (0.1411765,0.1843137,0.1764706,1)
        _StarPos ("StarPos", Float ) = 0.5
        _Stars ("Stars", 2D) = "white" {}
        _StarsInt ("StarsInt", Float ) = 0.8
        _Moon ("Moon", 2D) = "white" {}
        _MoonColor ("MoonColor", Color) = (1,1,1,1)
        _MoonIntens ("MoonIntens", Float ) = 0.7
        _MoonShadow ("MoonShadow", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
            "PreviewType"="Skybox"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _ColorDay;
            uniform float4 _ColorNight;
            uniform float _SunRadA;
            uniform float _SunRadB;
            uniform float _SunInten;
            uniform float _SkyFar;
            uniform float _MoveX;
            uniform float _MoveZ;
            uniform float _CloudTin;
            uniform float _dessolve;
            uniform sampler2D _cloudtext; uniform float4 _cloudtext_ST;
            uniform float _CloudDis;
            uniform float _CloudCuloff;
            uniform float _CoudDest;
            uniform float4 _CloudColor;
            uniform float4 _SunsetColor;
            uniform float4 _NightCloudColor;
            uniform float _GroundLocation;
            uniform float _SharpHor;
            uniform float _HorWight;
            uniform float _SunsetSize;
            uniform float _SunsetArc;
            uniform float _HorDest;
            uniform float _SunsetEmbient;
            uniform float _Highres;
            uniform float _HorizonCutoff;
            uniform float4 _GroundColor;
            uniform float _StarPos;
            uniform sampler2D _Stars; uniform float4 _Stars_ST;
            uniform float _StarsInt;
            uniform sampler2D _Moon; uniform float4 _Moon_ST;
            uniform float4 _MoonColor;
            uniform float _MoonIntens;
            uniform sampler2D _MoonShadow; uniform float4 _MoonShadow_ST;
            uniform float _dessolveSnd;
            uniform float _CoudDestSnd;
            uniform float4 _CloudColorSnd;
            uniform float4 _NightCloudColorSnd;
            uniform float _dessolveTrd;
            uniform float _CoudDestTrd;
            uniform float4 _CloudColorTrd;
            uniform float4 _NightCloudColorTrd;
            uniform sampler2D _niiseText; uniform float4 _niiseText_ST;
            uniform float _CoudDesPeristie;
            uniform float _dessolvePeristie;
            uniform float _SkyFarPeristie;
            uniform float _CloudDisPeristie;
            uniform float _CloudCuloffPeristie;
            uniform float _MoveXPeristie;
            uniform float _MoveZPeristie;
            uniform float _CloudTinPeristie;
            uniform float _SkyFarSloistie;
            uniform float _CloudDisSloistie;
            uniform float _CloudCuloffSloistie;
            uniform float _MoveXSloistie;
            uniform float _MoveZSloistie;
            uniform float _CloudTinSloistie;
            uniform float _CoudDesSloistie;
            uniform float _dessolveSloistie;
            uniform float4 _CloudColorPerist;
            uniform float4 _NightCloutColorPerist;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                LIGHTING_COORDS(2,3)
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float3 node_5024 = (-1*lightDirection);
                float node_200 = dot(float3(0,-3,0),node_5024);
                float node_4989 = saturate(node_200); // Положение света
                float3 node_9563 = lerp(_NightCloudColor.rgb,_CloudColor.rgb,node_4989);
                float2 node_7955 = float2(_MoveX,_MoveZ);
                float3 node_9422 = normalize(i.posWorld.rgb);
                float node_8464 = node_9422.g;
                float node_5008 = 0.0;
                float node_3649 = 1.0;
                float node_6261 = (_SkyFar+0.0075);
                float2 node_3041 = ((node_7955+(node_9422.rb/(node_6261 + ( (abs(node_8464) - node_5008) * (node_3649 - node_6261) ) / (node_3649 - node_5008))))*_CloudTin); // UV облаков
                float4 node_1903 = tex2D(_cloudtext,TRANSFORM_TEX(node_3041, _cloudtext)); // Текстура
                float4 _noize_copy = tex2D(_niiseText,TRANSFORM_TEX(node_3041, _niiseText)); // Шум
                float node_759 = node_9422.g;
                float node_3445 = 0.0;
                float node_3613 = 1.0;
                float node_6754 = (_SkyFar+0.015);
                float2 node_366 = ((node_7955+(node_9422.rb/(node_6754 + ( (abs(node_759) - node_3445) * (node_3613 - node_6754) ) / (node_3613 - node_3445))))*_CloudTin); // UV облаков
                float4 node_8046 = tex2D(_cloudtext,TRANSFORM_TEX(node_366, _cloudtext)); // Текстура
                float4 _noizeTrd_copy = tex2D(_niiseText,TRANSFORM_TEX(node_366, _niiseText)); // Шум
                float node_1381 = (1.0 - abs(node_9422.g));
                float2 node_2909 = node_9422.rb;
                float node_5512 = saturate(node_9422.g);
                float2 node_2706 = (node_2909+(node_2909*(1.0 - node_5512)));
                float4 _Stars_var = tex2D(_Stars,TRANSFORM_TEX(node_2706, _Stars));
                float4 _Moon_var = tex2D(_Moon,TRANSFORM_TEX(node_2706, _Moon));
                float4 _MoonShadow_var = tex2D(_MoonShadow,TRANSFORM_TEX(i.uv0, _MoonShadow));
                float3 node_9629 = lerp(_SunsetColor.rgb,_LightColor0.rgb,node_4989); // ЦветЗаката
                float node_6544 = max(0,dot(node_5024,viewDirection));
                float node_1651 = min(_SunRadA,_SunRadB);
                float node_3210 = (1.0 - (node_1651*node_1651));
                float node_756 = max(_SunRadA,_SunRadB);
                float node_7042 = 1.0;
                float node_9142 = node_9422.g;
                float node_1857 = 0.0;
                float node_1770 = 1.0;
                float2 node_4718 = ((float2(_MoveXSloistie,_MoveZSloistie)+(node_9422.rb/(_SkyFarSloistie + ( (abs(node_9142) - node_1857) * (node_1770 - _SkyFarSloistie) ) / (node_1770 - node_1857))))*_CloudTinSloistie); // UV облаков
                float4 node_5952 = tex2D(_cloudtext,TRANSFORM_TEX(node_4718, _cloudtext)); // Текстура
                float4 node_598 = tex2D(_niiseText,TRANSFORM_TEX(node_4718, _niiseText)); // Шум
                float node_2784 = node_9422.g;
                float node_1441 = 0.0;
                float node_7450 = 1.0;
                float2 node_5911 = ((float2(_MoveXPeristie,_MoveZPeristie)+(node_9422.rb/(_SkyFarPeristie + ( (abs(node_2784) - node_1441) * (node_7450 - _SkyFarPeristie) ) / (node_7450 - node_1441))))*_CloudTinPeristie); // UV облаков
                float4 node_5689 = tex2D(_cloudtext,TRANSFORM_TEX(node_5911, _cloudtext)); // Текстура
                float4 node_8704 = tex2D(_niiseText,TRANSFORM_TEX(node_5911, _niiseText)); // Шум
                float node_2368 = node_9422.g;
                float node_131 = 0.0;
                float node_9696 = 1.0;
                float2 node_243 = ((node_7955+(node_9422.rb/(_SkyFar + ( (abs(node_2368) - node_131) * (node_9696 - _SkyFar) ) / (node_9696 - node_131))))*_CloudTin); // UV облаков
                float4 node_3353 = tex2D(_cloudtext,TRANSFORM_TEX(node_243, _cloudtext)); // Текстура
                float4 node_8605 = tex2D(_niiseText,TRANSFORM_TEX(node_243, _niiseText)); // Шум
                float node_8287 = node_9422.g;
                float node_9660 = saturate(abs((((-2.0)*_GroundLocation)+1.0+node_8287)));
                float node_4367 = pow(node_6544,_SunsetSize);
                float node_6058 = 0.0;
                float node_1325 = 1.0;
                float node_1019 = ((saturate(pow((1.0 - node_9660),_SharpHor))*(_HorWight + ( (node_4367 - node_6058) * (node_1325 - _HorWight) ) / (node_1325 - node_6058)))*_SunsetEmbient*(node_4367/(node_9660+(1.0 - _SunsetArc)))*saturate(pow(((1.0 - saturate(abs(node_200)))+((_GroundLocation*0.5)*2.0)),_HorDest)));
                float3 finalColor = lerp(lerp(lerp(lerp(lerp(_NightCloudColorTrd.rgb,_CloudColorTrd.rgb,node_4989),lerp(lerp(_NightCloudColorSnd.rgb,_CloudColorSnd.rgb,node_4989),node_9563,lerp(1.0,(1.0 - (saturate((node_1903.r*saturate((1.0 - ((_dessolve+_dessolveSnd)*_noize_copy.r)))))*pow(saturate((node_8464+_CloudDis)),_CloudCuloff))),saturate((_CoudDestSnd+(-1.0)+_CoudDest)))),lerp(1.0,(1.0 - (saturate((node_8046.r*saturate((1.0 - ((_dessolveTrd+_dessolve)*_noizeTrd_copy.r)))))*pow(saturate((node_759+_CloudDis)),_CloudCuloff))),saturate((_CoudDestTrd+(-1.0)+_CoudDest)))),lerp(lerp(_NightCloutColorPerist.rgb,_CloudColorPerist.rgb,node_4989),lerp(node_9563,lerp(((node_1381+node_9422.g)*lerp((lerp(_ColorNight.rgb,pow(_ColorNight.rgb,_ColorNight.a),node_1381)+(_Stars_var.rgb*pow(node_5512,_StarPos)*_StarsInt)+((_Moon_var.rgb*_MoonColor.rgb*_MoonIntens)*_MoonShadow_var.rgb)),lerp(_ColorDay.rgb,pow(_ColorDay.rgb,_ColorDay.a),node_1381),node_4989)),node_9629,(pow(saturate((node_7042 + ( (node_6544 - node_3210) * (0.0 - node_7042) ) / ((1.0 - (node_756*node_756)) - node_3210))),10.0)*_SunInten)),lerp(1.0,(1.0 - (saturate((node_5952.r*saturate((1.0 - (_dessolveSloistie*node_598.r)))))*pow(saturate((node_9142+_CloudDisSloistie)),_CloudCuloffSloistie))),_CoudDesSloistie)),lerp(1.0,(1.0 - (saturate((node_5689.b*saturate((1.0 - (_dessolvePeristie*node_8704.b)))))*pow(saturate((node_2784+_CloudDisPeristie)),_CloudCuloffPeristie))),_CoudDesPeristie)),lerp(1.0,(1.0 - (saturate((node_3353.r*saturate((1.0 - (_dessolve*node_8605.r)))))*pow(saturate((node_2368+_CloudDis)),_CloudCuloff))),_CoudDest)),pow(node_9629,((1.0 - node_1019)*_Highres)),node_1019),_GroundColor.rgb,saturate(pow(((1.0 - (node_8287*0.5+0.5))+_GroundLocation),_HorizonCutoff)));
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _ColorDay;
            uniform float4 _ColorNight;
            uniform float _SunRadA;
            uniform float _SunRadB;
            uniform float _SunInten;
            uniform float _SkyFar;
            uniform float _MoveX;
            uniform float _MoveZ;
            uniform float _CloudTin;
            uniform float _dessolve;
            uniform sampler2D _cloudtext; uniform float4 _cloudtext_ST;
            uniform float _CloudDis;
            uniform float _CloudCuloff;
            uniform float _CoudDest;
            uniform float4 _CloudColor;
            uniform float4 _SunsetColor;
            uniform float4 _NightCloudColor;
            uniform float _GroundLocation;
            uniform float _SharpHor;
            uniform float _HorWight;
            uniform float _SunsetSize;
            uniform float _SunsetArc;
            uniform float _HorDest;
            uniform float _SunsetEmbient;
            uniform float _Highres;
            uniform float _HorizonCutoff;
            uniform float4 _GroundColor;
            uniform float _StarPos;
            uniform sampler2D _Stars; uniform float4 _Stars_ST;
            uniform float _StarsInt;
            uniform sampler2D _Moon; uniform float4 _Moon_ST;
            uniform float4 _MoonColor;
            uniform float _MoonIntens;
            uniform sampler2D _MoonShadow; uniform float4 _MoonShadow_ST;
            uniform float _dessolveSnd;
            uniform float _CoudDestSnd;
            uniform float4 _CloudColorSnd;
            uniform float4 _NightCloudColorSnd;
            uniform float _dessolveTrd;
            uniform float _CoudDestTrd;
            uniform float4 _CloudColorTrd;
            uniform float4 _NightCloudColorTrd;
            uniform sampler2D _niiseText; uniform float4 _niiseText_ST;
            uniform float _CoudDesPeristie;
            uniform float _dessolvePeristie;
            uniform float _SkyFarPeristie;
            uniform float _CloudDisPeristie;
            uniform float _CloudCuloffPeristie;
            uniform float _MoveXPeristie;
            uniform float _MoveZPeristie;
            uniform float _CloudTinPeristie;
            uniform float _SkyFarSloistie;
            uniform float _CloudDisSloistie;
            uniform float _CloudCuloffSloistie;
            uniform float _MoveXSloistie;
            uniform float _MoveZSloistie;
            uniform float _CloudTinSloistie;
            uniform float _CoudDesSloistie;
            uniform float _dessolveSloistie;
            uniform float4 _CloudColorPerist;
            uniform float4 _NightCloutColorPerist;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                LIGHTING_COORDS(2,3)
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float3 node_5024 = (-1*lightDirection);
                float node_200 = dot(float3(0,-3,0),node_5024);
                float node_4989 = saturate(node_200); // Положение света
                float3 node_9563 = lerp(_NightCloudColor.rgb,_CloudColor.rgb,node_4989);
                float2 node_7955 = float2(_MoveX,_MoveZ);
                float3 node_9422 = normalize(i.posWorld.rgb);
                float node_8464 = node_9422.g;
                float node_5008 = 0.0;
                float node_3649 = 1.0;
                float node_6261 = (_SkyFar+0.0075);
                float2 node_3041 = ((node_7955+(node_9422.rb/(node_6261 + ( (abs(node_8464) - node_5008) * (node_3649 - node_6261) ) / (node_3649 - node_5008))))*_CloudTin); // UV облаков
                float4 node_1903 = tex2D(_cloudtext,TRANSFORM_TEX(node_3041, _cloudtext)); // Текстура
                float4 _noize_copy = tex2D(_niiseText,TRANSFORM_TEX(node_3041, _niiseText)); // Шум
                float node_759 = node_9422.g;
                float node_3445 = 0.0;
                float node_3613 = 1.0;
                float node_6754 = (_SkyFar+0.015);
                float2 node_366 = ((node_7955+(node_9422.rb/(node_6754 + ( (abs(node_759) - node_3445) * (node_3613 - node_6754) ) / (node_3613 - node_3445))))*_CloudTin); // UV облаков
                float4 node_8046 = tex2D(_cloudtext,TRANSFORM_TEX(node_366, _cloudtext)); // Текстура
                float4 _noizeTrd_copy = tex2D(_niiseText,TRANSFORM_TEX(node_366, _niiseText)); // Шум
                float node_1381 = (1.0 - abs(node_9422.g));
                float2 node_2909 = node_9422.rb;
                float node_5512 = saturate(node_9422.g);
                float2 node_2706 = (node_2909+(node_2909*(1.0 - node_5512)));
                float4 _Stars_var = tex2D(_Stars,TRANSFORM_TEX(node_2706, _Stars));
                float4 _Moon_var = tex2D(_Moon,TRANSFORM_TEX(node_2706, _Moon));
                float4 _MoonShadow_var = tex2D(_MoonShadow,TRANSFORM_TEX(i.uv0, _MoonShadow));
                float3 node_9629 = lerp(_SunsetColor.rgb,_LightColor0.rgb,node_4989); // ЦветЗаката
                float node_6544 = max(0,dot(node_5024,viewDirection));
                float node_1651 = min(_SunRadA,_SunRadB);
                float node_3210 = (1.0 - (node_1651*node_1651));
                float node_756 = max(_SunRadA,_SunRadB);
                float node_7042 = 1.0;
                float node_9142 = node_9422.g;
                float node_1857 = 0.0;
                float node_1770 = 1.0;
                float2 node_4718 = ((float2(_MoveXSloistie,_MoveZSloistie)+(node_9422.rb/(_SkyFarSloistie + ( (abs(node_9142) - node_1857) * (node_1770 - _SkyFarSloistie) ) / (node_1770 - node_1857))))*_CloudTinSloistie); // UV облаков
                float4 node_5952 = tex2D(_cloudtext,TRANSFORM_TEX(node_4718, _cloudtext)); // Текстура
                float4 node_598 = tex2D(_niiseText,TRANSFORM_TEX(node_4718, _niiseText)); // Шум
                float node_2784 = node_9422.g;
                float node_1441 = 0.0;
                float node_7450 = 1.0;
                float2 node_5911 = ((float2(_MoveXPeristie,_MoveZPeristie)+(node_9422.rb/(_SkyFarPeristie + ( (abs(node_2784) - node_1441) * (node_7450 - _SkyFarPeristie) ) / (node_7450 - node_1441))))*_CloudTinPeristie); // UV облаков
                float4 node_5689 = tex2D(_cloudtext,TRANSFORM_TEX(node_5911, _cloudtext)); // Текстура
                float4 node_8704 = tex2D(_niiseText,TRANSFORM_TEX(node_5911, _niiseText)); // Шум
                float node_2368 = node_9422.g;
                float node_131 = 0.0;
                float node_9696 = 1.0;
                float2 node_243 = ((node_7955+(node_9422.rb/(_SkyFar + ( (abs(node_2368) - node_131) * (node_9696 - _SkyFar) ) / (node_9696 - node_131))))*_CloudTin); // UV облаков
                float4 node_3353 = tex2D(_cloudtext,TRANSFORM_TEX(node_243, _cloudtext)); // Текстура
                float4 node_8605 = tex2D(_niiseText,TRANSFORM_TEX(node_243, _niiseText)); // Шум
                float node_8287 = node_9422.g;
                float node_9660 = saturate(abs((((-2.0)*_GroundLocation)+1.0+node_8287)));
                float node_4367 = pow(node_6544,_SunsetSize);
                float node_6058 = 0.0;
                float node_1325 = 1.0;
                float node_1019 = ((saturate(pow((1.0 - node_9660),_SharpHor))*(_HorWight + ( (node_4367 - node_6058) * (node_1325 - _HorWight) ) / (node_1325 - node_6058)))*_SunsetEmbient*(node_4367/(node_9660+(1.0 - _SunsetArc)))*saturate(pow(((1.0 - saturate(abs(node_200)))+((_GroundLocation*0.5)*2.0)),_HorDest)));
                float3 finalColor = lerp(lerp(lerp(lerp(lerp(_NightCloudColorTrd.rgb,_CloudColorTrd.rgb,node_4989),lerp(lerp(_NightCloudColorSnd.rgb,_CloudColorSnd.rgb,node_4989),node_9563,lerp(1.0,(1.0 - (saturate((node_1903.r*saturate((1.0 - ((_dessolve+_dessolveSnd)*_noize_copy.r)))))*pow(saturate((node_8464+_CloudDis)),_CloudCuloff))),saturate((_CoudDestSnd+(-1.0)+_CoudDest)))),lerp(1.0,(1.0 - (saturate((node_8046.r*saturate((1.0 - ((_dessolveTrd+_dessolve)*_noizeTrd_copy.r)))))*pow(saturate((node_759+_CloudDis)),_CloudCuloff))),saturate((_CoudDestTrd+(-1.0)+_CoudDest)))),lerp(lerp(_NightCloutColorPerist.rgb,_CloudColorPerist.rgb,node_4989),lerp(node_9563,lerp(((node_1381+node_9422.g)*lerp((lerp(_ColorNight.rgb,pow(_ColorNight.rgb,_ColorNight.a),node_1381)+(_Stars_var.rgb*pow(node_5512,_StarPos)*_StarsInt)+((_Moon_var.rgb*_MoonColor.rgb*_MoonIntens)*_MoonShadow_var.rgb)),lerp(_ColorDay.rgb,pow(_ColorDay.rgb,_ColorDay.a),node_1381),node_4989)),node_9629,(pow(saturate((node_7042 + ( (node_6544 - node_3210) * (0.0 - node_7042) ) / ((1.0 - (node_756*node_756)) - node_3210))),10.0)*_SunInten)),lerp(1.0,(1.0 - (saturate((node_5952.r*saturate((1.0 - (_dessolveSloistie*node_598.r)))))*pow(saturate((node_9142+_CloudDisSloistie)),_CloudCuloffSloistie))),_CoudDesSloistie)),lerp(1.0,(1.0 - (saturate((node_5689.b*saturate((1.0 - (_dessolvePeristie*node_8704.b)))))*pow(saturate((node_2784+_CloudDisPeristie)),_CloudCuloffPeristie))),_CoudDesPeristie)),lerp(1.0,(1.0 - (saturate((node_3353.r*saturate((1.0 - (_dessolve*node_8605.r)))))*pow(saturate((node_2368+_CloudDis)),_CloudCuloff))),_CoudDest)),pow(node_9629,((1.0 - node_1019)*_Highres)),node_1019),_GroundColor.rgb,saturate(pow(((1.0 - (node_8287*0.5+0.5))+_GroundLocation),_HorizonCutoff)));
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
