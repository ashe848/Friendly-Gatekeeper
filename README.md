# Friendly-Gatekeeper

A friendly extension of Gatekeeper for macOS

## How to use
Run `./friendly.sh` and pass it the name of an app, e.g.
```
./friendly.sh Flux.app
```

Our script will create a sandbox and run Flux in it (assuming that `Flux.app` is insider your Applications folder). After 5 seconds, it will report on the files that Flux have opened during it's start-up stage, as well as the internet connections it has opened.
