# ACES Output Transforms
This repository contains a set of modules that declare presets that will result in Outputs to some commonly used standard output display setups. These include presets designed targeting the same list of outputs as ACES v1.x as well as adding a few new ones. Users are _not_ limited to only the transforms listed in this repository. 

Specifics about the transform parameters and how they are intended to be used can be found on the [ACES documentation site](docs.acescentral.com).

## Dependencies
All transforms in are wrappers to save pre-set display parameters. The rendering algorithm is dependent on the core ACES code in the Lib files that are tracked in [aces-core](github.com/ampas/aces-dev). These Lib files must be added to the `CTL_MODULE_PATH` environment variable (see section 3.2 in "CTLManual.pdf" for details).

## Notes

### Signal Range
By default, all transforms output signal as full range code values. If a SMPTE "legal" signal is required, one can use built-in tools available in whatever software they are using or apply a separate CTL utility transform to convert full range to SMPTE legal range or vice versa. 

In ctlrender, this can be achieved in by appending another `-ctl` call to the end of a transform chain. e.g. add `-ctl Utility.Full_to_Legal.ctl` after the initial `-ctl odt.ctl` string.


### Inverse Transforms
Careful examination of the transforms list will show that not every forward transform has a corresponding inverse transform. In cases where the forward Output Transform has some set of gamut limiting primaries smaller than the display encoding primaries, the inverse for those limited versions have been omitted in favor of a generic inverse from the display encoding container.

It is expected that, if needed, one could use an inverse for the maximum gamut encoded by the display rather than specifically "undo-ing" gamut limited values. In theory, inverse transforms using the specific limiting gamut should be unnecessary, although in practice users may find slight differences in behavior if the make and use an inverse that explicitly accounts for the limiting gamut rather than assuming a generic gamut the size of the display container.


### Identical outputs
Though separate transforms, in practice the code values output by the P3D65 and P3D60 transforms are identical if compared "by the numbers". This is because the outputs are intended to be viewed on different monitors each set such that equal code values produce the chromaticity of either D65 or D60. While we could easily have a single "P3 for equal code value output" transform, each exists with its own name for explicitness and to avoid confusion. Use the one that is appropriate to your projector white point setting and assumed observer adapted white.
