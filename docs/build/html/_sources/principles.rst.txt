Principles
==========


Roles & personas
----------------

Many different roles & personas have an interest in project style.

* Curious person
   * Student
   * Academic researcher
   * Professional in industry
* Researcher
   * Academic researcher
* User
   * Student
   * Academic researcher
   * Professional in industry
* Contributor
   * Student
   * Academic researcher
   * Professional in industry
* Platform maintainer
   * `Coq Platform <https://github.com/coq/platform>`_ maintainers
   * Nix package maintainers
   * Academic researcher
* Upstream maintainer
   * Coq maintainers
   * Academic researcher
   * Professional in industry


Use cases
---------

Project style impacts several frequent use cases.

* Browsing the code (in a browser)
   * Curious person
   * Researcher
   * User
   * Contributor
   * Platform maintainer
   * Upstream maintainer
* Browsing the code (in a proof assistant)
   * Curious person
   * Researcher
   * User
   * Contributor
   * Platform maintainer
   * Upstream maintainer
* Isolating & resolving build issues
   * User
   * Contributor
   * Platform maintainer
   * Upstream maintainer
* Exploring undocumented features
   * Researcher
   * User
   * Contributor
* Understanding the architecture
   * Researcher
   * User
   * Contributor
* Shipping new features
   * Contributor
* Refactoring
   * Contributor
   * Platform maintainer
   * Upstream maintainer


Desired outcome
---------------

This style guide seeks to drive the following outcomes:


Mitigate bike-shedding
~~~~~~~~~~~~~~~~~~~~~~

* Shipping new features
* Refactoring


Style is enforcable by a linter
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* Shipping new features
* Refactoring


Find & replace work as expected
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* Browsing the code (in a browser)
* Browsing the code (in a proof assistant)
* Isolating & resolving build issues
* Exploring undocumented features
* Understanding the architecture
* Shipping new features
* Refactoring


Code is robust against changes to the Coq engine
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* Isolating & resolving build issues


Code is minimally impacted by changes in upstream components
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* Isolating & resolving build issues


Code changes have minimal impact on downstream users
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* Isolating & resolving build issues


Upstream maintainers are not punished for offering to help
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* Isolating & resolving build issues
