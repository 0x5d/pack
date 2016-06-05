# Pack
Organize your links semantically and hierarchically!

## Run it

First of all, clone this repo.

### Dev Environment
Install the dependencies:
```sh
bundle
```
Make sure you have a MongoDB running somewhere, and set the required env vars:
```sh
export PACK_DATABASE=<db name>
export PACK_DATABASE_HOST=<host>
export PACK_DATABASE_PORT=<port>
```
Start Pack.
```sh
bundle exec rackup
```
