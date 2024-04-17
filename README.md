# aces-output
Home to the reference ACES Output Transforms

## Dependencies
All transforms are holders for display parameters and the bulk of the processing is dependent on the core ACES code in the Lib files that are tracked in [aces-core](github.com/ampas/aces-dev). Add these to the CTL_MODULE_PATH environment variable (see section 3.2 in "CTLManual.pdf" for details).


## Signal Range
By default, all transforms output signal as full range code values. If a SMPTE "legal" signal is required, there is a utility to convert full to SMPTE legal or vice versa. 

In ctlrender, this can be achieved in one call by appending another -ctl call to the end of a transform chain. e.g. add '-ctl Utility.Full_to_Legal.ctl' after the '-ctl odt.ctl' string.


## Identical outputs
Though separate transforms, in practice the code values output by the P3D65 and P3D60 transforms are identical if compared "by the numbers". This is because the outputs are intended to be viewed on different monitors each set such that equal code values produce the chromaticity of either D65 or D60. We could have a single "P3 for equal code value output" transform, but for to avoid confusion, each exists with its own name.

## Inverse
Where Output Transforms have some sort of gamut limiting that is smaller than the display encoding primaries, inverses for those specific limited versions have been omitted. It is expected that, if needed, one could use an inverse for the maximum gamut encoded by the display rather than "undo-ing" gamut limited values. 

Slight differences could occur if using an inverse that accounts for the limiting gamut rather than assuming a generic gamut the size of the display encoding, but in theory, inverse transforms using the limiting gamut should be unnecessary.