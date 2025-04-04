// <ACEStransformID>urn:ampas:aces:transformId:v2.0:InvOutput.Academy.Rec709-D65_48nit_in_P3-D65_Gamma2pt6.a2.v1</ACEStransformID>
// <ACESuserName>Inverse P3-D65 (Rec.709 Limited)</ACESuserName>

import "Lib.Academy.Utilities";
import "Lib.Academy.Tonescale";
import "Lib.Academy.OutputTransform";
import "Lib.Academy.DisplayEncoding";

// ---- ODT PARAMETERS BELOW ---- //

// Rendering intent
// Chromaticities of limiting primaries and white point
const Chromaticities limitingPri = // Rec.709 Primaries / D65 White
    {
        {0.6400, 0.3300},
        {0.3000, 0.6000},
        {0.1500, 0.0600},
        {0.3127, 0.3290}
    };
    
const float peakLuminance = 100.; // luminance the tone scale highlight rolloff will target in cd/m^2 (nits)
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
const int eotf_enum = 3;

// ---- ---- ---- ---- ---- ---- //

const float linear_scale_factor = 1.0;

// Initialization functions
// These only need to be calculated once and are done here at the global level to assure they are not done per pixel.

// Calculate parameters derived from luminance and primaries of current transform
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
    float cv[3] = {rIn, gIn, bIn};

    // ---- Display Decoding ---- //
    float rgb[3] = display_decoding(cv, invert_f33(MATRIX_limit_to_display), eotf_enum, linear_scale_factor);

    // ---- Undo white scaling, needed if limiting white != encoding white ----
    if (scale_white)
    {
        rgb = apply_white_scale(rgb, MATRIX_limit_to_display, true);
    }

    // ---- Clamp to peak luminance ---- //
    rgb = clamp_f3(rgb, 0.0, peakLuminance / ref_luminance);

    // ---- Inverse Output Transform ---- //
    float inv_aces[3] = outputTransform_inv(rgb, ODT_PARAMS);

    rOut = inv_aces[0];
    gOut = inv_aces[1];
    bOut = inv_aces[2];
    aOut = aIn;
}