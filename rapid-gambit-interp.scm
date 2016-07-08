#!/usr/local/Gambit/bin/gsi

;; Clobber libary import syntax
(define-macro (import . bogus) '(begin))

;; Load primitive libraries
(include "rt/case-lambda.scm")
(include "rt/values-utils.scm")

;; Load R7RS procedures
(include "r7/base.scm")

(define (environment . ignored) 'bogus)


;; FIXME: foldcase
(define (char-foldcase c) c)
(define (string-foldcase str) str)

;; Override write-shared
(define write-shared pp)

(include "rt/record-GPL3.scm")

;; Load rapid-scheme core
(include "core0.scm")
