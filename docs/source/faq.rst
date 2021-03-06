FAQ
===


What is a style guide?
----------------------

A *style guide* is a set of conventions for organizing code & projects. They provide guidance on code formatting, repository layout, and other common needs.


Why adopt a style guide?
------------------------

Everyone who interacts with code is impacted by code style. This clearly includes the project's contributors, but it also includes other interested parties such as users and upstream maintainers. In other words, style is relevant to many different *roles and personas* engaged in many different *use cases*.

A style is "good" if it has a net-positive impact on those use cases.

Good style does not arise by accident; rather, it is engineered by carefully considering how different coding & project idioms impact different use cases.

In principle, project maintainers can do this for themselves on a case by case basis. In practice, this is a lot of work to get right. Therefore, many projects adopt a style guide - either in full, or as a starting point for their own style.


When is the right time to adopt a style guide?
----------------------------------------------

Style is a highly visible property of open source software and should therefore be treated as a major feature.

For new projects, a style guide should be adopted prior to the first major release.

For established projects, a style guide should be adopted through iterative refactoring subject to other project constraints.


Why adopt *this* style guide?
-----------------------------

TODO


How does this relate to *Requirements on the Use of Coq in the Context of Common Criteria Evaluations*?
-------------------------------------------------------------------------------------------------------

`Requirements on the Use of Coq in the Context of Common Criteria Evaluations <https://www.ssi.gouv.fr/uploads/2014/11/anssi-requirements-on-the-use-of-coq-in-the-context-of-common-criteria-evaluations-v1.0-en.pdf>`_ is a requirements document published by `ANSSI <https://www.ssi.gouv.fr>`_ and `INRIA <https://www.inria.fr>`_. While most projects are unlikely to be used in a Common Criteria Evaluation, the guidance offered by this document is valuable in other contexts as well.

With respect to coding style, the document says:

   There is no well-established coding style for Coq development. The present document does not attempt to fill this gap, but rather to identify and discourage known bad practices.

This style guide attempts to fill this gap.


What is Alectryon?
------------------

`Alectryon <https://github.com/cpitclaudel/alectryon/>`_ is a tool for processing Coq files and generating pretty output for use in HTML, PDF, and other formats.

When used to generate HTML, it allows readers to step-through the intermediate goal states of proofs using :command:`ctrl+???` and :command:`ctrl+???` or by hovering the mouse cursor over a particular line. Try it now:

.. coq::

   Lemma le_l : forall y x, S x <= y -> x <= y.
     induction y; inversion 1; subst.
     all: info_eauto.
   Qed.


How can I contribute to this guide?
-----------------------------------

`vstyle is hosted on GitHub <https://github.com/appliedfm/vstyle>`_. Information about how to contribute can be found in `our CONTRIBUTING.md file <https://github.com/appliedfm/vstyle/blob/main/CONTRIBUTING.md>`_.
