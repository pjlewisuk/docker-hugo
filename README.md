# Hugo Docker Image

[![Docker Automated build](https://img.shields.io/docker/automated/pjlewis/docker-hugo.svg)](https://store.docker.com/community/images/pjlewis/docker-hugo)
[![Docker Build Status](https://img.shields.io/docker/build/pjlewis/docker-hugo.svg)](https://store.docker.com/community/images/pjlewis/docker-hugo/builds)
[![Docker Pulls](https://img.shields.io/docker/pulls/pjlewis/docker-hugo.svg)](https://store.docker.com/community/images/pjlewis/docker-hugo)
[![Image Info](https://images.microbadger.com/badges/image/pjlewis/docker-hugo.svg)](https://microbadger.com/images/pjlewis/docker-hugo)

[Hugo](https://gohugo.io/) is a fast and flexible static site generator, written in Go.
Hugo flexibly works with many formats and is ideal for blogs, docs, portfolios and much more.
Hugo’s speed fosters creativity and makes building a website fun again.

This Lightweight Docker Image is based on Alpine.

## Bash Alias

For ease of use, you can create a bash alias:

```bash
alias hugo='docker run --rm -it -v $PWD:/src -u hugo pjlewis/docker-hugo hugo'
alias hugo-server='docker run --rm -it -v $PWD:/src -p 1313:1313 -u hugo pjlewis/docker-hugo hugo server --bind 0.0.0.0'
```

Now, you can use `hugo help`, `hugo new foo/bar.md`, `hugo-server -w`, etc.

## Get Started

Print Hugo Help:

```bash
docker run --rm -it pjlewis/docker-hugo hugo help

```

Create a new Hugo managed website:

```bash
docker run --rm -it -v $PWD:/src -u hugo pjlewis/docker-hugo hugo new site mysite
cd mysite

# Now, you probably want to add a theme (see https://themes.gohugo.io/):
git init
git submodule add https://github.com/matcornic/hugo-theme-learn.git themes/learn;
echo 'theme = "learn"' >> config.toml
```

Add some content:

```bash
docker run --rm -it -v $PWD:/src -u hugo pjlewis/docker-hugo hugo new posts/my-first-post.md

# Now, you can edit this post, add your content and remove "draft" flag:
xdg-open content/posts/my-first-post.md
```

Build your site:

```bash
docker run --rm -it -v $PWD:/src -u hugo pjlewis/docker-hugo hugo
```

Serve your site locally:

```bash
docker run --rm -it -v $PWD:/src -p 1313:1313 -u hugo pjlewis/docker-hugo hugo server -w --bind=0.0.0.0
```

Then open [`http://localhost:1313/`](http://localhost:1313/) in your browser.

To go further, read the [Hugo documentation](https://gohugo.io/documentation/).

## Supported tags

The latest builds are:

- [`latest`](https://github.com/pjlewis/docker-hugo/blob/master/Dockerfile)
- [`0.72.0`](https://github.com/pjlewis/docker-hugo/blob/v0.72.0/Dockerfile)

A complete list of available tags can be found on the [docker store page](https://store.docker.com/community/images/pjlewis/docker-hugo/tags).

## Users

By default, this docker image run as the root user. This makes it easy to use as base image for other Dockerfiles (switching back and forth adds extra layers and is against the current [best practices](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#user) advised by Docker). Most (all official?) base images leave the default user as root.

However, this docker image also define a non-root user `hugo` (UID 1000, GID 1000) which can be switched on at run time using the `--user` flag to `docker run`.

```bash
docker run --rm -it -v $PWD:/src --user hugo pjlewis/docker-hugo hugo
```

You can also change this according your needs, by setting another UID/GID. For instance, to run hugo with user `www-data:www-data` (UID 33, GID 33) :

```bash
docker run --rm -it -v $PWD:/src -u 33:33 pjlewis/docker-hugo hugo
```

## Issues

If you have any problems with or questions about this docker image, please contact me through a [GitHub issue](https://github.com/pjlewis/docker-hugo/issues).
If the issue is related to Hugo itself, please leave an issue on the [Hugo official repository](https://github.com/spf13/hugo).

## Contributing

You are invited to contribute new features, fixes or updates to this container, through a [Github Pull Request](https://github.com/pjlewis/docker-hugo/pulls).
