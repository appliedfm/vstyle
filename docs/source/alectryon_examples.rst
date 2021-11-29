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

.. coq::

   Lemma le_l : forall y x, S x <= y -> x <= y.
     induction y; inversion 1; subst.
     all: info_eauto.
   Qed.
