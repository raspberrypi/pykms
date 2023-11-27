# SPDX-License-Identifier: CC0-1.0

project('pykms', 'cpp',
    meson_version : '>= 0.64',
    version : '0.0.0',
    default_options : [
        'cpp_std=c++17',
    ],)

message('Cloning from: @0@, revision @1@'.format(get_option('repository'), get_option('revision')))

r = run_command('clone-kmsxx.sh', get_option('repository'), get_option('revision'), get_option('patch'), check : true)

missing_message = 'Requires: libkms++-dev, libfmt-dev, libdrm-dev - please install using apt'

libkmsxx_dep = dependency('kms++', required : true, not_found_message : missing_message)
libkmsxxutil_dep = dependency('kms++util', required : true, not_found_message : missing_message)
add_global_arguments('-DHAS_KMSXXUTIL', language : 'cpp')

libfmt_dep = dependency('fmt', required : true, not_found_message : missing_message)
libdrmomap_dep = dependency('libdrm_omap', required : get_option('omap'))
if libdrmomap_dep.found()
    add_global_arguments('-DHAS_LIBDRM_OMAP', language : 'cpp')
endif

py = import('python').find_installation()
message('Using python version @0@ from @1@'.format(py.version(), py.full_path()))

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
