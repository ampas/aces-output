// SPDX-License-Identifier: Apache-2.0
// Copyright Contributors to the ACES Project.

// <ACEStransformID>urn:ampas:aces:transformId:v2.0:Output.Academy.P3-D65_4000nit_in_P3-D65_ST2084.a2.v1</ACEStransformID>
// <ACESuserName>P3-D65 ST2084 (4000 nit)</ACESuserName>

import "Lib.Academy.Utilities";
import "Lib.Academy.Tonescale";
import "Lib.Academy.OutputTransform";
import "Lib.Academy.DisplayEncoding";

// ---- ODT PARAMETERS BELOW ---- //

// Rendering intent
// Chromaticities of limiting primaries and white point
const Chromaticities limitingPri = // P3 Primaries / D65 White
    {
        {0.6800,  0.3200},
        {0.2650,  0.6900},
        {0.1500,  0.0600},
        {0.3127,  0.3290}
    };

const float peakLuminance = 10000.; // luminance the tone scale highlight rolloff will target in cd/m^2 (nits)
const bool scale_white = false;   // apply scaling to compress output so that largest channel hits 1.0; usually enabled when using a limiting white different from the encoding white

// Encoding
// Chromaticities of display primaries and white point
const Chromaticities encodingPri = // P3 Primaries / D65 White
    {
        {0.6800,  0.3200},
        {0.2650,  0.6900},
        {0.1500,  0.0600},
        {0.3127,  0.3290}
    };

// EOTF of display (output is encoded with the inverse EOTF)
//  0 - display linear
//  1 - ST.2084
//  2 - HLG
//  3 - gamma 2.6
//  4 - BT.1886 with gamma 2.4
//  5 - gamma 2.2
//  6 - sRGB IEC 61966-2-1:1999
const int eotf_enum = 1;

// ---- ---- ---- ---- ---- ---- //

const float linear_scale_factor = 1.0;

// Initialization functions
// These only need to be calculated once and are done here at the global level to assure they are not done per pixel.

// Calculate parameters derived from luminance and primaries
const ODTParams ODT_PARAMS = init_ODTParams(peakLuminance,
                                            limitingPri);

const float MATRIX_limit_to_display[3][3] = mult_f33_f33(RGBtoXYZ_f33(limitingPri, 1.0),
                                                         XYZtoRGB_f33(encodingPri, 1.0));


float[totalTableSize][3] replace_last_table_column( float t[totalTableSize][3], float new_c[totalTableSize])
{
    float t_new[totalTableSize][3] = t;
    for (int i = 0; i < totalTableSize; i = i + 1)
    {
        t_new[i][2] = new_c[i];
    }
    return t_new;
}

// Transform
void main(
    input varying float rIn,
    input varying float gIn,
    input varying float bIn,
    output varying float rOut,
    output varying float gOut,
    output varying float bOut,
    output varying float aOut,
    input varying float aIn = 1.)
{

print("__CONSTANT__ float limitJmax = ", ODT_PARAMS.limit_J_max, "f;\n");
print("__CONSTANT__ float midJ = ", ODT_PARAMS.mid_J, "f; // ~15 nits in Hellwig J\n");
print("__CONSTANT__ float focusDist = ", ODT_PARAMS.focus_dist, "f;\n");
// print("\n");
// print("__CONSTANT__ float daniele_n = ", ODT_PARAMS.ts.n, "f; // peak white\n");
// print("__CONSTANT__ float daniele_m_2 = ", ODT_PARAMS.ts.m_2, "f;\n");
// print("__CONSTANT__ float daniele_s_2 = ", ODT_PARAMS.ts.s_2, "f;\n");
// print("__CONSTANT__ float daniele_u_2 = ", ODT_PARAMS.ts.u_2, "f;\n");
// print("\n");
// print("// Chroma compression scaling for HDR/SDR appearance match\n");
// print("__CONSTANT__ float sat = ", ODT_PARAMS.sat, "f;\n");
// print("__CONSTANT__ float sat_thr = ", ODT_PARAMS.sat_thr, "f;\n");
// print("__CONSTANT__ float compr = ", ODT_PARAMS.compr, "f;\n");
// print("__CONSTANT__ float chromaCompressScale = ", ODT_PARAMS.chroma_compress_scale, "f;\n");
// print("\n");
print("__CONSTANT__ float  ocio_gamut_cusp_table_0_hues_array[362] = \n");
print_table_f_dctl(ODT_PARAMS.TABLE_hues);
print("\n");
print("__CONSTANT__float  ocio_reach_m_table_0[362] = \n");
print_table_f_dctl(ODT_PARAMS.TABLE_reach_M);
print("\n");
print("__CONSTANT__ float3  ocio_gamut_cusp_table_0[362] = \n");
print_table_f3_dctl(replace_last_table_column(ODT_PARAMS.TABLE_gamut_cusps,ODT_PARAMS.TABLE_upper_hull_gamma));
print("\n");
print("  float f = ", ODT_PARAMS.ts.m_2, "f * _powf(Y / (Y + ", ODT_PARAMS.ts.s_2 * ODT_PARAMS.input_params.F_L_n*100, "f), 1.14999998f);\n");
print("__CONSTANT__ float limitJmax = ", ODT_PARAMS.limit_J_max, "f;\n");


print("__CONSTANT__ float daniele_n = ", ODT_PARAMS.ts.n, "f; // peak white\n");
print("__CONSTANT__ float daniele_m_2 = ", ODT_PARAMS.ts.m_2, "f;\n");
print("__CONSTANT__ float daniele_s_2 = ", ODT_PARAMS.ts.s_2, "f;\n");
print("__CONSTANT__ float daniele_u_2 = ", ODT_PARAMS.ts.u_2, "f;\n");


    // ---- Assemble Input ---- //
    float aces[3] = {rIn, gIn, bIn};

    // ---- Output Transform ---- //
    float rgb[3] = outputTransform_fwd(aces, ODT_PARAMS);

    // ---- Clamp to peak luminance ---- //
    rgb = clamp_f3(rgb, 0.0, peakLuminance / ref_luminance);

    // ---- Scale white, needed if limiting white != encoding white ----
    if (scale_white)
    {
        rgb = apply_white_scale(rgb, MATRIX_limit_to_display, false);
    }

    // ---- Display Encoding ---- //
    float cv[3] = display_encoding(rgb, MATRIX_limit_to_display, eotf_enum, linear_scale_factor);

    rOut = cv[0];
    gOut = cv[1];
    bOut = cv[2];
    aOut = aIn;
}