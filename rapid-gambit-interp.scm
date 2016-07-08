#!/usr/local/Gambit/bin/gsi

(define ($$undefined) (if #f #f))

;; Clobber libary import syntax
(define-macro (import . bogus) '(begin))

;; Load primitive libraries
(include "rt/case-lambda.scm")
(include "rt/values-utils.scm")

(define-macro (unless test . body)
  `(if ,test #f (begin ,@body)))

(define bk 0)

(define %%my-eof-object
  (let ((p (open-input-string "")))
   (read p)))

(define (eof-object) %%my-eof-object)

(define member
  (case-lambda
    (() (break member) (member)) ;; HACK
    ((x lis) (member x lis equal?))
    ((x lis p) 
     ;(set! bk (+ 1 bk))
     ;(pp (list 'bk bk 'member: x lis p))
     (and (pair? lis)
          (or (and (p x (car lis))
                   lis)
              (member x (cdr lis) p))))))

(define (vector-for-each2 p v0 v1)
  (for-each p (vector->list v0) (vector->list v1)))

(define (symbol=? a b) (eq? a b)) ;; FIXME:

(define (exact-integer? x) (and (integer? x) (exact? x)))

(define (environment . ignored) 'bogus)

(define (flush-output-port . ignored) 'bogus)

(define write-string
  (case-lambda
    ((str) (display str))
    ((str port) (display str port))
    ((str port start) (display (substring str (string-length str)) port))
    ((str port start end) (display (substring str start end) port))))

(define string-copy:r5 string-copy)

(define string-copy:r7
  (case-lambda
    ((str) (string-copy:r5 str))
    ((str start) (substring str start (string-length str)))
    ((str start end) (substring str start end))))

(set! string-copy string-copy:r7)

(define (string-for-each p str)
  (for-each p (string->list str)))

;; FIXME: foldcase
(define (char-foldcase c) c)
(define (string-foldcase str) str)

;; FIXME: bytevector
(define bytevector? u8vector?)
(define bytevector u8vector)

(define (vector-for-each p . v)
  (define x (map vector->list v))
  (apply for-each p x))

(define (vector-map p . v)
  (define x (map vector->list v))
  (list->vector (apply map p x)))

(define write-shared pp)

(include "rt/record-GPL3.scm")

;; Load rapid-scheme core
(include "core0.scm")
