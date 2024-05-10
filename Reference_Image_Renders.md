## Reference Images ##

Reference, or "golden", images have been rendered through each transform in order to help verify your implementation of the reference color transformations. Each provided file is the result of applying one of the transforms included with the system. 

One source image is pictorial and the other is a synthetically generated test chart.

Reference images are hosted on [Dropbox](https://www.dropbox.com/scl/fo/zorgtgohsmn4xjb5wbplg/AJv-W01I-Dbz1mzo8gkKfZI?rlkey=4ksl2hefncrjfr080vdr00c4n&dl=0) and can be downloaded individually or as a zip file.

### Confirmation ###
To confirm your implementation of each transform:

  1. Use your implementation to process the "input" reference image appropriate to the transform being tested. In the case of the Output Transforms, the input image is one of the frames provided in the `/ACES` directory.
  2. Compare the output from your implementation to the provided corresponding "output" reference image. The images in `/Output` are the result of applying one of the transforms to one of the ACES input images.
     


### Naming Scheme ###

#### Output/
File names in the `Output` directory have the name of the transform that was applied _appended to_ the name of the image file was used as input.

Generically, applying `SomeTransformName.ctl` on input image `SomeImageName.exr` would be named `*SomeImageName_SomeTransformName.tiff*`.

Files include:


  - *SonyF35.StillLife_Output.Academy.DisplayP3.tiff* - `Output.Academy.DisplayP3.ctl` applied to *ACES/SonyF35.StillLife.exr*
  - *SonyF35.StillLife_Output.Academy.DisplayP3_D60sim.tiff* - `Output.Academy.DisplayP3_D60sim.ctl` applied to *ACES/SonyF35.StillLife.exr*
  - *SonyF35.StillLife_Output.Academy.P3D65_ST2084_1000nit.tiff* - `Output.Academy.P3D65_ST2084_1000nit.ctl` applied to *ACES/SonyF35.StillLife.exr*
  - *SonyF35.StillLife_Output.Academy.P3D65_ST2084_108nit.tiff* - `Output.Academy.P3D65_ST2084_108nit.ctl` applied to *ACES/SonyF35.StillLife.exr*
  - *SonyF35.StillLife_Output.Academy.P3D65_ST2084_2000nit.tiff* - `Output.Academy.P3D65_ST2084_2000nit.ctl` applied to *ACES/SonyF35.StillLife.exr*
  - *SonyF35.StillLife_Output.Academy.P3D65_ST2084_4000nit.tiff* - `Output.Academy.P3D65_ST2084_4000nit.ctl` applied to *ACES/SonyF35.StillLife.exr*
  - *SonyF35.StillLife_Output.Academy.P3D60.tiff* - `Output.Academy.P3D60.ctl` applied to *ACES/SonyF35.StillLife.exr*
  - *SonyF35.StillLife_Output.Academy.P3D65.tiff* - `Output.Academy.P3D65.ctl` applied to *ACES/SonyF35.StillLife.exr*
  - *SonyF35.StillLife_Output.Academy.P3D65_D60sim.tiff* - `Output.Academy.P3D65_D60sim.ctl` applied to *ACES/SonyF35.StillLife.exr*
  - *SonyF35.StillLife_Output.Academy.P3D65_Rec709limited.tiff* - `Output.Academy.P3D65_Rec709limited.ctl` applied to *ACES/SonyF35.StillLife.exr*
  - *SonyF35.StillLife_Output.Academy.P3DCI_D60sim.tiff* - `Output.Academy.P3DCI_D60sim.ctl` applied to *ACES/SonyF35.StillLife.exr*
  - *SonyF35.StillLife_Output.Academy.P3DCI_D65sim.tiff* - `Output.Academy.P3DCI_D65sim.ctl` applied to *ACES/SonyF35.StillLife.exr*
  - *SonyF35.StillLife_Output.Academy.Rec2020_ST2084_1000nit.tiff* - `Output.Academy.Rec2020_ST2084_1000nit.ctl` applied to *ACES/SonyF35.StillLife.exr*
  - *SonyF35.StillLife_Output.Academy.Rec2020_ST2084_2000nit.tiff* - `Output.Academy.Rec2020_ST2084_2000nit.ctl` applied to *ACES/SonyF35.StillLife.exr*
  - *SonyF35.StillLife_Output.Academy.Rec2020_ST2084_4000nit.tiff* - `Output.Academy.Rec2020_ST2084_4000nit.ctl` applied to *ACES/SonyF35.StillLife.exr*
  - *SonyF35.StillLife_Output.Academy.Rec2020_ST2084_500nit.tiff* - `Output.Academy.Rec2020_ST2084_500nit.ctl` applied to *ACES/SonyF35.StillLife.exr*
  - *SonyF35.StillLife_Output.Academy.Rec2020_ST2084_P3D65limited_1000nit.tiff* - `Output.Academy.Rec2020_ST2084_P3D65limited_1000nit.ctl` applied to *ACES/SonyF35.StillLife.exr*
  - *SonyF35.StillLife_Output.Academy.Rec2020_ST2084_P3D65limited_2000nit.tiff* - `Output.Academy.Rec2020_ST2084_P3D65limited_2000nit.ctl` applied to *ACES/SonyF35.StillLife.exr*
  - *SonyF35.StillLife_Output.Academy.Rec2020_ST2084_P3D65limited_4000nit.tiff* - `Output.Academy.Rec2020_ST2084_P3D65limited_4000nit.ctl` applied to *ACES/SonyF35.StillLife.exr*
  - *SonyF35.StillLife_Output.Academy.Rec2020_ST2084_P3D65limited_500nit.tiff* - `Output.Academy.Rec2020_ST2084_P3D65limited_500nit.ctl` applied to *ACES/SonyF35.StillLife.exr*
  - *SonyF35.StillLife_Output.Academy.Rec2020_ST2084_Rec709limited_100nitsim.tiff* - `Output.Academy.Rec2020_ST2084_Rec709limited_100nitsim.ctl` applied to *ACES/SonyF35.StillLife.exr*
  - *SonyF35.StillLife_Output.Academy.Rec2020.tiff* - `Output.Academy.Rec2020.ctl` applied to *ACES/SonyF35.StillLife.exr*
  - *SonyF35.StillLife_Output.Academy.Rec2020_P3D65limited.tiff* - `Output.Academy.Rec2020_P3D65limited.ctl` applied to *ACES/SonyF35.StillLife.exr*
  - *SonyF35.StillLife_Output.Academy.Rec2020_Rec709limited.tiff* - `Output.Academy.Rec2020_Rec709limited.ctl` applied to *ACES/SonyF35.StillLife.exr*
  - *SonyF35.StillLife_Output.Academy.Rec709.tiff* - `Output.Academy.Rec709.ctl` applied to *ACES/SonyF35.StillLife.exr*
  - *SonyF35.StillLife_Output.Academy.Rec709_D60sim.tiff* - `Output.Academy.Rec709_D60sim.ctl` applied to *ACES/SonyF35.StillLife.exr*
  - *SonyF35.StillLife_Output.Academy.sRGB.tiff* - `Output.Academy.sRGB.ctl` applied to *ACES/SonyF35.StillLife.exr*
  - *SonyF35.StillLife_Output.Academy.sRGB_D60sim.tiff* - `Output.Academy.sRGB_D60sim.ctl` applied to *ACES/SonyF35.StillLife.exr*
  - *SonyF35.StillLife_Output.Academy.sRGB_Gamma_2pt2.tiff* - `Output.Academy.sRGB_Gamma_2pt2.ctl` applied to *ACES/SonyF35.StillLife.exr*
  - *syntheticChart.01_Output.Academy.DisplayP3.tiff* - `Output.Academy.DisplayP3.ctl` applied to *ACES/syntheticChart.01.exr*
  - *syntheticChart.01_Output.Academy.DisplayP3_D60sim.tiff* - `Output.Academy.DisplayP3_D60sim.ctl` applied to *ACES/syntheticChart.01.exr*
  - *syntheticChart.01_Output.Academy.P3D65_ST2084_1000nit.tiff* - `Output.Academy.P3D65_ST2084_1000nit.ctl` applied to *ACES/syntheticChart.01.exr*
  - *syntheticChart.01_Output.Academy.P3D65_ST2084_108nit.tiff* - `Output.Academy.P3D65_ST2084_108nit.ctl` applied to *ACES/syntheticChart.01.exr*
  - *syntheticChart.01_Output.Academy.P3D65_ST2084_2000nit.tiff* - `Output.Academy.P3D65_ST2084_2000nit.ctl` applied to *ACES/syntheticChart.01.exr*
  - *syntheticChart.01_Output.Academy.P3D65_ST2084_4000nit.tiff* - `Output.Academy.P3D65_ST2084_4000nit.ctl` applied to *ACES/syntheticChart.01.exr*
  - *syntheticChart.01_Output.Academy.P3D60.tiff* - `Output.Academy.P3D60.ctl` applied to *ACES/syntheticChart.01.exr*
  - *syntheticChart.01_Output.Academy.P3D65.tiff* - `Output.Academy.P3D65.ctl` applied to *ACES/syntheticChart.01.exr*
  - *syntheticChart.01_Output.Academy.P3D65_D60sim.tiff* - `Output.Academy.P3D65_D60sim.ctl` applied to *ACES/syntheticChart.01.exr*
  - *syntheticChart.01_Output.Academy.P3D65_Rec709limited.tiff* - `Output.Academy.P3D65_Rec709limited.ctl` applied to *ACES/syntheticChart.01.exr*
  - *syntheticChart.01_Output.Academy.P3DCI_D60sim.tiff* - `Output.Academy.P3DCI_D60sim.ctl` applied to *ACES/syntheticChart.01.exr*
  - *syntheticChart.01_Output.Academy.P3DCI_D65sim.tiff* - `Output.Academy.P3DCI_D65sim.ctl` applied to *ACES/syntheticChart.01.exr*
  - *syntheticChart.01_Output.Academy.Rec2020_ST2084_1000nit.tiff* - `Output.Academy.Rec2020_ST2084_1000nit.ctl` applied to *ACES/syntheticChart.01.exr*
  - *syntheticChart.01_Output.Academy.Rec2020_ST2084_2000nit.tiff* - `Output.Academy.Rec2020_ST2084_2000nit.ctl` applied to *ACES/syntheticChart.01.exr*
  - *syntheticChart.01_Output.Academy.Rec2020_ST2084_4000nit.tiff* - `Output.Academy.Rec2020_ST2084_4000nit.ctl` applied to *ACES/syntheticChart.01.exr*
  - *syntheticChart.01_Output.Academy.Rec2020_ST2084_500nit.tiff* - `Output.Academy.Rec2020_ST2084_500nit.ctl` applied to *ACES/syntheticChart.01.exr*
  - *syntheticChart.01_Output.Academy.Rec2020_ST2084_P3D65limited_1000nit.tiff* - `Output.Academy.Rec2020_ST2084_P3D65limited_1000nit.ctl` applied to *ACES/syntheticChart.01.exr*
  - *syntheticChart.01_Output.Academy.Rec2020_ST2084_P3D65limited_2000nit.tiff* - `Output.Academy.Rec2020_ST2084_P3D65limited_2000nit.ctl` applied to *ACES/syntheticChart.01.exr*
  - *syntheticChart.01_Output.Academy.Rec2020_ST2084_P3D65limited_4000nit.tiff* - `Output.Academy.Rec2020_ST2084_P3D65limited_4000nit.ctl` applied to *ACES/syntheticChart.01.exr*
  - *syntheticChart.01_Output.Academy.Rec2020_ST2084_P3D65limited_500nit.tiff* - `Output.Academy.Rec2020_ST2084_P3D65limited_500nit.ctl` applied to *ACES/syntheticChart.01.exr*
  - *syntheticChart.01_Output.Academy.Rec2020_ST2084_Rec709limited_100nitsim.tiff* - `Output.Academy.Rec2020_ST2084_Rec709limited_100nitsim.ctl` applied to *ACES/syntheticChart.01.exr*
  - *syntheticChart.01_Output.Academy.Rec2020.tiff* - `Output.Academy.Rec2020.ctl` applied to *ACES/syntheticChart.01.exr*
  - *syntheticChart.01_Output.Academy.Rec2020_P3D65limited.tiff* - `Output.Academy.Rec2020_P3D65limited.ctl` applied to *ACES/syntheticChart.01.exr*
  - *syntheticChart.01_Output.Academy.Rec2020_Rec709limited.tiff* - `Output.Academy.Rec2020_Rec709limited.ctl` applied to *ACES/syntheticChart.01.exr*
  - *syntheticChart.01_Output.Academy.Rec709.tiff* - `Output.Academy.Rec709.ctl` applied to *ACES/syntheticChart.01.exr*
  - *syntheticChart.01_Output.Academy.Rec709_D60sim.tiff* - `Output.Academy.Rec709_D60sim.ctl` applied to *ACES/syntheticChart.01.exr*
  - *syntheticChart.01_Output.Academy.sRGB.tiff* - `Output.Academy.sRGB.ctl` applied to *ACES/syntheticChart.01.exr*
  - *syntheticChart.01_Output.Academy.sRGB_D60sim.tiff* - `Output.Academy.sRGB_D60sim.ctl` applied to *ACES/syntheticChart.01.exr*
  - *syntheticChart.01_Output.Academy.sRGB_Gamma_2pt2.tiff* - `Output.Academy.sRGB_Gamma_2pt2.ctl` applied to *ACES/syntheticChart.01.exr*
    
#### InvACES/
File names in the `InvACES` directory have the name of the original image appended with "_from_Output.TransformName' and use the images in `Output` as their inputs.

These files are the result of applying the corresponding Inverse Output Transform to the output of the forward direction of each Output Transform.

The specific inverse transform used for each image is listed below:

  - *SonyF35.StillLife_from_Output.Academy.DisplayP3.exr* - `InvOutput.Academy.DisplayP3.ctl` applied to *Output/SonyF35.StillLife_Output.Academy.DisplayP3.tiff*
  - *SonyF35.StillLife_from_Output.Academy.DisplayP3_D60sim.exr* - `InvOutput.Academy.DisplayP3_D60sim.ctl` applied to *Output/SonyF35.StillLife_Output.Academy.DisplayP3_D60sim.tiff*
  - *SonyF35.StillLife_from_Output.Academy.P3D65_ST2084_1000nit.exr* - `InvOutput.Academy.P3D65_ST2084_1000nit.ctl` applied to *Output/SonyF35.StillLife_Output.Academy.P3D65_ST2084_1000nit.tiff*
  - *SonyF35.StillLife_from_Output.Academy.P3D65_ST2084_108nit.exr* - `InvOutput.Academy.P3D65_ST2084_108nit.ctl` applied to *Output/SonyF35.StillLife_Output.Academy.P3D65_ST2084_108nit.tiff*
  - *SonyF35.StillLife_from_Output.Academy.P3D65_ST2084_2000nit.exr* - `InvOutput.Academy.P3D65_ST2084_2000nit.ctl` applied to *Output/SonyF35.StillLife_Output.Academy.P3D65_ST2084_2000nit.tiff*
  - *SonyF35.StillLife_from_Output.Academy.P3D65_ST2084_4000nit.exr* - `InvOutput.Academy.P3D65_ST2084_4000nit.ctl` applied to *Output/SonyF35.StillLife_Output.Academy.P3D65_ST2084_4000nit.tiff*
  - *SonyF35.StillLife_from_Output.Academy.P3D60.exr* - `InvOutput.Academy.P3D60.ctl` applied to *Output/SonyF35.StillLife_Output.Academy.P3D60.tiff*
  - *SonyF35.StillLife_from_Output.Academy.P3D65.exr* - `InvOutput.Academy.P3D65.ctl` applied to *Output/SonyF35.StillLife_Output.Academy.P3D65.tiff*
  - *SonyF35.StillLife_from_Output.Academy.P3D65_D60sim.exr* - `InvOutput.Academy.P3D65_D60sim.ctl` applied to *Output/SonyF35.StillLife_Output.Academy.P3D65_D60sim.tiff*
  - *SonyF35.StillLife_from_Output.Academy.P3D65_Rec709limited.exr* - `InvOutput.Academy.P3D65_Rec709limited.ctl` applied to *Output/SonyF35.StillLife_Output.Academy.P3D65_Rec709limited.tiff*
  - *SonyF35.StillLife_from_Output.Academy.P3DCI_D60sim.exr* - `InvOutput.Academy.P3DCI_D60sim.ctl` applied to *Output/SonyF35.StillLife_Output.Academy.P3DCI_D60sim.tiff*
  - *SonyF35.StillLife_from_Output.Academy.P3DCI_D65sim.exr* - `InvOutput.Academy.P3DCI_D65sim.ctl` applied to *Output/SonyF35.StillLife_Output.Academy.P3DCI_D65sim.tiff*
  - *SonyF35.StillLife_from_Output.Academy.Rec2020_ST2084_1000nit.exr* - `InvOutput.Academy.Rec2020_ST2084_1000nit.ctl` applied to *Output/SonyF35.StillLife_Output.Academy.Rec2020_ST2084_1000nit.tiff*
  - *SonyF35.StillLife_from_Output.Academy.Rec2020_ST2084_2000nit.exr* - `InvOutput.Academy.Rec2020_ST2084_2000nit.ctl` applied to *Output/SonyF35.StillLife_Output.Academy.Rec2020_ST2084_2000nit.tiff*
  - *SonyF35.StillLife_from_Output.Academy.Rec2020_ST2084_4000nit.exr* - `InvOutput.Academy.Rec2020_ST2084_4000nit.ctl` applied to *Output/SonyF35.StillLife_Output.Academy.Rec2020_ST2084_4000nit.tiff*
  - *SonyF35.StillLife_from_Output.Academy.Rec2020_ST2084_500nit.exr* - `InvOutput.Academy.Rec2020_ST2084_500nit.ctl` applied to *Output/SonyF35.StillLife_Output.Academy.Rec2020_ST2084_500nit.tiff*
  - *SonyF35.StillLife_from_Output.Academy.Rec2020_ST2084_P3D65limited_1000nit.exr* - `InvOutput.Academy.Rec2020_ST2084_P3D65limited_1000nit.ctl` applied to *Output/SonyF35.StillLife_Output.Academy.Rec2020_ST2084_P3D65limited_1000nit.tiff*
  - *SonyF35.StillLife_from_Output.Academy.Rec2020_ST2084_P3D65limited_2000nit.exr* - `InvOutput.Academy.Rec2020_ST2084_P3D65limited_2000nit.ctl` applied to *Output/SonyF35.StillLife_Output.Academy.Rec2020_ST2084_P3D65limited_2000nit.tiff*
  - *SonyF35.StillLife_from_Output.Academy.Rec2020_ST2084_P3D65limited_4000nit.exr* - `InvOutput.Academy.Rec2020_ST2084_P3D65limited_4000nit.ctl` applied to *Output/SonyF35.StillLife_Output.Academy.Rec2020_ST2084_P3D65limited_4000nit.tiff*
  - *SonyF35.StillLife_from_Output.Academy.Rec2020_ST2084_P3D65limited_500nit.exr* - `InvOutput.Academy.Rec2020_ST2084_P3D65limited_500nit.ctl` applied to *Output/SonyF35.StillLife_Output.Academy.Rec2020_ST2084_P3D65limited_500nit.tiff*
  - *SonyF35.StillLife_from_Output.Academy.Rec2020_ST2084_Rec709limited_100nitsim.exr* - `InvOutput.Academy.Rec2020_ST2084_Rec709limited_100nitsim.ctl` applied to *Output/SonyF35.StillLife_Output.Academy.Rec2020_ST2084_Rec709limited_100nitsim.tiff*
  - *SonyF35.StillLife_from_Output.Academy.Rec2020.exr* - `InvOutput.Academy.Rec2020.ctl` applied to *Output/SonyF35.StillLife_Output.Academy.Rec2020.tiff*
  - *SonyF35.StillLife_from_Output.Academy.Rec2020_P3D65limited.exr* - `InvOutput.Academy.Rec2020_P3D65limited.ctl` applied to *Output/SonyF35.StillLife_Output.Academy.Rec2020_P3D65limited.tiff*
  - *SonyF35.StillLife_from_Output.Academy.Rec2020_Rec709limited.exr* - `InvOutput.Academy.Rec2020_Rec709limited.ctl` applied to *Output/SonyF35.StillLife_Output.Academy.Rec2020_Rec709limited.tiff*
  - *SonyF35.StillLife_from_Output.Academy.Rec709.exr* - `InvOutput.Academy.Rec709.ctl` applied to *Output/SonyF35.StillLife_Output.Academy.Rec709.tiff*
  - *SonyF35.StillLife_from_Output.Academy.Rec709_D60sim.exr* - `InvOutput.Academy.Rec709_D60sim.ctl` applied to *Output/SonyF35.StillLife_Output.Academy.Rec709_D60sim.tiff*
  - *SonyF35.StillLife_from_Output.Academy.sRGB.exr* - `InvOutput.Academy.sRGB.ctl` applied to *Output/SonyF35.StillLife_Output.Academy.sRGB.tiff*
  - *SonyF35.StillLife_from_Output.Academy.sRGB_D60sim.exr* - `InvOutput.Academy.sRGB_D60sim.ctl` applied to *Output/SonyF35.StillLife_Output.Academy.sRGB_D60sim.tiff*
  - *SonyF35.StillLife_from_Output.Academy.sRGB_Gamma_2pt2.exr* - `InvOutput.Academy.sRGB_Gamma_2pt2.ctl` applied to *Output/SonyF35.StillLife_Output.Academy.sRGB_Gamma_2pt2.tiff*
  - *syntheticChart.01_from_Output.Academy.DisplayP3.exr* - `InvOutput.Academy.DisplayP3.ctl` applied to *Output/syntheticChart.01_Output.Academy.DisplayP3.tiff*
  - *syntheticChart.01_from_Output.Academy.DisplayP3_D60sim.exr* - `InvOutput.Academy.DisplayP3_D60sim.ctl` applied to *Output/syntheticChart.01_Output.Academy.DisplayP3_D60sim.tiff*
  - *syntheticChart.01_from_Output.Academy.P3D65_ST2084_1000nit.exr* - `InvOutput.Academy.P3D65_ST2084_1000nit.ctl` applied to *Output/syntheticChart.01_Output.Academy.P3D65_ST2084_1000nit.tiff*
  - *syntheticChart.01_from_Output.Academy.P3D65_ST2084_108nit.exr* - `InvOutput.Academy.P3D65_ST2084_108nit.ctl` applied to *Output/syntheticChart.01_Output.Academy.P3D65_ST2084_108nit.tiff*
  - *syntheticChart.01_from_Output.Academy.P3D65_ST2084_2000nit.exr* - `InvOutput.Academy.P3D65_ST2084_2000nit.ctl` applied to *Output/syntheticChart.01_Output.Academy.P3D65_ST2084_2000nit.tiff*
  - *syntheticChart.01_from_Output.Academy.P3D65_ST2084_4000nit.exr* - `InvOutput.Academy.P3D65_ST2084_4000nit.ctl` applied to *Output/syntheticChart.01_Output.Academy.P3D65_ST2084_4000nit.tiff*
  - *syntheticChart.01_from_Output.Academy.P3D60.exr* - `InvOutput.Academy.P3D60.ctl` applied to *Output/syntheticChart.01_Output.Academy.P3D60.tiff*
  - *syntheticChart.01_from_Output.Academy.P3D65.exr* - `InvOutput.Academy.P3D65.ctl` applied to *Output/syntheticChart.01_Output.Academy.P3D65.tiff*
  - *syntheticChart.01_from_Output.Academy.P3D65_D60sim.exr* - `InvOutput.Academy.P3D65_D60sim.ctl` applied to *Output/syntheticChart.01_Output.Academy.P3D65_D60sim.tiff*
  - *syntheticChart.01_from_Output.Academy.P3D65_Rec709limited.exr* - `InvOutput.Academy.P3D65_Rec709limited.ctl` applied to *Output/syntheticChart.01_Output.Academy.P3D65_Rec709limited.tiff*
  - *syntheticChart.01_from_Output.Academy.P3DCI_D60sim.exr* - `InvOutput.Academy.P3DCI_D60sim.ctl` applied to *Output/syntheticChart.01_Output.Academy.P3DCI_D60sim.tiff*
  - *syntheticChart.01_from_Output.Academy.P3DCI_D65sim.exr* - `InvOutput.Academy.P3DCI_D65sim.ctl` applied to *Output/syntheticChart.01_Output.Academy.P3DCI_D65sim.tiff*
  - *syntheticChart.01_from_Output.Academy.Rec2020_ST2084_1000nit.exr* - `InvOutput.Academy.Rec2020_ST2084_1000nit.ctl` applied to *Output/syntheticChart.01_Output.Academy.Rec2020_ST2084_1000nit.tiff*
  - *syntheticChart.01_from_Output.Academy.Rec2020_ST2084_2000nit.exr* - `InvOutput.Academy.Rec2020_ST2084_2000nit.ctl` applied to *Output/syntheticChart.01_Output.Academy.Rec2020_ST2084_2000nit.tiff*
  - *syntheticChart.01_from_Output.Academy.Rec2020_ST2084_4000nit.exr* - `InvOutput.Academy.Rec2020_ST2084_4000nit.ctl` applied to *Output/syntheticChart.01_Output.Academy.Rec2020_ST2084_4000nit.tiff*
  - *syntheticChart.01_from_Output.Academy.Rec2020_ST2084_500nit.exr* - `InvOutput.Academy.Rec2020_ST2084_500nit.ctl` applied to *Output/syntheticChart.01_Output.Academy.Rec2020_ST2084_500nit.tiff*
  - *syntheticChart.01_from_Output.Academy.Rec2020_ST2084_P3D65limited_1000nit.exr* - `InvOutput.Academy.Rec2020_ST2084_P3D65limited_1000nit.ctl` applied to *Output/syntheticChart.01_Output.Academy.Rec2020_ST2084_P3D65limited_1000nit.tiff*
  - *syntheticChart.01_from_Output.Academy.Rec2020_ST2084_P3D65limited_2000nit.exr* - `InvOutput.Academy.Rec2020_ST2084_P3D65limited_2000nit.ctl` applied to *Output/syntheticChart.01_Output.Academy.Rec2020_ST2084_P3D65limited_2000nit.tiff*
  - *syntheticChart.01_from_Output.Academy.Rec2020_ST2084_P3D65limited_4000nit.exr* - `InvOutput.Academy.Rec2020_ST2084_P3D65limited_4000nit.ctl` applied to *Output/syntheticChart.01_Output.Academy.Rec2020_ST2084_P3D65limited_4000nit.tiff*
  - *syntheticChart.01_from_Output.Academy.Rec2020_ST2084_P3D65limited_500nit.exr* - `InvOutput.Academy.Rec2020_ST2084_P3D65limited_500nit.ctl` applied to *Output/syntheticChart.01_Output.Academy.Rec2020_ST2084_P3D65limited_500nit.tiff*
  - *syntheticChart.01_from_Output.Academy.Rec2020_ST2084_Rec709limited_100nitsim.exr* - `InvOutput.Academy.Rec2020_ST2084_Rec709limited_100nitsim.ctl` applied to *Output/syntheticChart.01_Output.Academy.Rec2020_ST2084_Rec709limited_100nitsim.tiff*
  - *syntheticChart.01_from_Output.Academy.Rec2020.exr* - `InvOutput.Academy.Rec2020.ctl` applied to *Output/syntheticChart.01_Output.Academy.Rec2020.tiff*
  - *syntheticChart.01_from_Output.Academy.Rec2020_P3D65limited.exr* - `InvOutput.Academy.Rec2020_P3D65limited.ctl` applied to *Output/syntheticChart.01_Output.Academy.Rec2020_P3D65limited.tiff*
  - *syntheticChart.01_from_Output.Academy.Rec2020_Rec709limited.exr* - `InvOutput.Academy.Rec2020_Rec709limited.ctl` applied to *Output/syntheticChart.01_Output.Academy.Rec2020_Rec709limited.tiff*
  - *syntheticChart.01_from_Output.Academy.Rec709.exr* - `InvOutput.Academy.Rec709.ctl` applied to *Output/syntheticChart.01_Output.Academy.Rec709.tiff*
  - *syntheticChart.01_from_Output.Academy.Rec709_D60sim.exr* - `InvOutput.Academy.Rec709_D60sim.ctl` applied to *Output/syntheticChart.01_Output.Academy.Rec709_D60sim.tiff*
  - *syntheticChart.01_from_Output.Academy.sRGB.exr* - `InvOutput.Academy.sRGB.ctl` applied to *Output/syntheticChart.01_Output.Academy.sRGB.tiff*
  - *syntheticChart.01_from_Output.Academy.sRGB_D60sim.exr* - `InvOutput.Academy.sRGB_D60sim.ctl` applied to *Output/syntheticChart.01_Output.Academy.sRGB_D60sim.tiff*
  - *syntheticChart.01_from_Output.Academy.sRGB_Gamma_2pt2.exr* - `InvOutput.Academy.sRGB_Gamma_2pt2.ctl` applied to *Output/syntheticChart.01_Output.Academy.sRGB_Gamma_2pt2.tiff*
    
#### Output_on_InvACES/
File names in the `Output_on_InvACES` directory are named the same as those in `Output`, with the name of the transform that was applied  the name of the transform that was applied _appended to_ the name of the original image file.

These files are the result of applying the forward direction Output Transforms again on the each of the corresponding images in `InvACES`, thus representing a 1-time round-trip "Forward->Inverse->Forward".

File listing:

  - *SonyF35.StillLife_Output.Academy.DisplayP3.tiff* - `Output.Academy.DisplayP3.ctl` applied to *InvACES/SonyF35.StillLife_from_Output.Academy.DisplayP3.exr*
  - *SonyF35.StillLife_Output.Academy.DisplayP3_D60sim.tiff* - `Output.Academy.DisplayP3_D60sim.ctl` applied to *InvACES/SonyF35.StillLife_from_Output.Academy.DisplayP3_D60sim.exr*
  - *SonyF35.StillLife_Output.Academy.P3D65_ST2084_1000nit.tiff* - `Output.Academy.P3D65_ST2084_1000nit.ctl` applied to *InvACES/SonyF35.StillLife_from_Output.Academy.P3D65_ST2084_1000nit.exr*
  - *SonyF35.StillLife_Output.Academy.P3D65_ST2084_108nit.tiff* - `Output.Academy.P3D65_ST2084_108nit.ctl` applied to *InvACES/SonyF35.StillLife_from_Output.Academy.P3D65_ST2084_108nit.exr*
  - *SonyF35.StillLife_Output.Academy.P3D65_ST2084_2000nit.tiff* - `Output.Academy.P3D65_ST2084_2000nit.ctl` applied to *InvACES/SonyF35.StillLife_from_Output.Academy.P3D65_ST2084_2000nit.exr*
  - *SonyF35.StillLife_Output.Academy.P3D65_ST2084_4000nit.tiff* - `Output.Academy.P3D65_ST2084_4000nit.ctl` applied to *InvACES/SonyF35.StillLife_from_Output.Academy.P3D65_ST2084_4000nit.exr*
  - *SonyF35.StillLife_Output.Academy.P3D60.tiff* - `Output.Academy.P3D60.ctl` applied to *InvACES/SonyF35.StillLife_from_Output.Academy.P3D60.exr*
  - *SonyF35.StillLife_Output.Academy.P3D65.tiff* - `Output.Academy.P3D65.ctl` applied to *InvACES/SonyF35.StillLife_from_Output.Academy.P3D65.exr*
  - *SonyF35.StillLife_Output.Academy.P3D65_D60sim.tiff* - `Output.Academy.P3D65_D60sim.ctl` applied to *InvACES/SonyF35.StillLife_from_Output.Academy.P3D65_D60sim.exr*
  - *SonyF35.StillLife_Output.Academy.P3D65_Rec709limited.tiff* - `Output.Academy.P3D65_Rec709limited.ctl` applied to *InvACES/SonyF35.StillLife_from_Output.Academy.P3D65_Rec709limited.exr*
  - *SonyF35.StillLife_Output.Academy.P3DCI_D60sim.tiff* - `Output.Academy.P3DCI_D60sim.ctl` applied to *InvACES/SonyF35.StillLife_from_Output.Academy.P3DCI_D60sim.exr*
  - *SonyF35.StillLife_Output.Academy.P3DCI_D65sim.tiff* - `Output.Academy.P3DCI_D65sim.ctl` applied to *InvACES/SonyF35.StillLife_from_Output.Academy.P3DCI_D65sim.exr*
  - *SonyF35.StillLife_Output.Academy.Rec2020_ST2084_1000nit.tiff* - `Output.Academy.Rec2020_ST2084_1000nit.ctl` applied to *InvACES/SonyF35.StillLife_from_Output.Academy.Rec2020_ST2084_1000nit.exr*
  - *SonyF35.StillLife_Output.Academy.Rec2020_ST2084_2000nit.tiff* - `Output.Academy.Rec2020_ST2084_2000nit.ctl` applied to *InvACES/SonyF35.StillLife_from_Output.Academy.Rec2020_ST2084_2000nit.exr*
  - *SonyF35.StillLife_Output.Academy.Rec2020_ST2084_4000nit.tiff* - `Output.Academy.Rec2020_ST2084_4000nit.ctl` applied to *InvACES/SonyF35.StillLife_from_Output.Academy.Rec2020_ST2084_4000nit.exr*
  - *SonyF35.StillLife_Output.Academy.Rec2020_ST2084_500nit.tiff* - `Output.Academy.Rec2020_ST2084_500nit.ctl` applied to *InvACES/SonyF35.StillLife_from_Output.Academy.Rec2020_ST2084_500nit.exr*
  - *SonyF35.StillLife_Output.Academy.Rec2020_ST2084_P3D65limited_1000nit.tiff* - `Output.Academy.Rec2020_ST2084_P3D65limited_1000nit.ctl` applied to *InvACES/SonyF35.StillLife_from_Output.Academy.Rec2020_ST2084_P3D65limited_1000nit.exr*
  - *SonyF35.StillLife_Output.Academy.Rec2020_ST2084_P3D65limited_2000nit.tiff* - `Output.Academy.Rec2020_ST2084_P3D65limited_2000nit.ctl` applied to *InvACES/SonyF35.StillLife_from_Output.Academy.Rec2020_ST2084_P3D65limited_2000nit.exr*
  - *SonyF35.StillLife_Output.Academy.Rec2020_ST2084_P3D65limited_4000nit.tiff* - `Output.Academy.Rec2020_ST2084_P3D65limited_4000nit.ctl` applied to *InvACES/SonyF35.StillLife_from_Output.Academy.Rec2020_ST2084_P3D65limited_4000nit.exr*
  - *SonyF35.StillLife_Output.Academy.Rec2020_ST2084_P3D65limited_500nit.tiff* - `Output.Academy.Rec2020_ST2084_P3D65limited_500nit.ctl` applied to *InvACES/SonyF35.StillLife_from_Output.Academy.Rec2020_ST2084_P3D65limited_500nit.exr*
  - *SonyF35.StillLife_Output.Academy.Rec2020_ST2084_Rec709limited_100nitsim.tiff* - `Output.Academy.Rec2020_ST2084_Rec709limited_100nitsim.ctl` applied to *InvACES/SonyF35.StillLife_from_Output.Academy.Rec2020_ST2084_Rec709limited_100nitsim.exr*
  - *SonyF35.StillLife_Output.Academy.Rec2020.tiff* - `Output.Academy.Rec2020.ctl` applied to *InvACES/SonyF35.StillLife_from_Output.Academy.Rec2020.exr*
  - *SonyF35.StillLife_Output.Academy.Rec2020_P3D65limited.tiff* - `Output.Academy.Rec2020_P3D65limited.ctl` applied to *InvACES/SonyF35.StillLife_from_Output.Academy.Rec2020_P3D65limited.exr*
  - *SonyF35.StillLife_Output.Academy.Rec2020_Rec709limited.tiff* - `Output.Academy.Rec2020_Rec709limited.ctl` applied to *InvACES/SonyF35.StillLife_from_Output.Academy.Rec2020_Rec709limited.exr*
  - *SonyF35.StillLife_Output.Academy.Rec709.tiff* - `Output.Academy.Rec709.ctl` applied to *InvACES/SonyF35.StillLife_from_Output.Academy.Rec709.exr*
  - *SonyF35.StillLife_Output.Academy.Rec709_D60sim.tiff* - `Output.Academy.Rec709_D60sim.ctl` applied to *InvACES/SonyF35.StillLife_from_Output.Academy.Rec709_D60sim.exr*
  - *SonyF35.StillLife_Output.Academy.sRGB.tiff* - `Output.Academy.sRGB.ctl` applied to *InvACES/SonyF35.StillLife_from_Output.Academy.sRGB.exr*
  - *SonyF35.StillLife_Output.Academy.sRGB_D60sim.tiff* - `Output.Academy.sRGB_D60sim.ctl` applied to *InvACES/SonyF35.StillLife_from_Output.Academy.sRGB_D60sim.exr*
  - *SonyF35.StillLife_Output.Academy.sRGB_Gamma_2pt2.tiff* - `Output.Academy.sRGB_Gamma_2pt2.ctl` applied to *InvACES/SonyF35.StillLife_from_Output.Academy.sRGB_Gamma_2pt2.exr*
  - *syntheticChart.01_Output.Academy.DisplayP3.tiff* - `Output.Academy.DisplayP3.ctl` applied to *InvACES/syntheticChart.01_from_Output.Academy.DisplayP3.exr*
  - *syntheticChart.01_Output.Academy.DisplayP3_D60sim.tiff* - `Output.Academy.DisplayP3_D60sim.ctl` applied to *InvACES/syntheticChart.01_from_Output.Academy.DisplayP3_D60sim.exr*
  - *syntheticChart.01_Output.Academy.P3D65_ST2084_1000nit.tiff* - `Output.Academy.P3D65_ST2084_1000nit.ctl` applied to *InvACES/syntheticChart.01_from_Output.Academy.P3D65_ST2084_1000nit.exr*
  - *syntheticChart.01_Output.Academy.P3D65_ST2084_108nit.tiff* - `Output.Academy.P3D65_ST2084_108nit.ctl` applied to *InvACES/syntheticChart.01_from_Output.Academy.P3D65_ST2084_108nit.exr*
  - *syntheticChart.01_Output.Academy.P3D65_ST2084_2000nit.tiff* - `Output.Academy.P3D65_ST2084_2000nit.ctl` applied to *InvACES/syntheticChart.01_from_Output.Academy.P3D65_ST2084_2000nit.exr*
  - *syntheticChart.01_Output.Academy.P3D65_ST2084_4000nit.tiff* - `Output.Academy.P3D65_ST2084_4000nit.ctl` applied to *InvACES/syntheticChart.01_from_Output.Academy.P3D65_ST2084_4000nit.exr*
  - *syntheticChart.01_Output.Academy.P3D60.tiff* - `Output.Academy.P3D60.ctl` applied to *InvACES/syntheticChart.01_from_Output.Academy.P3D60.exr*
  - *syntheticChart.01_Output.Academy.P3D65.tiff* - `Output.Academy.P3D65.ctl` applied to *InvACES/syntheticChart.01_from_Output.Academy.P3D65.exr*
  - *syntheticChart.01_Output.Academy.P3D65_D60sim.tiff* - `Output.Academy.P3D65_D60sim.ctl` applied to *InvACES/syntheticChart.01_from_Output.Academy.P3D65_D60sim.exr*
  - *syntheticChart.01_Output.Academy.P3D65_Rec709limited.tiff* - `Output.Academy.P3D65_Rec709limited.ctl` applied to *InvACES/syntheticChart.01_from_Output.Academy.P3D65_Rec709limited.exr*
  - *syntheticChart.01_Output.Academy.P3DCI_D60sim.tiff* - `Output.Academy.P3DCI_D60sim.ctl` applied to *InvACES/syntheticChart.01_from_Output.Academy.P3DCI_D60sim.exr*
  - *syntheticChart.01_Output.Academy.P3DCI_D65sim.tiff* - `Output.Academy.P3DCI_D65sim.ctl` applied to *InvACES/syntheticChart.01_from_Output.Academy.P3DCI_D65sim.exr*
  - *syntheticChart.01_Output.Academy.Rec2020_ST2084_1000nit.tiff* - `Output.Academy.Rec2020_ST2084_1000nit.ctl` applied to *InvACES/syntheticChart.01_from_Output.Academy.Rec2020_ST2084_1000nit.exr*
  - *syntheticChart.01_Output.Academy.Rec2020_ST2084_2000nit.tiff* - `Output.Academy.Rec2020_ST2084_2000nit.ctl` applied to *InvACES/syntheticChart.01_from_Output.Academy.Rec2020_ST2084_2000nit.exr*
  - *syntheticChart.01_Output.Academy.Rec2020_ST2084_4000nit.tiff* - `Output.Academy.Rec2020_ST2084_4000nit.ctl` applied to *InvACES/syntheticChart.01_from_Output.Academy.Rec2020_ST2084_4000nit.exr*
  - *syntheticChart.01_Output.Academy.Rec2020_ST2084_500nit.tiff* - `Output.Academy.Rec2020_ST2084_500nit.ctl` applied to *InvACES/syntheticChart.01_from_Output.Academy.Rec2020_ST2084_500nit.exr*
  - *syntheticChart.01_Output.Academy.Rec2020_ST2084_P3D65limited_1000nit.tiff* - `Output.Academy.Rec2020_ST2084_P3D65limited_1000nit.ctl` applied to *InvACES/syntheticChart.01_from_Output.Academy.Rec2020_ST2084_P3D65limited_1000nit.exr*
  - *syntheticChart.01_Output.Academy.Rec2020_ST2084_P3D65limited_2000nit.tiff* - `Output.Academy.Rec2020_ST2084_P3D65limited_2000nit.ctl` applied to *InvACES/syntheticChart.01_from_Output.Academy.Rec2020_ST2084_P3D65limited_2000nit.exr*
  - *syntheticChart.01_Output.Academy.Rec2020_ST2084_P3D65limited_4000nit.tiff* - `Output.Academy.Rec2020_ST2084_P3D65limited_4000nit.ctl` applied to *InvACES/syntheticChart.01_from_Output.Academy.Rec2020_ST2084_P3D65limited_4000nit.exr*
  - *syntheticChart.01_Output.Academy.Rec2020_ST2084_P3D65limited_500nit.tiff* - `Output.Academy.Rec2020_ST2084_P3D65limited_500nit.ctl` applied to *InvACES/syntheticChart.01_from_Output.Academy.Rec2020_ST2084_P3D65limited_500nit.exr*
  - *syntheticChart.01_Output.Academy.Rec2020_ST2084_Rec709limited_100nitsim.tiff* - `Output.Academy.Rec2020_ST2084_Rec709limited_100nitsim.ctl` applied to *InvACES/syntheticChart.01_from_Output.Academy.Rec2020_ST2084_Rec709limited_100nitsim.exr*
  - *syntheticChart.01_Output.Academy.Rec2020.tiff* - `Output.Academy.Rec2020.ctl` applied to *InvACES/syntheticChart.01_from_Output.Academy.Rec2020.exr*
  - *syntheticChart.01_Output.Academy.Rec2020_P3D65limited.tiff* - `Output.Academy.Rec2020_P3D65limited.ctl` applied to *InvACES/syntheticChart.01_from_Output.Academy.Rec2020_P3D65limited.exr*
  - *syntheticChart.01_Output.Academy.Rec2020_Rec709limited.tiff* - `Output.Academy.Rec2020_Rec709limited.ctl` applied to *InvACES/syntheticChart.01_from_Output.Academy.Rec2020_Rec709limited.exr*
  - *syntheticChart.01_Output.Academy.Rec709.tiff* - `Output.Academy.Rec709.ctl` applied to *InvACES/syntheticChart.01_from_Output.Academy.Rec709.exr*
  - *syntheticChart.01_Output.Academy.Rec709_D60sim.tiff* - `Output.Academy.Rec709_D60sim.ctl` applied to *InvACES/syntheticChart.01_from_Output.Academy.Rec709_D60sim.exr*
  - *syntheticChart.01_Output.Academy.sRGB.tiff* - `Output.Academy.sRGB.ctl` applied to *InvACES/syntheticChart.01_from_Output.Academy.sRGB.exr*
  - *syntheticChart.01_Output.Academy.sRGB_D60sim.tiff* - `Output.Academy.sRGB_D60sim.ctl` applied to *InvACES/syntheticChart.01_from_Output.Academy.sRGB_D60sim.exr*
  - *syntheticChart.01_Output.Academy.sRGB_Gamma_2pt2.tiff* - `Output.Academy.sRGB_Gamma_2pt2.ctl` applied to *InvACES/syntheticChart.01_from_Output.Academy.sRGB_Gamma_2pt2.exr*
   