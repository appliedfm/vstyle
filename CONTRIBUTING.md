# Contributing to vstyle

[vstyle is managed on GitHub](https://github.com/appliedfm/vstyle).

We accept issues and pull requests.

Our goal is to deliver a style guide that is useful to the community.

We can't do that without your help!


# Project status

We are currently putting together a proposal for a community process to assemble content for the guide. This process will:

* Establish & ratify the principles and goals for the guide
* Establish an initial list of relevant topics and concerns
* Collect and synthesize guidance from the community

There will be plenty of time & opportunity for all interested parties to participate.

Stay tuned to [the usual Coq community channels](https://vstyle.readthedocs.io/en/latest/project_structure.html#announcements) for an announcement!



# Hacking on vstyle

## Building

Requires:
* [Sphinx](https://www.sphinx-doc.org)
* [Alectryon](https://github.com/cpitclaudel/alectryon)

```console
$ make -C docs html
```


## Useful references

* [reStructuredText](https://www.sphinx-doc.org/en/master/usage/restructuredtext/index.html)


# Pull requests

## Hosting, builds, & continuous integration

Our repository is integrated with [readthedocs.org](https://readthedocs.org/projects/vstyle/). New commits to the `main` branch are automatically detected, built, and launched live on our site at [vstyle.readthedocs.io](https://vstyle.readthedocs.io) within minutes.


## Checklist

Before submitting a PR, please ensure:

1. Your PR builds without errors or warnings (`make -C docs html`)
1. Your PR includes up-to-date Alectryon cache files (see below).

Once submitted, [your PR will be built by readthedocs](https://docs.readthedocs.io/en/stable/pull-requests.html). If this step passes, it means your PR builds without producing any errors and your Alectryon cache files are up to date. 👍


## Working with Alectryon

We are very excited to use [Alectryon](https://github.com/cpitclaudel/alectryon/) to format Coq source and examples.

If your pull request includes formatted Coq source, be sure it also includes updated Alectryon cache files (files ending with `.rst.cache`). These files are necessary for Alectryon to work correctly on readthedocs.org.

The cache files are updated by the build process automatically if it detects any relevant changes. Therefore, when getting ready to submit a PR, you can ensure your Alectryon cache files are up-to-date by simply running the build process *and then* committing your PR.

If you fail to do this correctly, it will be detected when [readthedocs tries to build your PR](https://docs.readthedocs.io/en/stable/pull-requests.html).
