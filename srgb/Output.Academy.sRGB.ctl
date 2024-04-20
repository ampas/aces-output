
// <ACEStransformID>urn:ampas:aces:transformId:v2.0:Output.Academy.sRGB.a2.v1</ACEStransformID>
// <ACESuserName>sRGB</ACESuserName>




import "Lib.Academy.Utilities";
import "Lib.Academy.Tonescale";
import "Lib.Academy.OutputTransform";
import "Lib.Academy.DisplayEncoding";





// ---- ODT PARAMETERS BELOW ---- //

// Limiting primaries and white point
const Chromaticities limitingPri =      // sRGB D65
{
    { 0.6400,  0.3300},
    { 0.3000,  0.6000},
    { 0.1500,  0.0600},
    { 0.3127,  0.3290}
};

const float peakLuminance = 100.;       // cd/m^2 (nits)

// Display parameters
const Chromaticities encodingPri =      // sRGB D65
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
const int eotf_enum = 1;

// ---- ---- ---- ---- ---- ---- //





// These parameters should be accessible if needed, but only modified for specific use cases explained further in the ACES documentation.
// Surround
//  0 - dark
//  1 - dim
//  2 - average
const int surround_enum = 1;

const float linear_scale_factor = 1.0;




// Initialization functions
// These only need to be calculated once and are done here at the global level to assure they are not done per pixel.

// Calculate parameters derived from luminance and primaries of current transform
const ODTParams PARAMS = init_ODTParams( peakLuminance,
                                         limitingPri,
                                         encodingPri );

// Build tables
// Reach gamut JMh
const float REACH_GAMUT_TABLE[gamutTableSize][3] = make_gamut_table( REACH_PRI, 
                                                                     peakLuminance );

// Reach cusps at maxJ
const float REACH_CUSP_TABLE[gamutTableSize][3] = make_reach_cusp_table( REACH_PRI, 
                                                                  PARAMS.limitJmax, 
                                                                  peakLuminance );

// JMh of limiting gamut (used for final gamut mapping)
const float GAMUT_CUSP_TABLE[gamutTableSize][3] = make_gamut_table( limitingPri, 
                                                                    peakLuminance );

// Gammas to use for approximating boundaries
const float GAMUT_TOP_GAMMA[gamutTableSize] = make_upper_hull_gamma( GAMUT_CUSP_TABLE, 
                                                                     PARAMS, 
                                                                     peakLuminance );


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
    // ---- Assemble Input ---- //    
    float aces[3] = {rIn, gIn, bIn};

    // ---- Output Transform ---- //
    float XYZ[3] = outputTransform_fwd( aces, 
                                        peakLuminance, 
                                        PARAMS, 
                                        limitingPri, 
                                        GAMUT_CUSP_TABLE, 
                                        GAMUT_TOP_GAMMA, 
                                        REACH_GAMUT_TABLE,
                                        REACH_CUSP_TABLE );

    // ---- Display Encoding ---- //
    float out[3] = display_encoding( XYZ, 
                                     PARAMS, 
                                     limitingPri, 
                                     encodingPri, 
                                     surround_enum, 
                                     eotf_enum, 
                                     linear_scale_factor );

    rOut = out[0];
    gOut = out[1];
    bOut = out[2];
    aOut = aIn;

}