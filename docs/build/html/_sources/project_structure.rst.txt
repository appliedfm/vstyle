Project structure
=================


Documentation
---------------------

Project documentation
~~~~~~~~~~~~~~~~~~~~~

The following must be documented:

* License & copyright.
* The URL of the project's main website or repository.
* Citations/references for upstream components (as appropriate).
* Installation instructions.
   * How to get the code.
   * Versions of the `Coq Platform <https://github.com/coq/platform>`_ that are known to be compatible.
   * Sample commands for installing with :command:`opam`.
* Example usage.


Source & example documentation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Requirements vary by project.

* Use `coqdoc <https://coq.inria.fr/refman/using/tools/coqdoc.html>`_, `alectryon <https://github.com/cpitclaudel/alectryon/>`_, and/or `sphinx <https://www.sphinx-doc.org>`_.


Dependencies
------------

* When possible, maintain compatibility with the `Coq Platform <https://github.com/coq/platform>`_.
* Ensure all dependencies are accurately represented in the project's :command:`opam` file.


Source control
--------------

Use :code:`git`.


*Rationale:*

* :code:`git` is ubiquitous in the Coq ecosystem. It is well-known by all of the personas.
* :code:`git` submodules are widely used in the Coq ecosystem. This is particularly true for bleeding-edge development. It is wise to be compatible with this practice.
* :code:`git` works well with :code:`opam`.


Continuous Integration
----------------------

Use the `Coq Docker image <https://hub.docker.com/r/coqorg/coq/>`_ to `continuously test your build <https://github.com/coq-community/docker-coq/wiki/CI-setup>`_.


Releases
--------

Prior to release, verify the following:

* All necessary documentation is in place.
   * All of the generated documentation is up-to-date.
   * Upstream components have been cited/referenced (as appropriate).
* The opam file is accurate and works in the following modes:
   * ``opam install --deps-only``
   * ``opam install``
   * ``opam remove``
* The project is compatible with the most-recent release of the `Coq Platform <https://github.com/coq/platform>`_.
* The project's "metadata" is accurate:
   * Copyright holders, contributors, maintainers, citations/references, etc, are all accurate.
   * The URL of the project's main website or repository is accurate.
* The installation instructions are accurate:
   * Dependencies, version information, and console commands are up-to-date.
   * Install procedure works from a "clean-slate" :command:`opam` switch.
   * Remove procedure is tested and works.
* Examples are tested and work.


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

Lastly, notify maintainers of upstream components (as appropriate).


Repo Structure
--------------

The following directory hierarchy is recommended:

* :file:`dep/`
* :file:`docs/`
* :file:`ext/`
* :file:`src/`
* :file:`examples/`
* :file:`theories/`
* :file:`_CoqProject`
* :file:`coq-{myproject}.opam`
* :file:`Makefile`
* :file:`Makefile.configure`
* :file:`CONTRIBUTING.md`
* :file:`LICENSE.md`
* :file:`README.md`

Not every path is required; see below for additional guidance.


:file:`dep/`
~~~~~~~~~~~~

*Does not apply to all projects.*

Contains that cannot be found in opam, either because they generally do not have :command:`opam` packages or because a bleeding-edge version is required that has not been released yet.

* :command:`git` submodules are preferred.

*Rationale:*

* It gives sensible results when used with ``-Q`` as in ``-Q dep/MyDep MyDep``


:file:`docs/`
~~~~~~~~~~~~~

Contains project documentation.

Documentation should be generated using `coqdoc <https://coq.inria.fr/refman/using/tools/coqdoc.html>`_, `alectryon <https://github.com/cpitclaudel/alectryon/>`_, and/or `sphinx <https://www.sphinx-doc.org>`_.


:file:`ext/`
~~~~~~~~~~~~

*Does not apply to all projects.*

Contains definitions that "extend" dependencies with additional instances, lemmas, etc.

The directory contains subdirectories whose names end in ``Ext``. For example, suppose one requires a lemma about lists that is not present in the standard Coq library. In this case, the lemma would be stored somewhere within ``ext/CoqExt/``.

*Rationale:*

* It gives sensible results when used with ``-Q`` as in ``-Q ext/MyDepExt MyDepExt``
* It clearly identifies components that should be upstreamed.


