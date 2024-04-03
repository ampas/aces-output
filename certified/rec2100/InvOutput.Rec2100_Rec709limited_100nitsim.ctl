
// <ACEStransformID>urn:ampas:aces:transformId:v2.0:InvOutput.Academy.Rec2100_Rec709limited_100nitsim.a2.v1</ACEStransformID>
// <ACESuserName>Inverse Rec.2100 (Rec.709 Limited 100 nit sim)</ACESuserName>

// 
// Inverse Output Transform - Rec.2100 (Rec.709 Limited 100 cd/m^2 Simulation)
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
const Chromaticities encodingPri =      // Rec.2020 D65
{
    { 0.7080,  0.2920},
    { 0.1700,  0.7970},
    { 0.1310,  0.0460},
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
    // ----- Run initialization functions ----- //

    const ODTParams PARAMS = init_ODTParams( peakLuminance,
                                             limitingPri,
                                             encodingPri );

    // ---- Assemble Input ---- //    
    float RGB[3] = {rIn, gIn, bIn};

    // ---- Display Decoding ---- //    
    float XYZ[3] = display_decoding( RGB,
                                     PARAMS,
                                     limitingPri,
                                     encodingPri,
                                     eotf_enum,
                                     linear_scale_factor );

    // ---- Inverse Output Transform ---- //    
    float aces[3] = outputTransform_inv( XYZ,
                                         peakLuminance, 
                                         PARAMS, 
                                         limitingPri, 
                                         surround_enum );
        
    rOut = aces[0];
    gOut = aces[1];
    bOut = aces[2];
    aOut = aIn;

}