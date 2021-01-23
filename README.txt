Opens a vsplit terminal without extra windows


Commands:
TerWindowNew - New right side vsplit terminal
TerWindowClose - Closes the terminal if it was open (only opened by the plugin)
TerWindowToggle - Toggles the terminal window opened by the plugin
TerWindowFocus - Focuses the terminal window opened by the plugin. If not open, it will open a new terminal.

Any terminals not opened by the plugin will not be recognized
Mapping keys to commands:

nnoremap <F4> :TerWindowToggle<CR>
