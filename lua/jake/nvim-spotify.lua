local spotify = require 'nvim-spotify'

spotify.setup {
  status = {
    update_interval = 10000, -- the interval (ms) to check for what's currently playing
    format = '%t by %a' -- spotify-tui --format argument
  }
}
