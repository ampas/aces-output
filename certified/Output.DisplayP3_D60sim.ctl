
// <ACEStransformID>urn:ampas:aces:transformId:v2.0:Output.Academy.DisplayP3.a2.v1</ACEStransformID>
// <ACESuserName>DisplayP3</ACESuserName>

// 
// Output Transform - DisplayP3 (D60 simulation
//

//
// Summary :
//  This transform is intended for mapping OCES onto a display calibrated using the 
//  DCI P3 primaries, a D65 white point, and the sRGB transfer function as defined at
//  https://developer.apple.com/documentation/coregraphics/cgcolorspace/1408916-displayp3
//
//  There is no display standard associated with the color space thus, for
//  consistency, 100 cd/m^2 is recommended as the peak display luminance.
//  The assumed observer adapted white is D65, and the viewing environment is
//  that of a dim surround.
//
// Display EOTF :
//  The sRGB piece-wise transfer function specified in IEC 61966-2-1:1999 (sRGB).
//
// Assumed observer adapted white point:
//  CIE 1931 chromaticities:    x            y
//                              0.32168      0.33767
//
// Viewing Environment:
//  This ODT assumes viewing environment variables more typical of those associated with 
//  video mastering.
//


import "Library.Utilities";
import "Library.Tonescale";
import "Library.OutputTransform";
import "Library.DisplayEncoding";





// ---- ODT PARAMETERS BELOW ---- //

// Limiting primaries and white point
const Chromaticities limitingPri =      // P3 D60
{
    { 0.6400,  0.3300},
    { 0.3000,  0.6000},
    { 0.1500,  0.0600},
    { 0.32168,  0.33767}
};

const float peakLuminance = 100.;       // cd/m^2 (nits)

// Surround
//  0 - dark
//  1 - dim
//  2 - average
const int surround_enum = 1;            // =dim

// Display parameters
const Chromaticities encodingPri =      // P3 D65
{
    { 0.6400,  0.3300},
    { 0.3000,  0.6000},
    { 0.1500,  0.0600},
    { 0.3127,  0.3290}
};

// EOTF
//  0 - BT.1886 with gamma 2.4
//  1 - sRGB IEC 61966-2-1:1999
//  2 - gamma 2.2
//  3 - gamma 2.4
//  4 - ST.2084
//  5 - HLG
//  6 - display linear
const int eotf_enum = 1;                // sRGB

// ---- ---- ---- ---- ---- ---- //












// Transform
void main ( 
    input varying float rIn,
    input varying float gIn,
    input varying float bIn,
    output varying float rOut,
    output varying float gOut,
    output varying float bOut,
    output varying float aOut,
    input varying float aIn = 1. 
)
{
    // ----- Calculate parameters derived from luminance and primaries ----- //
    const ODTParams PARAMS = init_ODTParams( peakLuminance,
                                             limitingPri,
                                             encodingPri );

    // ---- Assemble Input ---- //    
    float aces[3] = {rIn, gIn, bIn};

    // ---- Output Transform ---- //
    float XYZ[3] = outputTransform_fwd( aces, 
                                        peakLuminance, 
                                        PARAMS, 
                                        limitingPri, 
                                        surround_enum );

    // ---- Display Encoding ---- //
    float out[3] = display_encoding( XYZ, 
                                     PARAMS, 
                                     limitingPri, 
                                     encodingPri,
                                     eotf_enum );

    rOut = out[0];
    gOut = out[1];
    bOut = out[2];
    aOut = aIn;

}