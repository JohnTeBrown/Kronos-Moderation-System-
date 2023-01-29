<div align="center">
    <img src="https://tr.rbxcdn.com/b1dec1d89350db0dff78c0435d0fdd8a/420/420/Image/Png"/>
    <div>&nbsp;</div>
    <a href="https://create.roblox.com/marketplace/asset/12295560471/MainModule">
        <img src="https://img.shields.io/static/v1?label=roblox&message=model&color=blue&logo=roblox&logoColor=white"/>
    </a>
</div>

---

Kronos is a community-maintained server moderation and management system created for use on the Roblox platform.

## ✨ Installation

📢 **New to Kronos? Don't worry it works just like adonis so take a look at the adonis official quick start video [here](https://youtu.be/1f9x9gdxLjw) or read the unofficial setup guide [here](https://devforum.roblox.com/t/1535122).**

if you encounter a bug please use githubs issues feature and well get onto fixing it.

### Method 1 (recommended): Official Roblox Model

1. [Take a copy](https://create.roblox.com/marketplace/asset/12295560471/MainModule) of the Kronos MainModule model from the Roblox Library.
2. Insert the model into Studio using the Toolbox, and make a script then require the MainModule in the script and place it under `ServerScriptService`. (Do not leave it in the `Workspace`!)

### Method 2: GitHub Releases


ℹ️ **Note:** By default, snapshots included in releases have [`DebugMode`](#🔧-debug-mode) enabled.

### Method 3: Filesystem

1. Download the repository to your computer's file system.
2. Install and use a plugin like [Rojo](https://rojo.space/) to compile Kronos into a `rbxmx` file.
    If using Rojo, you can run `rojo build /path/to/adonis -o Adonis.rbxmx` to build an `rbxmx`.
3. Import the compiled model file into Studio.

ℹ️ **Note:** By default, loaders compiled from the repository have [`DebugMode`](#🔧-debug-mode) enabled.

**⚠️ Method 3 compiles the _bleeding edge_ version of Kronos, which may be not fully tested and is highly unstable.**

### ⚙️ Configuring Kronos

Once you've inserted the Kronos loader into your game, open `Kronos_Loader` > `Config` > `Settings`, and change `settings.DataStoreKey` to something absolutely random (eg. `"2fgi02e)^Q"`). This is for security as it prevents serverside tampering with Kronos's datastores.

You may then edit the Settings module to configure Kronos to suit your game. Instructions and elaboration are provided within the Settings module.

### 🔧 Debug Mode

The Kronos loader provides a `DebugMode` option which will load a local copy of the `MainModule` rather than fetching the latest version. This could be useful if you are a contributor working on the `MainModule`, or want to maintain a custom version for your game. Debug mode expects the `MainModule` to share the same parent with the loader model (e.g. both should be in `ServerScriptService`). **By default, snapshots provided in releases have `DebugMode` enabled.**

#### Toggling debug mode

* Open `Kronos_Loader` > `Loader` > `Loader`
* Change `DebugMode` at the end of the `data` table to the desired value (e.g. `DebugMode = false`)

* Official Kronos Loader: [SOON]
* Official MainModule: <https://create.roblox.com/marketplace/asset/12295560471/MainModule>

### Reference
Kronos Is Basically Adonis, Checkout the adonis docs if you get stuck!

* 📄 Documentation: <https://github.com/Epix-Incorporated/Adonis/wiki>
* 📘 User Manual: <https://github.com/Epix-Incorporated/Adonis/wiki/User-Manual-&-Feature-Showcase>
* 📜 Contributing Guide: <https://github.com/Epix-Incorporated/Adonis/blob/master/CONTRIBUTING.md>

### Social

* Coming Soon
* Coming Soon
* Coming Soon

### Misc
Checkout some of the adonis plugins and donor perks, adonis is what enables Kronos to exist support the devs!

* Plugins Repository: <https://github.com/Epix-Incorporated/Adonis-Plugins>
* Donor Perks Pass: <https://www.roblox.com/game-pass/1348327>

## ⭐ Contributing

The purpose of this repository is to allow others to contribute and make improvements to Adonis. Even if you've never contributed to GitHub before, we would appreciate any contributions that you can provide.

### 📜 Contributing Guide

Read the [contributing guide](https://github.com/Epix-Incorporated/Adonis/blob/master/CONTRIBUTING.md) to get a better understanding of our development process and workflow, along with answers to common questions related to contributing to Adonis.

### ⚖️ License

Adonis is available under the terms of the MIT license. Read more details about the license [here](https://github.com/Epix-Incorporated/Adonis/blob/master/LICENSE).

### Thank you to our previouse & current contributors

[![contributors](https://contributors-img.web.app/image?repo=Epix-Incorporated/Adonis)](https://github.com/Epix-Incorporated/Adonis/graphs/contributors)

