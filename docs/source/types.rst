Types
=====


Numeric types
-------------

``Number Notation``
~~~~~~~~~~~~~~~~~~~

TODO


``nat``, ``pos``, ``N``, ``Z``, ``Q``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

TODO


``Fin.t``
~~~~~~~~~

* Import via ``From Coq Require Import Vectors.Vector.``


String types
------------

``String Notation``
~~~~~~~~~~~~~~~~~~~

TODO


``ascii`` (``" ... "``)
~~~~~~~~~~~~~~~~~~~~~~~

* Import via ``From Coq Require Import Strings.Ascii.``


``string`` (``" ... "``)
~~~~~~~~~~~~~~~~~~~~~~~~

* Import via ``From Coq Require Import Strings.String.``


``byte``
~~~~~~~~

TODO


``ByteVector``
~~~~~~~~~~~~~~

* Import via ``From Coq Require Import Strings.ByteVector.``


Primitive objects
-----------------

``int``
~~~~~~~

TODO


``float``
~~~~~~~~~

TODO


``array``
~~~~~~~~~

TODO


Sum types
---------

``Variant``
~~~~~~~~~~~

TODO


``Inductive``
~~~~~~~~~~~~~

TODO


``CoInductive``
~~~~~~~~~~~~~~~

TODO


``sum`` (``+``), ``or`` (``\/``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

TODO


``option``, ``sumor`` (``... + { ... }``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

TODO


``bool``, ``sumbool`` (``{ ... } + { ~ ... }``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

TODO


Product types
-------------

``Record``, ``Structure``
~~~~~~~~~~~~~~~~~~~~~~~~~

TODO


``prod`` (``*``), ``sigma`` (``{ ... | ... }``), ``and`` (``/\``), ``ex`` (``exists ... , ...``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

TODO


Containers
----------

``list`` (``[ ... ]``)
~~~~~~~~~~~~~~~~~~~~~~

* Import via ``From Coq Require Import Lists.List.``


``VectorDef.t``
~~~~~~~~~~~~~~~

* Import via ``From Coq Require Import Vectors.Vector.``


MSets
~~~~~

* Import via ``From Coq Require Import MSets.MSetRBT.``


Typeclasses and canonical structures
------------------------------------

``Class``
~~~~~~~~~

TODO


``Instance``
~~~~~~~~~~~~

TODO


``Canonical Structure``
~~~~~~~~~~~~~~~~~~~~~~~

TODO


Inheritance and ``Coercion``
----------------------------

TODO


Boxed and unboxed representations
---------------------------------

TODO


Common classes & structures
------------------------------

``Coq.Classes.DecidableClass``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* ``Decidable``


``Coq.Classes.EquivDec``
~~~~~~~~~~~~~~~~~~~~~~~~

* ``DecidableEquivalence``
* ``EqDec``


``Coq.Classes.RelationClasses``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* ``Reflexive``
* ``Irreflexive``
* ``Symmetric``
* ``Asymmetric``
* ``Transitive``
* ``PreOrder``
* ``StrictOrder``
* ``PER``
* ``Equivalence``
* ``Antisymmetric``
* ``subrelation``


``Coq.Classes.SetoidClass``
~~~~~~~~~~~~~~~~~~~~~~~~~~~

* ``Setoid``


``Coq.Classes.SetoidDec``
~~~~~~~~~~~~~~~~~~~~~~~~~

* ``DecidableSetoid``
* ``EqDec``


``ExtLib.Structures.Monad``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Note:* This is part of the `ExtLib library <https://github.com/coq-community/coq-ext-lib/>`_.

* ``Monad``


Universes
---------

Universe polymorphism
~~~~~~~~~~~~~~~~~~~~~

TODO