:file:`src/`
~~~~~~~~~~~~

*Does not apply to all projects.*

Contains non-Coq source code, such as OCaml, C, JavaScript, Haskell, etc.

* This directory might contain its own separate build system, documentation, etc, subject to the project's needs and appropriate separation of concerns.

*Rationale:*

* It clearly identifies components not written in Coq.


:file:`examples/`
~~~~~~~~~~~~~~~~~

*Does not apply to all projects.*

Most software projects include examples of one kind or another. These should be stored here.

*Rationale:*

* It clearly identifies examples as being examples (and not components of the main development).
* It gives sensible results when used with ``-Q`` as in ``-Q examples/ MyProject.Examples``


:file:`theories/`
~~~~~~~~~~~~~~~~~

This is where the main Coq development is stored.

*Rationale:*

* It gives sensible results when used with ``-Q`` as in ``-Q theories/ MyProject``


:file:`_CoqProject`
~~~~~~~~~~~~~~~~~~~

This file should:

* Map ``dep``, ``ext``, ``theories``, and ``examples`` into the search path.
* Enumerate the files in ``ext``, ``theories``, and ``examples``.

For various reasons, some projects may require more than one :file:`_CoqProject` file. In this case:

* There must be a "default" :file:`_CoqProject` file that satisfies the requirements above.
* The other files must be named :file:`_CoqProject.{variant}`.

*Rationale:*

* The generated Makefile will build all of the examples.
* `CoqIDE <https://coq.inria.fr/refman/practical-tools/coqide.html>`_, `vscoq <https://github.com/coq-community/vscoq>`_, and other tools behave as expected.


:file:`coq-{myproject}.opam`
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:command:`opam` is the preferred method of managing dependencies in the Coq ecosystem. Even if the project is not published to the `Opam archive for Coq <https://coq.inria.fr/opam-packaging.html>`_, the presence of an :command:`opam` file will be useful to downstream users (both for dependency installation and for installing the project from source).

* The :command:`opam` file must document the project's dependencies.
* It should also provide build & install operations.
* If it provides an install operation, the uninstall operation must be tested and working.

For various reasons, some projects may require more than one :command:`opam` file. In this case:

* There must be a "default" :file:`coq-{myproject}.opam` file that satisfies the requirements above.
* The other files must be named :file:`coq-{myproject}-{variant}.opam`.

*Rationale:*

* ``opam install --deps-only ./coq-{myproject}.opam`` works as expected.


:file:`Makefile`
~~~~~~~~~~~~~~~~

Responsible for building the project.

* It must contain a header advising the user to make edits to :file:`Makefile.configure` instead of :file:`Makefile`.
* It must import :file:`Makefile.configure`, validate the user-configurable variables, and orchestrate the rest of the build.
* It might have functionality for generating/updating :file:`_CoqProject`.

The following command must work:

* :samp:`opam install --deps-only ./coq-{myproject}.opam && make`

*Rationale:*

* It is compatible with :command:`opam`: the project's :command:`opam` file should rely on :file:`Makefile` to perform the build & install operations.


:file:`Makefile.configure`
~~~~~~~~~~~~~~~~~~~~~~~~~~

*Does not apply to all projects.*

Enumerates and documents the user-configurable variables used by :file:`Makefile`.

* It must provide sensible documentation for each variable.
* 

*Rationale:*

* It allows users and contributors to configure their build without editing :file:`Makefile`.


:file:`CONTRIBUTING.md`
~~~~~~~~~~~~~~~~~~~~~~~

*Does not apply to all projects.*

Provides information to potential contributors:

* Where to file issues
* Where to submit pull requests
* Community standards & guidelines


:file:`LICENSE.md`
~~~~~~~~~~~~~~~~~~

The project must specify a license and copyright.

* `GitHub has the ability to recognize certain popular licenses <https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/licensing-a-repository>`_. Projects which use one of those licenses must ensure GitHub recognizes their selection.


:file:`README.md`
~~~~~~~~~~~~~~~~~

This must contain:

* The URL of the project's main website or repository.
* A one-sentence description of the project.
* Citations/references for upstream components (as appropriate).
* Installation instructions.
* Concise examples and/or references to longer examples.
