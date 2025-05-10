# MEAnalyzer Container

[MEAnalyzer](https://github.com/platomav/MEAnalyzer) container that works with Podman and Docker.

## Usage

```sh
podman run --rm -it \
  --security-opt label=disable \
  --volume ${PWD}:/pwd --workdir /pwd \
  meanalyzer:latest ME.bin
```

## Building

```sh
podman build . -t meanalyzer:latest
```

To specific the MEAnalyzer and MEA.dat versions, set `ME_VERSION` (defaults to git master) and
`DB_VERSION` (defaults to latest) build-args. For example, building a container with MEAnalyzer v1.307.0
and MEA.dat r366 would be the following command:

```sh
podman build . \
  --build-arg ME_VERSION=v1.307.0-r345 \
  --build-arg DB_VERSION=tags/r366 \
  -t meanalyzer:v1.307.0-r366
```

Note that MEAnalyzer tags start with "v" and DB_VERSION needs to be prepended with "tags/"

## MEAnalyzer License Compliance

To view MEAnalyzer license, override the entrypoint:

```sh
podman run --rm -it \
  --entrypoint /bin/cat
  meanalyzer:latest /opt/LICENSE
```

## Terminal Integration

### A) Create function to .bashrc

```bash
meanalyzer(){
  podman run --rm -it \
    --security-opt label=disable \
    --volume ${PWD}:/pwd --workdir /pwd \
    meanalyzer:latest $@
}
```

### B) Create $HOME/.local/bin/meanalyzer

Be sure to set executable bit with `chmod +x $HOME/.local/bin/meanalyzer`

```sh
#!/bin/sh

podman run --rm -it \
  --security-opt label=disable \
  --volume "${PWD}:/pwd" --workdir /pwd \
  meanalyzer:latest "$@"
```
