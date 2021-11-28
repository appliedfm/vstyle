Alectryon examples
==================

This page is for testing and should be removed prior to release.

Basic example
-------------

.. coq::

   Lemma le_l : forall y x, S x <= y -> x <= y.
     induction y; inversion 1; subst.
     all: info_eauto.
   Qed.
