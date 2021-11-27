Project structure
=================


Documentation
-------------

``coqdoc``
~~~~~~~~~~

TODO


``alectryon``
~~~~~~~~~~~~~

TODO


Continuous Integration
----------------------

TODO


Dependencies
------------

* Maintain compatibility with the `Coq Platform <https://github.com/coq/platform>`_.


Layout
------

The following directory structure is recommended:

* ``dep/``
* ``doc/``
* ``ext/``
* ``src/``
* ``examples/``
* ``theories/``
* ``_CoqProject``
* ``coq-myproject.opam``
* ``Makefile``
* ``CONTRIBUTING.md``
* ``LICENSE.md``
* ``README.md``


``dep/``
~~~~~~~~

Does not apply to all projects.

Contains Git submodules for dependencies that cannot be found in opam, either because they generally do not have opam packages or because a bleeding-edge version is required that has not been released yet.

This convention achieves the following:

* It gives sensible results when used with ``-Q`` as in ``-Q dep/MyDep MyDep``


``doc/``
~~~~~~~~

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

Opam is the preferred method of managing dependencies in the Coq ecosystem. Even if your project is not published to the opam repository, the presence of an opam file in your project will be useful to downstream users.

Your opam file should document your project's dependencies at a minimum. It should also provide build & install operations, particularly if you want to encourage others to build on your work.

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


``CONTRIBUTING.md``
~~~~~~~~~~~~~~~~~~~

Does not apply to all projects.


``LICENSE.md``
~~~~~~~~~~~~~~

Always specify a license. Note that `GitHub has the ability <https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/licensing-a-repository>`_ to recognize certain popular licenses and that they expose this as a search criteria.


``README.md``
~~~~~~~~~~~~~

Always provide a readme.
