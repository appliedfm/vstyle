# applied.fm Style Guide for Coq

## About

This is a work in progress! We welcome feedback and pull requests. Find us on [GitHub](https://github.com/appliedfm/vstyle).

## Principles

### Use cases

1. User/contributor/curious person browsing the GitHub repository in a browser
1. User/contributor/curious person exploring the code in a proof assistant
1. User/contributor who needs to isolate and resolve build issues
1. User trying to explore undocumented features
1. Researcher trying to understand the architecture
1. Contributor trying to ship a new feature
1. Contributor engaged in a large refactor

### Objectives

1. Find & replace work as expected.
1. Mitigate <a href="https://en.wikipedia.org/wiki/Law_of_triviality">the law of triviality</a>.
1. Code is robust against changes to the Coq engine.
1. Code is minimally impacted by breaking changes in upstream components.

## Table of Contents

1. <a href="project_structure.html">Project structure</a>
    * Documentation
    * Continuous integration
    * Repo layout
1. Formatting
    * Spaces & tabs
    * Line length
    * Non-ASCII characters
1. Naming conventions
    * Files
    * Modules
    * Types
    * Predicates
    * Projections
1. Imports & exports
1. Notations
1. Definitions & lemmas
    * Type inference
1. Variants, inductives, and records
1. Classes and canonical structures
1. Arguments
1. Modules
1. Ltac

## Library-specific guidance

* coq-lib
    * list
    * prod
    * sum
    * sigma
* coq-ext-lib
* ITree
* VST
