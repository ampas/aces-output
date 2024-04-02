
// <ACEStransformID>urn:ampas:aces:transformId:v2.0:Output.Academy.Rec709.a2.v1</ACEStransformID>
// <ACESuserName>Rec.709</ACESuserName>

// 
// Output Transform - Rec709
//

//
// Summary :
//  This transform is intended for mapping OCES onto a Rec.709 broadcast monitor
//  that is calibrated to a D65 white point at 100 cd/m^2. The assumed observer 
//  adapted white is D65, and the viewing environment is a dim surround. 
//
// Display EOTF :
//  The reference electro-optical transfer function specified in 
//  Rec. ITU-R BT.1886.
//
// Assumed observer adapted white point:
//  CIE 1931 chromaticities:    x            y
//                              0.3127       0.329
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
const Chromaticities limitingPri =      // Rec.709 D65
{
    { 0.6400,  0.3300},
    { 0.3000,  0.6000},
    { 0.1500,  0.0600},
    { 0.3127,  0.3290}
};

const float peakLuminance = 100.;       // cd/m^2 (nits)

// Surround
//  0 - dark
//  1 - dim
//  2 - average
const int surround_enum = 1;

// Display parameters
const Chromaticities encodingPri =      // Rec.709 D65
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
//  3 - gamma 2.6
//  4 - ST.2084
//  5 - HLG
//  6 - display linear
const int eotf_enum = 0;

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