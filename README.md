# Pykms
This package is for the pykms bindings for kms++. It requires you to already have `kms++-utils` installed on your system.

## Installation Instructions
These instructions are designed for use in a python virtual environment. If you are using the system python then it is simpler to install the system apt package for pykms (eg `sudo apt install python3-kms++`).

The default installations instructions, which should work in all cases (as of 29/09/2023) are:
```
sudo apt install -y libkms++-dev libfmt-dev libdrm-dev
pip install pykms
```

### If that doesn't work...

If you're building your own version of kms++ to be more up to date than your system release, then you may need to pass the repository and revision into meson. The arguments to do this are `-C setup-args="-Drepository=https://my.repository.git"` for the repository and `-C setup-args="-Drevision=branch"` for the revision. These are passed directly into `git clone` and `git checkout` respectively, so and strings that work with those will work here. The `-C, --config-settings` argument require an up to date version of `pip>=23.1` so you may first need to run `pip install --upgrade pip`

You may also need to create a custom pypatch.patch, but at that point it is probably simpler to just clone the entire repository, edit the patch locally, and install the local folder with `pip install ./pykms/`. If you really want then your custom patch can be passed in with `-C setup-args="-Dpatch=/home/me/mypatch.patch"` - this will need an absolute path as the pip build will run in a temporary directory, so a relative path will not work.
