FAQ
===


Why adopt a style guide?
------------------------

TODO


When is the right time to adopt a style guide?
----------------------------------------------

TODO


Why adopt *this* style guide?
-----------------------------

TODO


What is Alectryon?
------------------

`Alectryon <https://github.com/cpitclaudel/alectryon/>`_ is a tool for processing Coq files and generating pretty output for use in HTML, PDF, and other formats.

When used to generate HTML, it allows readers to step-through the intermediate goal states of proofs using :command:`ctrl+↓` and :command:`ctrl+↑` or by hovering the mouse cursor over a particular line. Try it now:

.. coq::

   Lemma le_l : forall y x, S x <= y -> x <= y.
     induction y; inversion 1; subst.
     all: info_eauto.
   Qed.


How can I contribute to this guide?
-----------------------------------

`vstyle is hosted on GitHub <https://github.com/appliedfm/vstyle>`_. Information about how to contribute can be found in `our CONTRIBUTING.md file <https://github.com/appliedfm/vstyle/blob/main/CONTRIBUTING.md>`_.
