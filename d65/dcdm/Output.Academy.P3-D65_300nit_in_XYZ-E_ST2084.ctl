// <ACEStransformID>urn:ampas:aces:transformId:v2.0:Output.Academy.P3-D65_300nit_in_XYZ-E_ST2084.a2.v1</ACEStransformID>
// <ACESuserName>DCDM (300 nit P3-D65 Limited)</ACESuserName>

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
    
const float peakLuminance = 625;  // = 300 * (100/48); 
                                  // luminance the tone scale highlight rolloff will target in cd/m^2 (nits)
const bool scale_white = false;   // apply scaling to compress output so that largest channel hits 1.0; usually enabled when using a limiting white different from the encoding white

// Encoding
// Chromaticities of display primaries and white point
const Chromaticities encodingPri = // XYZ Primaries / Equal Energy ("E") White
    {
        {1.0,  0.0},
        {0.0,  1.0},
        {0.0,  0.0},
        {1/3.,  1/3.}
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


const float linear_scale_factor = 0.48;

// Initialization functions
// These only need to be calculated once and are done here at the global level to assure they are not done per pixel.

// Calculate parameters derived from luminance and primaries
const ODTParams ODT_PARAMS = init_ODTParams(peakLuminance,
                                            limitingPri);

const float MATRIX_limit_to_display[3][3] = mult_f33_f33(RGBtoXYZ_f33(limitingPri, 1.0),
                                                         XYZtoRGB_f33(encodingPri, 1.0));

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