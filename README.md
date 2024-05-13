# nix-nomad-menu
Declarative nix configuration for nomad.menu


NoMAD end of life
-
Note that the repository at https://github.com/jamf/NoMAD is ready-only and according to an article on the [Jamf Blog](https://www.jamf.com/blog/jamf-to-archive-nomad-open-source-projects/), NoMAD will no longer recive updates. Unless someone creates a fork, it's abandonware.


NoMAD management
-
See the template flake.nix for an explanation of options

This project provides the following management options for NoMAD:

* Install NoMAD as a system package
* Create a system launchd service that starts NoMAD at login
* Create a user launchd service that starts NoMAD at login


Installation instructions
-

* Flake: Simply add this flake to your the `inputs` section of your flake.nix

* Configuration.nix: This repo has a default.nix in the root directory that can be added to `imports`


Alternative ways to install NoMAD
-
* manually - https://nomad.menu/support/
* homebrew - https://formulae.brew.sh/cask/nomad
* [nix-homebrew](https://github.com/zhaofengli/nix-homebrew) - allows you to declaratively install homebrew packages. This was how I originally ran NoMAD until creating this flake


License
-
This project falls under the [MIT](./LICENSE) license. The developer(s) provide this software as-is, without any guarantee or liability for its use. 