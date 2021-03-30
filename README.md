# Caleb's AUR Packages

Package sources for all the AUR packages I maintain, co-maintain, or host.

## Package Repository

To use [my package repository](https://wiki.archlinux.org/index.php/Unofficial_user_repositories#alerque), add [my GPG key](https://pgp.mit.edu/pks/lookup?op=get&search=0x63CC496475267693) to your pacman keyring:

```sh
pacman-key --recv-keys 63CC496475267693
pacman-key --lsign-key 63CC496475267693
```

Then add the repository configuration to your `pacman.conf` after the *[community]* repository.

```ini
[alerque]
Server = https://arch.alerque.com/$arch
```

## Credits

Maintained using [aurpublish](https://github.com/eli-schwartz/aurpublish).
