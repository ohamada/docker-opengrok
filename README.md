# OpenGrok

based on OpenGrok version: 1.1-rc21

OpenGrok is a fast and usable source code search and cross reference engine, written in Java. It helps you search, cross-reference and navigate your source tree. It can understand various program file formats and version control histories of many source code management systems.

This docker image support
- Git
- Subversion

List of supported versioning systems could be easilly enlarged by installing additional VCS (in opengrok_prepare.sh) and rebuilding the image.

## Usage
```sh
$ docker run -d \
    --name opengrok \
    -v ${DIR_WITH_CLONED_REPOS}:/var/opengrok/src:ro \
    -v ${DIR_TO_KEEP_OPENGROK_INDEXES}:/var/opengrok/data \
    -p 8080:8080 \
    ohamada/opengrok
```

Few seconds after the start of the container an indexing feature should kick in and index all available source codes. This might take a while depending on the size of the repositories.

### trigger reindex

```sh
$ docker exec opengrok /opt/opengrok/bin/OpenGrok index
```

It is wise to trigger the indexing via cron script if the OpenGrok is supposed for a longterm deployment.
