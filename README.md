# Pykms
This package is for the pykms bindings for kms++. It requires you to already have `kms++-utils` installed on your system.

## Caveats
***For most users this package is not the best approach to use kms++ in python - there are simpler ways***

**If you are able to use the system python**, then running `sudo apt install -y python3-kms++` will install pykms in the simplest way.

**If you do require a virtual environment** (for example, in order to use a python package not available through apt) then the simplest way is to install the apt package and then create a virtual environment using system-site-packages.
```
sudo apt install -y python3-kms++
python3 -m venv --system-site-packages my-env
```
This will allow you to use pip to install other packages in the virtual environment, while using the system versions of packages such as pykms and PyQt5, which is a much simpler approach than pip installing these packages.

**If you must use this package** then be aware that there may be other troubleshooting required to get your virtual environment working correctly. For example, packages such as PyQt5 and OpenCV can require additional steps in order to pip install them, so it is much easier to apt install them and use a virtual environment with system-site-packages. If you have no other option but to use an isolated virtual environment (for example, if you require a different version of python to the system installed version), then this package will help with installing pykms, but be warned that other packages related to the camera/display will not be as easy to install.

## Installation Instructions
These instructions are designed for use in a python virtual environment. If you are using the system python then it is simpler to install the system apt package for pykms (eg `sudo apt install python3-kms++`).

The default installations instructions are:
```
sudo apt install -y libkms++-dev libfmt-dev libdrm-dev
pip install rpi-kms
```

### If that doesn't work...

If you're building your own version of kms++ to be more up to date than your system release, then you may need to pass the repository and revision into meson. The arguments to do this are `-C setup-args="-Drepository=https://my.repository.git"` for the repository and `-C setup-args="-Drevision=branch"` for the revision. These are passed directly into `git clone` and `git checkout` respectively, so and strings that work with those will work here. The `-C, --config-settings` argument require an up to date version of `pip>=23.1` so you may first need to run `pip install --upgrade pip`

You may also need to create a custom pypatch.patch, but at that point it is probably simpler to just clone the entire repository, edit the patch locally, and install the local folder with `pip install ./pykms/`. If you really want then your custom patch can be passed in with `-C setup-args="-Dpatch=/home/me/mypatch.patch"` - this will need an absolute path as the pip build will run in a temporary directory, so a relative path will not work.
