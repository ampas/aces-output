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
//  3 - gamma 2.4
//  4 - ST.2084
//  5 - HLG
//  6 - display linear
const int eotf_enum = 0;                // BT.1886

// ---- ---- ---- ---- ---- ---- //








// ----- Run initialization functions ----- //

const ODTParams PARAMS = init_ODTParams( peakLuminance,
                                         limitingPri,
                                         encodingPri );

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
    float RGB[3] = {rIn, gIn, bIn};
    
    float RGB_display_linear[3] = eotf( RGB, eotf_enum);
    
    // Display RGB to XYZ
    float XYZ[3] = mult_f3_f33( RGB_display_linear, PARAMS.OUTPUT_RGB_TO_XYZ );

    if (!f2_equal_to_tolerance(limitingPri.white, encodingPri.white, 1e-5)) {
        XYZ = scale_white( XYZ, PARAMS, true);
    }

    float aces[3] = outputTransform_inv( XYZ,
                                         peakLuminance, 
                                         PARAMS, 
                                         limitingPri, 
                                         surround_enum );
    
//     if (verbose) {
//         print("RGB_display_linear:\n\t"); print_f3( RGB_display_linear);
//         print("XYZ:\n\t"); print_f3( XYZ);
//         print("compressedJMh:\n\t"); print_f3( compressedJMh);
//         print("tonemappedJMh:\n\t"); print_f3( tonemappedJMh);
//         print("JMh:\n\t"); print_f3( JMh);
//         print("srcRGB:\n\t"); print_f3( aces);
//     }
    
    rOut = aces[0];
    gOut = aces[1];
    bOut = aces[2];
    aOut = aIn;

}