# SSH agent

## Source

- <https://sterba.dev/posts/ssh-agents/>
- <https://blog.tty8.org/posts/2020-05-18-howto-auto-start-ssh-agent-with-systemd-on-debian-bullseye.html>

## Installation

1. ssh-agent.service is installed under: `~/.config/systemd/user/ssh-agent.service`
2. Run `systemctl --user daemon-reload && systemctl --user enable ssh-agent.service`
3. Set global envvar `SSH_AUTH_SOCK` to `"$XDG_RUNTIME_DIR/ssh-agent.socket"`  
   (In fish.config, .bashrc or equivalent.)
