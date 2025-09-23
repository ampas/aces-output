// SPDX-License-Identifier: Apache-2.0
// Copyright Contributors to the ACES Project.

// <ACEStransformID>urn:ampas:aces:transformId:v2.0:Output.Academy.Rec709-D60_100nit_in_P3-D65_sRGB-Piecewise.a2.v1</ACEStransformID>
// <ACESuserName>DisplayP3 (100 nit Rec.709 Limited) (D60 simulation)</ACESuserName>

import "Lib.Academy.Utilities";
import "Lib.Academy.Tonescale";
import "Lib.Academy.OutputTransform";
import "Lib.Academy.DisplayEncoding";

// ---- ODT PARAMETERS BELOW ---- //

// Rendering intent
// Chromaticities of limiting primaries and white point
const Chromaticities limitingPri = // Rec.709 Primaries / ACES "~D60" White
    {
        {0.6400, 0.3300},
        {0.3000, 0.6000},
        {0.1500, 0.0600},
        {0.32168,  0.33767}
    };

const float peakLuminance = 100.; // luminance the tone scale highlight rolloff will target in cd/m^2 (nits)
const bool scale_white = true;   // apply scaling to compress output so that largest channel hits 1.0; usually enabled when using a limiting white different from the encoding white

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
const int eotf_enum = 6;

// ---- ---- ---- ---- ---- ---- //

const float linear_scale_factor = 1.0;

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