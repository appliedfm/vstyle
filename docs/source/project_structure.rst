Project structure
=================


Project documentation
---------------------

The following must be documented:

* License & copyright.
* The URL of the project's main website or repository.
* Installation instructions.
   * How to get the code.
   * Versions of the `Coq Platform <https://github.com/coq/platform>`_ that are known to be compatible.
   * Sample commands for installing with ``opam``.
* Example usage.


Source & example documentation
------------------------------

Requirements vary by project.

* Use `coqdoc <https://coq.inria.fr/refman/using/tools/coqdoc.html>`_, `alectryon <https://github.com/cpitclaudel/alectryon/>`_, `sphinx <https://www.sphinx-doc.org>`_, or some combination thereof.


Continuous Integration
----------------------

Use the `Coq Docker Image <https://hub.docker.com/r/coqorg/coq/>`_ to `continuously test your build <https://github.com/coq-community/docker-coq/wiki/CI-setup>`_.


Dependencies
------------

* When possible, maintain compatibility with the `Coq Platform <https://github.com/coq/platform>`_.
* Ensure all dependencies are accurately represented in the project's ``opam`` file.


Releases
--------

Prior to release, verify the following:

* All necessary documentation is in place.
* The opam file is accurate and works in the following modes:
   * ``opam install --deps-only``
   * ``opam install``
   * ``opam remove``
* The project is compatible with the most-recent release of the `Coq Platform <https://github.com/coq/platform>`_.
* The project's "metadata" is accurate:
   * Copyright holders, contributors, maintainers, etc, are all accurate.
   * The URL of the project's main website or repository is accurate.
* The installation instructions are accurate:
   * Dependencies, version information, and console commands are up-to-date.
   * Installation procedure works from a "clean-slate" ``opam`` switch.
* Examples are tested and known to work.


Versioning
~~~~~~~~~~

Use the `opam version schema <https://opam.ocaml.org/doc/Manual.html#version-ordering>`_.


Distribution
~~~~~~~~~~~~

* Tag the release in source control.
   * See `Managing releases in a repository <https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository>`_ if using GitHub.
* Submit the new release to the `Opam archive for Coq <https://coq.inria.fr/opam-packaging.html>`_.


Documentation
~~~~~~~~~~~~~

* Publish documentation on `readthedocs.org <readthedocs.org>`_.


Announcements
~~~~~~~~~~~~~

Announce the release in the following venues:

* `coq-club mailing list <https://sympa.inria.fr/sympa/info/coq-club>`_
* `Coq on Zulip <https://coq.zulipchat.com/>`_
* `@CoqLang on Twitter <https://twitter.com/CoqLang>`_
* `/r/coq on Reddit <https://www.reddit.com/r/Coq/>`_
* `Coq on Discourse <https://coq.discourse.group/>`_

Optionally, submit the project for inclusion in the following venues:

* `awesome-coq <https://github.com/coq-community/awesome-coq>`_
* `Coq Platform <https://github.com/coq/platform>`_


Repo Structure
--------------

The following directory hierarchy is recommended:

* ``dep/``
* ``docs/``
* ``ext/``
* ``src/``
* ``examples/``
* ``theories/``
* ``_CoqProject``
* ``coq-myproject.opam``
* ``Makefile``
* ``Makefile.configure``
* ``CONTRIBUTING.md``
* ``LICENSE.md``
* ``README.md``

Not every path is required; see below for additional guidance.


``dep/``
~~~~~~~~

Does not apply to all projects.

Contains Git submodules for dependencies that cannot be found in opam, either because they generally do not have ``opam`` packages or because a bleeding-edge version is required that has not been released yet.

This convention achieves the following:

* It gives sensible results when used with ``-Q`` as in ``-Q dep/MyDep MyDep``


``docs/``
~~~~~~~~~

Contains project documentation.


``ext/``
~~~~~~~~

Does not apply to all projects.

Contains definitions that "extend" dependencies with additional instances, lemmas, etc.

The directory contains subdirectories whose names end in ``Ext``. For example, suppose one requires a lemma about lists that is not present in the standard Coq library. In this case, the lemma would be stored somewhere within ``ext/CoqExt/``.

This convention achieves the following:

* It gives sensible results when used with ``-Q`` as in ``-Q ext/MyDepExt MyDepExt``
* It clearly identifies components that should be upstreamed.


``src/``
~~~~~~~~

Does not apply to all projects.

Contains non-Coq source code. Many projects include source in languages such as OCaml, C, JavaScript, Haskell, etc. These source files should be stored here.

This convention achieves the following:

* It clearly identifies components not written in Coq.


``examples/``
~~~~~~~~~~~~~

Most software projects include examples of one kind or another. These should be stored here.

This convention achieves the following:

* It clearly identifies examples as being examples (and not components of the main development).
* It gives sensible results when used with ``-Q`` as in ``-Q examples/ MyProject.Examples``


``theories/``
~~~~~~~~~~~~~

This is where the main Coq development is stored.

This convention achieves the following:

* It gives sensible results when used with ``-Q`` as in ``-Q theories/ MyProject``


``_CoqProject``
~~~~~~~~~~~~~~~

This file should:

* Map ``dep``, ``ext``, ``theories``, and ``examples`` into the search path.
* Enumerate the files in ``ext``, ``theories``, and ``examples``.

This convention achieves the following:

* The generated makefile will build all of the examples.
* CoqIDE, vscode, and others behave as expected.


``coq-myproject.opam``
~~~~~~~~~~~~~~~~~~~~~~

``opam`` is the preferred method of managing dependencies in the Coq ecosystem. Even if the project is not published to the ``opam`` repository, the presence of an ``opam`` file in the project will be useful to downstream users (both for dependency installation and for installing the project from source).

The ``opam`` file must document the project's dependencies. It should also provide build & install operations.

This convention achieves the following:

* ``opam install --deps-only ./coq-myproject.opam`` works as expected.


``Makefile``
~~~~~~~~~~~~

Responsible for building the project. This includes:

* Processing any build arguments.
* (Optional) Generating/updating ``_CoqProject``.
* Generating and invoking a sub-makefile derived from ``_CoqProject``.

This convention achieves the following:

* It is compatible with opam: the project's opam file should rely on the Makefile to perform the build and installation steps.


``Makefile.configure``
~~~~~~~~~~~~~~~~~~~~~~

Does not apply to all projects.

Enumerates and documents the user-configurable variables used by ``Makefile``.

This convention achieves the following:

* It allows users and contributors to configure their build without editing ``Makefile``.


``CONTRIBUTING.md``
~~~~~~~~~~~~~~~~~~~

Does not apply to all projects.

Provides information to potential contributors:

* Where to file issues
* Where to submit pull requests
* Community standards & guidelines


``LICENSE.md``
~~~~~~~~~~~~~~

The project must specify a license and copyright.

Note that `GitHub has the ability <https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/licensing-a-repository>`_ to recognize certain popular licenses and that they expose this as a search criteria.


``README.md``
~~~~~~~~~~~~~

This must contain:

* Installation instructions.
* Concise examples and/or references to longer examples.
