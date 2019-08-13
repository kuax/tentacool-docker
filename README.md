# Tentacool Docker Image

[Tentacool](https://github.com/tentacool/tentacool). Dockerized.

## Build

Simply run:

```bash
sudo docker build -t tentacool .
```

The build process may take a while.

## Run

The container needs a `auth_keys.dat` file in `/usr/app/data`. The best option might be to use a volume:

```bash
sudo docker run -d --name tentacool-broker \
	--restart always \
	-v $PWD/data:/usr/app/data \
	-p 10000:10000 \
	tentacool
```

Bear in mind that tentacool doesn't automatically reload the `auth_keys.dat` file when it changes, so the container needs to be restarted:

```bash
sudo docker restart tentacool-broker
```

## Credits

All credits go to the original creators of [Tentacool](https://github.com/tentacool/tentacool). This repo is meant only to simplify the deployment of this Broker.