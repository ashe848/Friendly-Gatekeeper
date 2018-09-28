# Friendly-Gatekeeper

## A friendly extension of Gatekeeper for macOS. 
Client-side sandbox enforcement based on per-execution policies that can be configured in a user-friendly manner.

## How to use
Run `./friendly.sh` and pass it the name of an app, e.g.
```
./friendly.sh Flux.app
```

Our script will create a sandbox and run Flux in it (assuming that `Flux.app` is inside your Applications folder). 
Also tested with `Stickies` and `Telegram`.

The current proof of concept implementation will let the application run for 5 seconds, then report on the files that the application has opened during this start-up stage, as well as the internet connections it has opened.
