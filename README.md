# snowflake 
<img src="./img/nix.png" width="250px" align="right"/> <img src="./img/darwin.png" width="200px" align="right"/> 
*It's like magic. Let the snowflakes in.* ❄️

### Nothing more than a configuration using flakes, nix-darwin and home-manager.

These are my complete configurations for use in my daily life using macOS alongside [Nix](https://nixos.org/), which is more than my main package manager, being the most powerful tool alongside [home-manager](https://github.com/nix-community/home-manager) and [nix-darwin](https://github.com/LnL7/nix-darwin).

Maybe this is the time to try something new. If you want, start by running `sh <(curl -L https://nixos.org/nix/install) --daemon` in your terminal.

## Installation

Once you have Nix properly installed on your machine, now is the time to clone this configuration to `~/.config/snowflake` and start having fun in the snow.

```bash
git clone https://github.com/lanjoni/snowflake.git ~/.config/snowflake
```

After cloning the repository we can build with `nix-darwin`:

```bash
# This will activate flakes to start the installation and build. Note that my machine name is "artemis".
nix --extra-experimental-features "nix-command flakes" build .#darwinConfigurations.artemis.system
```

Then just run:

```bash
# nix-darwin will perform a complete rebuild of the system.
./result/sw/bin/darwin-rebuild switch --flake ~/.config/snowflake/.#artemis
```

Done. Now, my entire workflow is in your hands for use. With [flakes](https://nixos.wiki/wiki/Flakes) I can guarantee that everything is in its specific version, validating inconsistencies and guaranteeing a perfect replica.

## Configuration

Now let's talk a little about the organizational structure here so we can analyze more carefully how everything works.

### Structure

Take a look:

```
.
├── README.md
├── flake.lock
├── flake.nix
├── img
│   ├── darwin.png
│   └── nix.png
├── modules
│   ├── darwin
│   │   ├── default.nix
│   │   └── settings
│   │       ├── environment.nix
│   │       ├── homebrew.nix
│   │       ├── system.nix
│   │       └── services.nix***
│   └── home-manager
│       ├── default.nix
│       └── settings
│           ├── inputrc
│           ├── apps.nix***
│           └── zsh.nix
└── result -> /nix/store/somehash
```

The `apps.nix***` and `services.nix***` files are symbolic only and indicate specific application and service configurations only. While applications are managed by `home-manager`, services are managed directly by `nix-darwin` as they need permissions to bootstrap and control with `launchctl`.

### Files

- `flake.nix`: Contains the base configuration of our flake, controlling the expected inputs and outputs, in addition to managing the external urls of `home-manager` and `nix-darwin`;
- `modules/darwin/default.nix`: Contains the complete configuration of our nix-darwin, including imports for configurations, extra options, among others;
- `modules/darwin/settings/environment.nix`: Contains the complete environment configuration, including system path, system packages and login shell (`zsh` in this case);
- `modules/darwin/settings/homebrew.nix`: Contains the [homebrew](https://brew.sh/) configuration, including casks, brews and taps;
- `modules/darwin/settings/system.nix`: Contains the entire system configuration, including appearance, dock management, I/O devices settings, and others;
- `modules/home-manager/default.nix`: Contains the `home-manager` configuration imports, packages and session variables;
- `modules/home-manager/settings/inputrc`: This is just que `inputrrc` file for input settings with `home-manager`;
- `modules/home-manager/settings/zsh.nix`: Contains the entire [zsh](https://zsh.sourceforge.io/) configuration (similar to your `.zshrc` with steroids);
- `result`: A symlink which apoints to your build at `/nix/store`.

Note: if you want to install a simple package, go to `modules/home-manager/default.nix` and add the package name to the `home.packages` list. But, if you want to strictly configure your package, then include a file in `modules/home-manager/settings` with the name of your package and its settings following the template below:

```nix
# At modules/home-manager/settings/yourpackage.nix
{ pkgs, ... }: {
  programs.yourpackage = {
    # Your settings
  };
}
```

And don't forget to import in `modules/home-manager/default.nix`:

```nix
# ...
  imports = [
    ./settings/zsh.nix
    ./settings/yourpackage.nix
  ];
# ...
```

Amazing! To search for packages you can use the [official search at nixos.org](https://search.nixos.org/packages).

## Documentation

To find more content about Nix, follow the links below:

- [NixOS Wiki](https://nixos.wiki/wiki/Main_Page) (Popular wiki to Nix and NixOS users)
- [NixOS Official Website](https://nixos.org/)
- [NixOS GitHub](https://github.com/NixOS)
- [NixOS at Mastodon](https://chaos.social/@nixos_org)
- [NixOS at Twitter](https://twitter.com/nixos_org)
- [NixOS at YouTube](https://www.youtube.com/channel/UC3vIimi9q4AT8EgxYp_dWIw)

Talks and presentations about Nix and NixOS:
- [What Nix Can Do - Matthew Croughan](https://youtu.be/6Le0IbPRzOE?si=eN7xDMgc6aQBui27)
- [A Gentle Introduction to Nix - Bryan Honof](https://youtu.be/gUjvnZ9ZwMs?si=CjBlLfz3yg_wCA1N)
- [Getting Started with Nix - OpenTechLab](https://youtu.be/xXlCcdPz6Vc?si=zs4A9fezu3DQddat)
- [Nix for Startups (full course) - @ecto](https://youtu.be/WJZgzwB3ziE?si=K8sZA7AFr4qmBcbh)
- [Build A Portable Development Environment With Nix Package Manager - Jake Wiesler](https://youtu.be/70YMTHAZyy4?si=lat2tzEG3gJruTu1)
- [Nix flakes explained - Vimjoyer](https://youtu.be/S3VBi6kHw5c?si=QOjRcZjQuBgsRXDz)

## Issues

Any problems with the workflow, documentation or code? Submit an [issue](https://github.com/lanjoni/snowflake/issues).
