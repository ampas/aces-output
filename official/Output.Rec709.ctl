import "Library.Utilities";
import "Library.Tonescale";
import "Library.OutputTransform";
import "Library.TransferFunctions";
import "Library.Init";


const Chromaticities REC709_PRI =
{
    { 0.64000,  0.33000},
    { 0.30000,  0.60000},
    { 0.15000,  0.06000},
    { 0.31270,  0.32900}
};

const Chromaticities REC709D60 =
{
    { 0.64000,  0.33000},
    { 0.30000,  0.60000},
    { 0.15000,  0.06000},
    { 0.32168,  0.33767}
};


// SET PARAMETERS HERE
const Chromaticities limitingPrimaries = REC709_PRI;    // Limiting primaries and creative white
const Chromaticities encodingPrimaries = REC709_PRI;    // Display encoding
const float peakLuminance = 100.;                       // Peak display luminance, in nits



// Run Init
const ODTParams PARAMS = init_ODTParams( peakLuminance,
                                         limitingPrimaries,
                                         encodingPrimaries );



// Build tables

const Chromaticities REACH_PRI =    // equal to ACES "AP1" primaries
{
    { 0.713,    0.293},
    { 0.165,    0.830},
    { 0.128,    0.044},
    { 0.32168,  0.33767}
};  


// Reach gamut JMh
const float REACH_GAMUT_TABLE[gamutCuspTableSize][3] = make_gamut_table( REACH_PRI, 
                                                                         peakLuminance );

// Reach cusps at maxJ
const float REACH_TABLE[gamutCuspTableSize] = make_gamut_reach_table( REACH_PRI,
                                                                      PARAMS.limitJmax );

// JMh of limiting gamut (used for final gamut mapping)
const float GAMUT_CUSP_TABLE[gamutCuspTableSize][3] = make_gamut_table( limitingPrimaries,
                                                                        peakLuminance );

// Gammas to use for approximating boundaries
const float GAMUT_TOP_GAMMA[gamutCuspTableSize] = make_upper_hull_gamma( GAMUT_CUSP_TABLE, PARAMS );

const float GAMUT_BOTTOM_GAMMA = 1.14;




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
    // Put input variables into a 3-element array (ACES)
    float aces[3] = {rIn, gIn, bIn};
    
    // Input RGB (AP0, linear) to JMh    
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

    // Display Encoding
    float RGB_display_linear[3] = mult_f3_f33( XYZ, PARAMS.OUTPUT_XYZ_TO_RGB );
    
    float out[3] = clamp_f3( RGB_display_linear, 0.0, 1.0);


    
//     if (as2020PQ) {
//         out = mult_f_f3( referenceLuminance, mult_f3_f33( out, BT709_to_BT2020));
//         out = Y_2_ST2084_f3( out );
//     } else {

        out = bt1886_rev_f3( out, 2.4, 1.0, 0.0);
  
    if (verbose) {
        print("srcRGB:\n\t"); print_f3( aces);
        print("JMh:\n\t"); print_f3( JMh);
        print("tonemappedJMh:\n\t"); print_f3( tonemappedJMh);
        print("compressedJMh:\n\t"); print_f3( compressedJMh);
        print("XYZ:\n\t"); print_f3( XYZ);
//         print("linearRGBout:\n\t"); print_f3( out);
//         print("CVout:\n\t"); print_f3( out);
    }
    

    // Assign display RGB to output variables (OCES)
    rOut = out[0];
    gOut = out[1];
    bOut = out[2];
    aOut = aIn;

}