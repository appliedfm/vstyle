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


Repository documentation
~~~~~~~~~~~~~~~~~~~~~~~~

If the project is hosted on GitHub:

* Ensure the "About" panel is up-to-date
   * Website
   * Readme
   * License
   * Topics include ``coq``


Dependencies
------------

* When possible, maintain compatibility with the `Coq Platform <https://github.com/coq/platform>`_.
* Ensure all dependencies are accurately represented in the project's :command:`opam` file.


Source control
--------------

Use :command:`git`.

*Rationale:*

* :command:`git` is ubiquitous in the Coq ecosystem. It is well-known by all of the personas.
* :command:`git` submodules are widely used in the Coq ecosystem. This is particularly true for bleeding-edge development. It is wise to be compatible with this practice.
* :command:`git` works well with :code:`opam`.


Continuous Integration
----------------------

* Use the `Coq Docker image <https://hub.docker.com/r/coqorg/coq/>`_ to `continuously test your build <https://github.com/coq-community/docker-coq/wiki/CI-setup>`_.
* If the project publishes documentation on `readthedocs.org <https://readthedocs.org>`_, be sure to `enable builds from pull requests <https://docs.readthedocs.io/en/stable/pull-requests.html>`_. This will ensure PRs do not break the documentation.


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

* Publish documentation on `readthedocs.org <https://readthedocs.org>`_.


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
* :file:`.gitignore`
* :file:`.readthedocs.yaml`
* :file:`_CoqProject`
* :file:`coq-{myproject}.opam`
* :file:`Makefile`
* :file:`Makefile.configure.example`
* :file:`LICENSE.txt`
* :file:`CONTRIBUTING.md`
* :file:`README.md`

Not every path is required; see below for additional guidance.


:file:`dep/`
~~~~~~~~~~~~

*Does not apply to all projects.*

Contains dependencies that cannot be found in opam, either because they generally do not have :command:`opam` packages or because a bleeding-edge version is required that has not been released yet.

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

The directory contains subdirectories whose names end in ``Ext``, as in :file:`ext/{SomeLibrary}Ext`. For example, suppose one requires a lemma about lists that is not present in the standard Coq library. In this case, the lemma would be stored somewhere within :file:`ext/CoqExt/`.

*Rationale:*

* It gives sensible results when used with ``-Q`` as in ``-Q ext/MyDepExt MyDepExt``
* It clearly identifies components that should be upstreamed.


:file:`src/`
~~~~~~~~~~~~

*Does not apply to all projects.*

Contains non-Coq source code, such as OCaml, C, JavaScript, Haskell, etc.

* If the project extracts Coq to OCaml, Haskell, C, or any other non-Coq language, and if the extracted results are committed to the repository, then they must be stored within this directory.
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


:file:`.gitignore`
~~~~~~~~~~~~~~~~~~

This file should direct :command:`git` to ignore the following::

   Makefile.configure
   Makefile.coq*
   *.aux
   *.d
   *.glob
   *.vo*

It should be amended as-needed to ensure the following:

* :command:`git status` is not changed by any of the workflows supported by :file:`Makefile` (except when such changes are the purpose of the workflow).


:file:`.readthedocs.yaml`
~~~~~~~~~~~~~~~~~~~~~~~~~

*Does not apply to all projects.*

Applies only when the project documentation is hosted by `readthedocs.org <https://readthedocs.org>`_.


:file:`_CoqProject`
~~~~~~~~~~~~~~~~~~~

This file:

* Must bring the contents of ``dep``, ``ext``, and ``theories`` into the search path.
* Must enumerate the files in ``ext`` and ``theories``.
* Must not refer to any paths outside the project's directory tree.

Some projects have several "variants" (such as compcert, which has a different variant for each target architecture). In this case:

* There must be a "default" variant and a corresponding default :file:`_CoqProject` file satisfying the requirements above.
* The "non-default" variants each get their own file named :file:`_CoqProject-{variant}`.
* Whenever possible, :file:`_CoqProject-{variant}` must comply with the same requirements above.
   * If :file:`_CoqProject-{variant}` must refer to paths outside the project's tree, then the following steps are recommended:
       * Do not commit :file:`_CoqProject-{variant}` to the repository.
       * Add :file:`_CoqProject-{variant}` to :file:`.gitignore`.
       * Add a target to :file:`Makefile` that can generate :file:`_CoqProject-{variant}` when needed.

*Rationale:*

