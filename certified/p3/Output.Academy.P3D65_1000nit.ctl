
// <ACEStransformID>urn:ampas:aces:transformId:v2.0:Output.Academy.P3D65_1000nit.a2.v1</ACEStransformID>
// <ACESuserName>P3 D65 1000 nit</ACESuserName>

// 
// Output Transform - P3 D65 (1000 cd/m^2) PQ
//




import "Lib.Utilities";
import "Lib.Tonescale";
import "Lib.OutputTransform";
import "Lib.DisplayEncoding";





// ---- ODT PARAMETERS BELOW ---- //

// Limiting primaries and white point
const Chromaticities limitingPri =       // P3 D65
{
    { 0.6800,  0.3200},
    { 0.2650,  0.6900},
    { 0.1500,  0.0600},
    { 0.3127,  0.3290}
};

const float peakLuminance = 1000.;       // cd/m^2 (nits)

// Surround
//  0 - dark
//  1 - dim
//  2 - average
const int surround_enum = 1;

// Display parameters
const Chromaticities encodingPri =       // P3 D65
{
    { 0.6800,  0.3200},
    { 0.2650,  0.6900},
    { 0.1500,  0.0600},
    { 0.3127,  0.3290}
};

const float linear_scale_factor = 1.0;

// EOTF
//  0 - BT.1886 with gamma 2.4
//  1 - sRGB IEC 61966-2-1:1999
//  2 - gamma 2.2
//  3 - gamma 2.6
//  4 - ST.2084
//  5 - HLG
//  6 - display linear
const int eotf_enum = 4;

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
                                     eotf_enum,
                                     linear_scale_factor );

    rOut = out[0];
    gOut = out[1];
    bOut = out[2];
    aOut = aIn;

}