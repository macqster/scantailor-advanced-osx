# scantailor-advanced-osx
Homebrew formula and App bundler for Scantailor (Advanced). Now uses Qt6 framework.

> [!WARNING] 
> No more App bundles !
>
> To run homemade .app bundles you need to pay 99€/year to Apple which I do not want to pay.

See [4lex4/scantailor-advanced](https://github.com/4lex4/scantailor-advanced) for the original project.
The original project seems to be abandoned, this formula now fetches from the community project [ScanTailor-Advanced/scantailor-advanced](https://github.com/ScanTailor-Advanced/scantailor-advanced)

This install you first need the `brew` package manager : [https://brew.sh/](https://brew.sh/).

Then open your terminal and run :

```
brew install yb85/homebrew-tap/scantailor-advanced

# TO RUN IT
scantailor

# OR (detached from the terminal)
scantailor &

```

If the installation succeeds you will see something like this :

```
==> Downloading https://formulae.brew.sh/api/formula.jws.json
==> Fetching downloads for: scantailor-advanced
✔︎ Bottle Manifest boost (1.90.0)
                                                                                                                           Downloaded   28.8KB/ 28.8KB
# [...] MANY QT DEPENDENCIES

✔︎ Formula scantailor-advanced (1.0.19)                                                                                                                      Verified    988.9KB/988.9KB
✔︎ Bottle boost (1.90.0)                                                                                                                                     Downloaded   62.3MB/ 62.3MB
✔︎ Bottle cmake (4.2.2)                                                                                                                                      Downloaded   18.9MB/ 18.9MB
✔︎ Bottle qtwebengine (6.10.1)                                                                                                                               Downloaded  133.1MB/133.1MB
==> Installing scantailor-advanced from yb85/tap
==> Installing dependencies for yb85/tap/scantailor-advanced: boost, assimp, dbus, double-conversion, harfbuzz, md4c, qtbase, qtsvg, qtdeclarative, qtshadertools, qt3d, qt5compat, qtcharts, qtconnectivity, qtdatavis3d, qtquicktimeline, qtquick3d, qtgraphs, abseil, protobuf, qtgrpc, qtwebsockets, qthttpserver, little-cms2, libmng, qtimageformats, qtlanguageserver, qtserialport, qtpositioning, qtlocation, qtlottie, qtmultimedia, qtnetworkauth, qtquick3dphysics, qtquickeffectmaker, qtremoteobjects, qtscxml, qtsensors, qtserialbus, qtspeech, litehtml, qttools, qttranslations, hunspell, qtvirtualkeyboard, qtwebchannel, qtwebengine, qtwebview, qt, jpeg, zlib and cmake
==> Installing yb85/tap/scantailor-advanced dependency: boost
==> Pouring boost--1.90.0.arm64_sequoia.bottle.tar.gz
🍺  /opt/homebrew/Cellar/boost/1.90.0: 16,255 files, 362.4MB
==> Installing yb85/tap/scantailor-advanced dependency: assimp
==> Pouring assimp--6.0.4.arm64_sequoia.bottle.tar.gz
🍺  /opt/homebrew/Cellar/assimp/6.0.4: 104 files, 11.1MB

# [...] MANY INSTALLS

==> Installing yb85/tap/scantailor-advanced
==> Setting versioning tag to #release@1.0.19 (build 20260126)
==> cmake ..
==> make
==> make install
🍺  /opt/homebrew/Cellar/scantailor-advanced/1.0.19: 16 files, 4.9MB, built in 2 minutes 22 seconds
==> Running `brew cleanup scantailor-advanced`...
Disable this behaviour by setting `HOMEBREW_NO_INSTALL_CLEANUP=1`.
Hide these hints with `HOMEBREW_NO_ENV_HINTS=1` (see `man brew`).
```



# DEPRECATED (as of 2025)

**Look at the [Releases](https://github.com/yb85/scantailor-advanced-osx/releases) section for a bundled App (macos12 Monterey x64 and macos10 Catalina x64).**

## Installing via homebrew ##

### Install script ###

All automated, execute in your terminal :
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/yb85/scantailor-advanced-osx/HEAD/install.sh)"
```

This script tries to install `brew` and `git` if missing. It may ask you to install the command-line developper tools.
If both these utilities are present, it clones this repository and install the homebrew formula.

To install the `HEAD` and not the latest release run

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/yb85/scantailor-advanced-osx/HEAD/install.sh)" install --HEAD

```

### Manual Install  ###


1. clone the repository
```
git clone "https://github.com/yb85/scantailor-advanced-osx.git"
cd ./scantailor-advanced-osx
```

2. with [homebrew](https://brew.sh) installed and updated, run :

```
brew install --formula ./scantailor.rb
```
Compilation takes time, you can inspect the logs for more details at `~/Library/Logs/Homebrew/scantailor` with OS X Console.

You should now be able to run Scantailor from the command-line : `scantailor`

You can get the bleeding edge instead of a released version with the `--HEAD` flag :

```
brew install --formula --HEAD ./scantailor.rb
```

## Bundling your binary
To use the bundler, you need the fish shell (`brew install fish`) and the utility macdeployqt to do the linking (installed with qt6). 

1. make sure that QT is correctly linked : `brew link --force qt6`
2. add the QT bin folder to your fish path : `echo 'set -g fish_user_paths "/usr/local/opt/qt/bin" $fish_user_paths' >> ~/.config/fish/config.fish`
3. Simply run `bundler/scantailor_bundler.command` (you may have to `chmod 755 bundler/scantailor_bundler.command`)

The bundler script will use the scantailor binary which is in your shell path (the value printed out by `which scantailor`).