* The generated Makefile will build all of the examples.
* `CoqIDE <https://coq.inria.fr/refman/practical-tools/coqide.html>`_, `vscoq <https://github.com/coq-community/vscoq>`_, and other tools behave as expected.
* Downstream users never encounter any paths that are specific to the contributor's development environment.
* Everything present in the repository works as-is without any edits.


:file:`coq-{myproject}.opam`
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:command:`opam` is the preferred method of managing dependencies in the Coq ecosystem. Even if the project is not published to the `Opam archive for Coq <https://coq.inria.fr/opam-packaging.html>`_, the presence of an :command:`opam` file will be useful to downstream users (both for dependency installation and for installing the project from source).

* The :command:`opam` file must document the project's dependencies.
* It should also provide build & install operations.
* If it provides an install operation, the uninstall operation must be tested and working.

If the project has several variants:

* There must be a "default" :file:`coq-{myproject}.opam` file that satisfies the requirements above.
* The other files must be named :file:`coq-{myproject}-{variant}.opam`.

*Rationale:*

* ``opam install --deps-only ./coq-{myproject}.opam`` works as expected.


:file:`Makefile`
~~~~~~~~~~~~~~~~

Responsible for building the project.

* Configurability:
   * It must contain a header advising the user:
      * Not to edit :file:`Makefile` or :file:`Makefile.configure.example`.
      * To consult :file:`Makefile.configure.example` for information on how to configure the build.
   * It must define default values for each of the user-configurable build variables.
   * It must import :file:`Makefile.configure` (if it exists), validate the user-configurable build variables, and orchestrate the rest of the build.
* Engineering workflow support:
   * It should have functionality for generating/updating :file:`_CoqProject`.
      * This is required if the project supports any user-configurable build variables that share concerns with :file:`_CoqProject`, such as search paths for dependencies.
* Build orchestration:
   * Responsible for generating :file:`Makefile.coq` from :file:`_CoqProject`.
      * Also responsible for generating :file:`Makefile.coq-{variant}` from :file:`_CoqProject-{variant}` (if the project supports multiple variants).
   * If the project has a :file:`dep/` directory, then :file:`Makefile` must support a "two step" sequential build process:
      * Build all of the dependencies in :file:`dep/`.
      * Build the rest of the project.
   * The following command must work in a newly-created :command:`opam` switch with no additional setups: :samp:`opam install --deps-only ./coq-{myproject}.opam && make`
   * If the project has multiple variants, the following command must work in a newly-created :command:`opam` switch with no additional setups: :samp:`opam install --deps-only ./coq-{myproject}-{variant}.opam && make {myproject}-{variant}`

*Rationale:*

* It is compatible with :command:`opam`: the project's :command:`opam` file should rely on :file:`Makefile` to perform the build & install operations.


:file:`Makefile.configure.example`
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Does not apply to all projects.*

Enumerates and documents the user-configurable build variables supported by :file:`Makefile`.

* It must contain a header with the following instructions:
   * Do not make edits to :file:`Makefile` or :file:`Makefile.configure.example`.
   * To customize the build, copy :file:`Makefile.configure.example` to :file:`Makefile.configure` and edit the latter.
* It must provide documentation for each variable.
* It must not set any variables or have any other side effects.
   * Remember: :file:`Makefile` is responsible for default values, validation, and processing of user-configurable build variables.
   * Users can override the default values by assigning variables in :file:`Makefile.configure`.

*Rationale:*

* It allows users and contributors to configure their build without editing :file:`Makefile`.


:file:`LICENSE.txt`
~~~~~~~~~~~~~~~~~~~

The project must specify a license and copyright.

* Plain text files are preferred.
* For projects hosted on GitHub:
   * `GitHub has the ability to recognize certain popular licenses <https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/licensing-a-repository>`_. Projects which use one of those licenses must ensure GitHub recognizes their selection.


:file:`CONTRIBUTING.md`
~~~~~~~~~~~~~~~~~~~~~~~

*Does not apply to all projects.*

Provides information to potential contributors:

* Where to file issues and pull requests.
* Guidance about common tasks & procedures.
* Information about the contributor community:
   * Links to relevant mailing lists, chat channels, etc.
   * Community standards & guidelines.


:file:`README.md`
~~~~~~~~~~~~~~~~~

This must contain:

* The URL of the project's main website or repository.
* A one-sentence description of the project.
* Citations/references for upstream components (as appropriate).
* Installation instructions.
* Concise examples and/or references to longer examples.

It should also contain relevant badges:

* `readthedocs status <https://docs.readthedocs.io/en/stable/badges.html>`_
* See `shields.io <https://shields.io/>`_ for other examples.
