[ -f $HOME/.bashrc ] && . $HOME/.bashrc
export XCURSOR_PATH=${XCURSOR_PATH}:~/.local/share/icons/

if [ -z "$XDG_RUNTIME_DIR" ]; then
	XDG_RUNTIME_DIR="/tmp/$(id -u)-runtime-dir"

	mkdir -pm 0700 "$XDG_RUNTIME_DIR"
	export XDG_RUNTIME_DIR
fi
