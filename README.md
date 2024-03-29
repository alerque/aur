# Caleb's AUR Packages

Package sources for all the AUR packages I officially [maintain](https://aur.archlinux.org/packages/?SeB=m&K=alerque), [co-maintain](https://aur.archlinux.org/packages/?SeB=c&K=alerque), or unofficially host modified versions of.

## Pacman Package Repository

To use [my Pacman package repository](https://wiki.archlinux.org/index.php/Unofficial_user_repositories#alerque), first add [my GPG key](https://pgp.mit.edu/pks/lookup?op=get&search=0x63CC496475267693) to your Pacman keyring:

```sh
pacman-key --recv-keys 63CC496475267693
pacman-key --lsign-key 63CC496475267693
```
Note if you have trouble with your default key servers not being reachable try adding `--keyserver keyserver.ubuntu.com` to the first command.

Then add the following repository configuration to your `pacman.conf` after the *[community]* repository.

```ini
[alerque]
Server = https://arch.alerque.com/$arch
```

## Credits

Maintained using [aurpublish](https://github.com/eli-schwartz/aurpublish).
