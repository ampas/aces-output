// <ACEStransformID>urn:ampas:aces:transformId:v2.0:InvOutput.Academy.P3-D65_4000nit_in_Rec2100-D65_ST2084.a2.v1</ACEStransformID>
// <ACESuserName>Inverse Rec.2100 ST2084 (4000 nit P3-D65 Limited)</ACESuserName>

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
    
const float peakLuminance = 4000.; // luminance the tone scale highlight rolloff will target in cd/m^2 (nits)
const bool scale_white = false;   // apply scaling to compress output so that largest channel hits 1.0; usually enabled when using a limiting white different from the encoding white

// Encoding
// Chromaticities of display primaries and white point
const Chromaticities encodingPri = // Rec.2100 Primaries / D65 White
    {
        {0.7080,  0.2920},
        {0.1700,  0.7970},
        {0.1310,  0.0460},
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

// Calculate parameters derived from luminance and primaries of current transform
const ODTParams PARAMS = init_ODTParams(peakLuminance,
                                        limitingPri,
                                        encodingPri);

// Build tables
// Reach gamut JMh
const float REACH_GAMUT_TABLE[][3] = make_gamut_table(REACH_PRI,
                                                      peakLuminance);

// Reach cusps at maxJ
const float REACHM_TABLE[] = make_reachM_table(REACH_PRI,
                                               PARAMS.limitJmax,
                                               peakLuminance);

// JMh of limiting gamut (used for final gamut mapping)
const float GAMUT_CUSP_TABLE[][3] = make_gamut_table(limitingPri,
                                                     peakLuminance);

// Gammas to use for approximating boundaries
const float GAMUT_TOP_GAMMA[] = make_upper_hull_gamma_table(GAMUT_CUSP_TABLE,
                                                            PARAMS,
                                                            peakLuminance); //

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
    float RGB[3] = {rIn, gIn, bIn};

    // ---- Display Decoding ---- //
    float XYZ[3] = display_decoding( RGB,
                                     PARAMS,
                                     eotf_enum,
                                     linear_scale_factor );

    XYZ = white_limiting( XYZ, PARAMS, scale_white, true);
    
    // ---- Inverse Output Transform ---- //
    float aces[3] = outputTransform_inv( XYZ,
                                         peakLuminance, 
                                         PARAMS, 
                                         limitingPri,
                                         GAMUT_CUSP_TABLE, 
                                         GAMUT_TOP_GAMMA, 
                                         REACH_GAMUT_TABLE,
                                         REACHM_TABLE );

    rOut = aces[0];
    gOut = aces[1];
    bOut = aces[2];
    aOut = aIn;
}