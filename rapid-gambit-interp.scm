(define ($$undefined) (if #f #f))

;; Clobber libary import syntax
(define-syntax import
  (syntax-rules ()
    ((_ libs ...) (begin))))

;; Load primitive libraries
(include "rt/case-lambda.scm")
(include "rt/values-utils.scm")
(define-syntax unless
  (syntax-rules ()
    ((_ pred body)
     (if (not pred) body))))

(define member
  (case-lambda
    ((x lis) (member x lis equal?))
    ((x lis p) (and (pair? lis)
                    (or (and (p (car lis) x)
                             lis)
                        (member x (cdr lis) p))))))

(define (vector-for-each2 p v0 v1)
  (for-each p (vector->list v0) (vector->list v1)))

(define (symbol=? a b) (eq? a b)) ;; FIXME:

(define (exact-integer? x) (and (exact? x) (integer? x)))

(define (environment . ignored) 'bogus)

(define (flush-output-port . ignored) 'bogus)

(define write-string
  (case-lambda
    ((str) (display str))
    ((str port) (display str port))
    ((str port start) (display (substring str (string-length str)) port))
    ((str port start end) (display (substring str start end) port))))

(include "rt/record-GPL3.scm")

;; Load rapid-scheme core
(include "core0.scm")
