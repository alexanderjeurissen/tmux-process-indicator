tmux-process-indicator
=============================

Tmux plugin that enables displaying process indicators whenever a process is running.

Introduces a new #{process_indicators} format.

This plugin is useful if:

- You run cronjobs or scheduled background processes that you want to monitor.
- You want to keep track if essential processes are still running

Tested and working on OSX, but should also work on Linux and Cygwin.


### Usage

1. Add #{process_indicators} format string to your existing status-right tmux option.

The template / text that is shown in the statusbar is configurable.
It defaults to `#[bold] PROCESS_NAME #[nobold]`. The template needs to be specified per process.
To specify a template set the appropriate global option in your tmux configuration in the format of:
`@PROCESS_NAME_process_template`.
You can use the constant `PROCESS_NAME` if you want to print out the process name in the status line.

Example configuration for showing if mbsync is running:

    set -g @monitor_process 'mbsync'
    set -g @mbsync_process_template '#[bold] PROCESS_NAME is running #[nobold]'

    set-option -g status-right "#[bg=blue, fg=black] #{process_indicators} "

In this case we set the option `@mbsync_process_template` to set the template solely used to denote if `mbsync` is running.

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

`#{process_indicators}` interpolation should now work.
