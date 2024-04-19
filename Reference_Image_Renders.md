## Reference Images ##

Reference, or "golden", images have been rendered through each transform in order to help verify your implementation of the reference color transformations. Each provided file is the result of applying one of the transforms included with the system. 

One source image is pictorial and the other is a synthetically generated test chart.

Reference images are hosted on [Dropbox](https://www.dropbox.com/scl/fo/zorgtgohsmn4xjb5wbplg/AJv-W01I-Dbz1mzo8gkKfZI?rlkey=4ksl2hefncrjfr080vdr00c4n&dl=0) and can be downloaded individually or as a zip file.

### Confirmation ###
To confirm your implementation of each transform:

  1. Use your implementation to process the "input" reference image appropriate to the transform being tested. In the case of the Output Transforms, the input image is one of the frames provided in the `/ACES` directory.
  2. Compare the output from your implementation to the provided corresponding "output" reference image. The images in `/Output` are the result of applying one of the transforms to one of the ACES input images.
     


### Naming Scheme ###

#### /Output
File names in the `/Output` directory have the name of the transform that was applied _appended to_ the name of the image file was used as input.

Generically, applying `SomeTransformName.ctl` on input image `SomeImageName.exr` would be named `*SomeImageName_SomeTransformName.tiff*`.

Specific example: 

* *SonyF35.StillLife_Output.Academy.Rec709.tiff* is the result of transform `Output.Academy.Rec709.ctl` applied to *SonyF35.StillLife.exr*
    
#### /InvACES
File names in the `/InvACES` directory have the name of the transform that was applied appended to the name of the image file was used as input.

Generically, applying `SomeTransformName.ctl` on input image *SomeImageName.exr* would be named *SomeImageName_SomeTransformName.tiff*.

Specific example: 

* *SonyF35.StillLife_Output.Academy.Rec709.tiff* is the result of transform `Output.Academy.Rec709.ctl` applied to *SonyF35.StillLife.exr*
    

   