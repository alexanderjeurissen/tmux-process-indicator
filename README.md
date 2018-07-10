tmux-process-indicator
=============================

Tmux plugin that enables displaying process indicators whenever a process is running.

Introduces a new #{process_indicators} format.

This plugin is useful if:

- You run corncobs or scheduled background processes that you want to monitor.
- You want to keep track if essential processes are still running

Tested and working on OSX, but should also work on Linux and Cygwin.


### Usage

Add #{process_indicators} format string to your existing status-right tmux option.

Example configuration for showing if mbsync is running:

    set -g @process_indicator 'mbsync'

    set-option -g status-right "#[bg=blue, fg=black] #{process_indicators} "

There is no limit on the number of processes that can be included this way (except from screen real
estate ;) )

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`:

    set -g @plugin 'alexanderjeurissen/tmux-process-indicator'

Hit `prefix + I` to fetch the plugin and source it.

`#{process_indicators}` interpolation should now work.

### Manual Installation

Clone the repo:

    $ git clone https://github.com/alexanderjeurissen/tmux-process-indicator ~/clone/path

Add this line to the bottom of `.tmux.conf`:

    run-shell ~/clone/path/tmux_process_indicator.tmux

Reload TMUX environment:

    # type this in terminal
    $ tmux source-file ~/.tmux.conf

`#{world_clock_status}` interpolation should now work.
