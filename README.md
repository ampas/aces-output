# ACES Output Transforms #

[![CLA assistant](https://cla-assistant.io/readme/badge/ampas/aces-output)](https://cla-assistant.io/ampas/aces-output)

This repository contains a set of modules that declare presets that will result in Outputs to some commonly used standard output display setups. These include presets designed targeting the mostly the same list of outputs as ACES v1.x but adding a few new ones or removing a few less commonly used. Users are _not_ limited to only the transforms listed in this repository and it is simple to create additional output transforms to display characteristics other than those supplied as presets.

Specifics about the transform parameters and how they are intended to be used can be found on the [ACES documentation site](docs.acescentral.com).

## Dependencies ##
All transforms save pre-set display parameters but the rendering itself is dependent on the core Lib files tracked in [aces-core](github.com/ampas/aces-dev). These Lib files must be added to the `CTL_MODULE_PATH` environment variable (see section 3.2 in "CTLManual.pdf" for details).

## Notes ##

### Contrib directory ###
The `contrib` directory contains community-supplied transforms, provided as-is and may not be optimal. The ACES team may have done minimal testing on these transforms, but please visit [ACESCentral.com](https://community.acescentral.com) to review or leave feedback.

### Note to Implementers ###

#### Implementation Guidelines ####
- **Primary Transforms**: The transforms located in each of the subdirectories of the root directory, with the exception of the `contrib` directory, are a basic subset of possible outputs and should be implemented in all ACES systems. These subdirectories contain the standardized, validated transforms necessary for maintaining compatibility and functionality across different platforms and devices.
- **Community Contributed Transforms**: The `contrib` directory contains additional community-supplied transforms. These are considered optional. They may provide useful extensions but vary in their testing and support. It is advisable to evaluate their reliability and suitability for your specific needs before integration.
- **Updates and Maintenance**: Ensure your system includes the most recent updates by regularly incorporating new or revised transforms from the main subdirectories, keeping in line with the latest ACES specifications and industry practices.

### Signal Range ###
By default, all transforms output signal as full range code values. If a SMPTE "legal" signal is required, one can use built-in tools available in whatever software they are using or apply a separate CTL utility transform to convert full range to SMPTE legal range or vice versa. 

In ctlrender, this can be achieved in by appending another `-ctl` call to the end of a transform chain. e.g. add `-ctl Utility.Full_to_Legal.ctl` after the initial `-ctl odt.ctl` string.

## License ##
This project is licensed under the terms of the [LICENSE](./LICENSE.md) agreement.

## Contributing ##
Thank you for your interest in contributing to our project. Before any contributions can be accepted, we require contributors to sign a Contributor License Agreement (CLA) to ensure that the project can freely use your contributions. You can find more details and instructions on how to sign the CLA in the [CONTRIBUTING.md](./CONTRIBUTING.md) file.

## Support ## 
For support, please visit [ACESCentral.com](https://acescentral.com)
