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

## Admin notes

```console
# List packages in my repo and also in extra
$ comm --nocheck-order -12 <(pacman -Sl alerque | cut -d\  -f2) <(pacman -Sl extra | cut -d\  -f2) | xargs

# list directories also in extra
$ comm --nocheck-order -12 <(ls -1) <(pacman -Sl extra | cut -d\  -f2) | xargs

# List packages owning stuff in deprecated dirs
$ paru -F /usr/lib/python3.13/ | awk -F[/\ ] '{print $9}'
```

```zsh
pkglist=~/scratch/python_todo_pt1
failed=~/scratch/python_todo_pt2
for pkg in $(comm --nocheck-order -23 <(=sort -u $pkglist) <(=sort -u $failed)); do
	test -d $pkg || continue
	pushd $pkg
	pwd
	sleep 5
	VISUAL=false pkgctl build --rebuild -e ||:
	VISUAL=true MSG="Rebuild with Python 3.14" aur-bump auto --nocheck && sed -i -e "/^$pkg\$/d" $pkglist || { echo $pkg >> $failed }
	popd
done
```

## Credits

Maintained using [aurpublish](https://github.com/eli-schwartz/aurpublish).
