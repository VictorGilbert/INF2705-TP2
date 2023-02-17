#version 410
layout(triangles) in;
layout(triangle_strip, max_vertices = 3) out;

in Attribs {
    vec4 couleur;
} AttribsIn[];

out Attribs {
    vec4 couleur;
    //vec3 lumiDir;
    vec3 normale;
    //, obsVec;
} AttribsOut;

void main()
{
    // calculer le centre
    vec3 arete1 = (gl_in[1].gl_Position.xyz - gl_in[0].gl_Position.xyz );
    vec3 arete2 = ( gl_in[2].gl_Position.xyz - gl_in[0].gl_Position.xyz );
    AttribsOut.normale = cross( arete1, arete2 );
    AttribsOut.couleur = AttribsIn[gl_PrimitiveIDIn].couleur;
    gl_Position = gl_in[0].gl_Position;
    EmitVertex();
    gl_Position = gl_in[1].gl_Position;
    EmitVertex();
    gl_Position = gl_in[2].gl_Position;
    EmitVertex();
    EndPrimitive();
}