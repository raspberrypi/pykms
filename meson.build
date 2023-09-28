# SPDX-License-Identifier: CC0-1.0

project('pykms', 'cpp',
    meson_version : '>= 0.64',
    version : '0.0.0',
    default_options : [
        'cpp_std=c++17',
    ],)

r = run_command('clone-kmsxx.sh', check : true)

libkmsxx_dep = dependency('kms++', required : true)
libkmsxxutil_dep = dependency('kms++util', required : true)
add_global_arguments('-DHAS_KMSXXUTIL', language : 'cpp')

libfmt_dep = dependency('fmt', required : true)
libdrmomap_dep = dependency('libdrm_omap', required : get_option('omap'))
if libdrmomap_dep.found()
    add_global_arguments('-DHAS_LIBDRM_OMAP', language : 'cpp')
endif

py = import('python').find_installation()
message('Using python version @0@ from @1@'.format(py.version(), py.path()))

subdir('kmsxx/py')

py.install_sources(
    'kmsxx/py/pykms/__init__.py',
    subdir : 'pykms',
    pure : false,
)

py.extension_module(
    'pykms',
    pykms_sources,
    install : true,
    subdir : 'pykms',
    dependencies : pykms_deps,
    cpp_args : pykms_args,
)
