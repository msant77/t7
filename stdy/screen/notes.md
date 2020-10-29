# Screen Basic Usage

### List running Sessions
  screen -ls; 


### Create new Session with a name
  screen -S <name>

### Attach to single running session
  screen -r

### Attach to Session with a name
  screen -r <name>

### Run one command  and Detach a Session with a name
  screen -dmS <name> <command>

### Run Multiple commands and Detach a Session with a name
  screen -dmS <name> bash -c 'command 1; command 2; command n;'

### Force Kill a Detached Session
  screen -XS <session name to quit> quit

 
