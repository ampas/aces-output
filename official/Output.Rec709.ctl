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
  { 0.32168,  0.33767}
};

const float peakLuminance = 100.;       // cd/m^2 (nits)

// Surround
//  0 - dark
//  1 - dim
//  2 - average
const int surround_enum = 1;            // =dim

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
const int eotf_enum = 0;                // BT.1886

// ---- ---- ---- ---- ---- ---- //








// ----- Run initialization functions ----- //

const ODTParams PARAMS = init_ODTParams( peakLuminance,
                                         limitingPri,
                                         encodingPri );

// Build tables
// Reach gamut JMh
const float REACH_GAMUT_TABLE[gamutCuspTableSize][3] = make_gamut_table( REACH_PRI, 
                                                                         peakLuminance );

// Reach cusps at maxJ
const float REACH_TABLE[gamutCuspTableSize] = make_gamut_reach_table( REACH_PRI, 
                                                                      PARAMS.limitJmax, 
                                                                      peakLuminance );

// JMh of limiting gamut (used for final gamut mapping)
const float GAMUT_CUSP_TABLE[gamutCuspTableSize][3] = make_gamut_table( limitingPri, 
                                                                        peakLuminance );

// Gammas to use for approximating boundaries
const float GAMUT_TOP_GAMMA[gamutCuspTableSize] = make_upper_hull_gamma( GAMUT_CUSP_TABLE, 
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
    input varying float aIn = 1.,
    input varying bool verbose = false
)
{
    float aces[3] = {rIn, gIn, bIn};
    
    float JMh[3] = aces_to_JMh( aces, 
                                peakLuminance );

    float tonemappedJMh[3] = tonemapAndCompress_fwd( JMh, 
                                                     PARAMS, 
                                                     REACH_GAMUT_TABLE, 
                                                     REACH_TABLE );    

    float compressedJMh[3] = gamutMap_fwd( tonemappedJMh, 
                                           PARAMS,
                                           GAMUT_CUSP_TABLE, 
                                           GAMUT_TOP_GAMMA, 
                                           REACH_GAMUT_TABLE );

    float XYZ[3] = JMh_to_output_XYZ( compressedJMh, 
                                      PARAMS );

    // ---- Display Encoding ---- //    

    // White scaling
//         print("XYZ:\n\t"); print_f3( XYZ);
    
    if (!f2_equal_to_tolerance(limitingPri.white, encodingPri.white, 1e-5)) {
        XYZ = scale_white( XYZ, PARAMS, false);
    }
//         print("XYZ_scaled:\n\t"); print_f3( XYZ);

    // XYZ to display RGB
    float RGB_display_linear[3] = mult_f3_f33( XYZ, PARAMS.OUTPUT_XYZ_TO_RGB );

    // Apply inverse EOTF
    float out[3] = eotf_inv( RGB_display_linear, eotf_enum);


    
//     if (as2020PQ) {
//         out = mult_f_f3( referenceLuminance, mult_f3_f33( out, BT709_to_BT2020));
//         out = Y_2_ST2084_f3( out );
//     } else {
  
    if (verbose) {
//         print( "XYZ_to_RGB_limit:\n");
//         print_f33( transpose_f33( PARAMS.LIMIT_XYZ_TO_RGB) );
// 
//         print( "XYZ_to_RGB_output:\n");
//         print_f33( transpose_f33( PARAMS.OUTPUT_XYZ_TO_RGB) );
//         
//         print( "compr = ", PARAMS.compr ,"\n");
//         print( "sat = ", PARAMS.sat ,"\n");
//         print( "sat_thr = ", PARAMS.sat_thr ,"\n");
//         print( "limitJmax = ", PARAMS.limitJmax ,"\n");
//         print( "midJ = ", PARAMS.midJ ,"\n");
//         print( "focusDist = ", focusDistance ,"\n");
//         print( "cuspMidBlend = ", cuspMidBlend ,"\n");
//         print( "model_gamma = ", PARAMS.model_gamma ,"\n");
//         print( "lowerHullGamma = ", PARAMS.lowerHullGamma ,"\n");
//         print( "smoothCusps = ", smoothCusps ,"\n");
// 
//         print( "outWhite = ", PARAMS.XYZ_w_output[0], "\t", PARAMS.XYZ_w_output[1], "\t",  PARAMS.XYZ_w_output[2],"\n");
//         print( "limitWhite = ", PARAMS.XYZ_w_limit[0], "\t", PARAMS.XYZ_w_limit[1], "\t",  PARAMS.XYZ_w_limit[2],"\n");

        print("srcRGB:\n\t"); print_f3( aces);
        print("JMh:\n\t"); print_f3( JMh);
        print("tonemappedJMh:\n\t"); print_f3( tonemappedJMh);
        print("compressedJMh:\n\t"); print_f3( compressedJMh);
        print("XYZ:\n\t"); print_f3( XYZ);
        print("linearRGBout:\n\t"); print_f3( RGB_display_linear);
        print("CVout:\n\t"); print_f3( out);
    }
    
    rOut = out[0];
    gOut = out[1];
    bOut = out[2];
    aOut = aIn;

}