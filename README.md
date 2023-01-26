# sign-rpm-packages-action

This action signs RPM packages using GPG keys.

## Inputs

## `gpg_name`

**Required** The GPG key name. Default `""`.

## `gpg_file`

**Required** The path to a GPG file. Default `""`.

## `rpm_path`

**Required** The path to the RPMs files. Default `""`.

## `target_path`

**Required** The target path where the signed RPMs should be hosted. This is used in accordance with `create_repo`. Default `""`.

## `target_folder`

**Required** The target folder where the signed RPMs should be put. This is used in accordance with `create_repo`. Default `""`.

The final path should be `target_path`/`target_folder`


## Example usage

```
uses: signalwire/sign-rpm-packages-action@v1.0.0
with:
  gpg_file: /path/to/gpg.key
  gpg_name: me@mail.com
  target_path: /var/www/
  target_folder: x86_x64
  rpm_path: .