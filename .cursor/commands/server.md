# server connection
```bash
SERVER_DIR="/Users/dy323/Dropbox/machine-setup/utils/cambridge-hpc"
```

remote command helpers in `$SERVER_DIR/agents/` (password + TOTP). One‑off or repeated via SSH multiplexing.

| Tool                 | Use                                    | Example                                                                |
| -------------------- | -------------------------------------- | ---------------------------------------------------------------------- |
| `remote-run-once.sh` | Single command (auth each time)        | `$SERVER_DIR/agents/remote-run-once.sh 'qstat -u dy323'`               |
| `ssh-mux-open.sh`    | Open persistent SSH master (auth once) | `$SERVER_DIR/agents/ssh-mux-open.sh`                                   |
| `ssh-mux-exec.sh`    | Run via master (no re‑auth)            | `$SERVER_DIR/agents/ssh-mux-exec.sh 'ls -la /rds/user/dy323/hpc-work'` |
| `ssh-mux-close.sh`   | Close master                           | `$SERVER_DIR/agents/ssh-mux-close.sh`                                  |

NOTE the sessions lasts for 10 minutes each; if you fail to connect at any point it could be due to connection expiration

Multiplex workflow (fast repeats)
| Step         | Command                                               |
| ------------ | ----------------------------------------------------- |
| open master  | `$SERVER_DIR/agents/ssh-mux-open.sh`                  |
| exec cmds    | `$SERVER_DIR/agents/ssh-mux-exec.sh 'qstat -u dy323'` |
| close master | `$SERVER_DIR/agents/ssh-mux-close.sh`                 |

# data location
- browse around /rds/user/dy323/
- e.g., rds-resilience-tbdABxTZvic

# file transfer
- see scripts in `$SERVER_DIR/agents/file-systems/`

# note
- server is very laggy; use a timeout mechanism everytime
- see `$SERVER_DIR/agents/README.MD` for other available tools