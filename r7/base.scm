;; R7RS base


;; Exceptions

; FIXME: replacing Gambit's original raise is not good idea
;        but we should do so in someday...

; Anyway, define raise continuable. On Gambit, `noncontinuable-exception?`
; exception is only non-continuables. so just `raise` is mostly 
; raise-continuable.
(define raise-continuable raise)

;; Errors

;; Predicates
(define (%%for-all a . d)
  (if (pair? d)
    (and a (apply %%for-all d))
    a))

(define (%%fold-all q a b . d)
  (if (pair? d)
    (and (q a b) (apply %%fold-all q b d))
    (q a b)))

(define (symbol=? . syms)
  (and (apply %%for-all (map symbol? syms))
       (apply %%fold-all eq? syms)))

(define (boolean=? . bs)
  (and (apply %%for-all (map boolean? bs))
       (apply %%fold-all eqv? bs)))

;; R6RS name inexact/exact
(define inexact exact->inexact)
(define exact inexact->exact)

;; Bytevectors => u8vector
(define bytevector? u8vector?)
(define bytevector u8vector)
(define bytevector-append u8vector-append)
(define bytevector-copy u8vector-copy)
(define bytevector-length u8vector-length)
(define bytevector-u8-ref u8vector-ref)
(define bytevector-u8-set! u8vector-set!)

;; Strings
(define string-copy:r5 string-copy)

(define string-copy:r7
  (case-lambda
    ((str) (string-copy:r5 str))
    ((str start) (substring str start (string-length str)))
    ((str start end) (substring str start end))))

(set! string-copy string-copy:r7)


(define (string-for-each p str)
  (for-each p (string->list str)))

;; Loops
(define member
  (case-lambda
    (() (break member) (member)) ;; HACK(breakpoint)
    ((x lis) (member x lis equal?))
    ((x lis p)
     (and (pair? lis)
          (or (and (p x (car lis))
                   lis)
              (member x (cdr lis) p))))))

;; Vectors
(define (vector-for-each p . v)
  (define x (map vector->list v))
  (apply for-each p x))

(define (vector-map p . v)
  (define x (map vector->list v))
  (list->vector (apply map p x)))

;; Math
(define (exact-integer? x) (and (integer? x) (exact? x)))

;; I/O
(define %%my-eof-object
  (let ((p (open-input-string "")))
   (read p)))

(define (eof-object) %%my-eof-object)
(define write-string
  (case-lambda
    ((str) (display str))
    ((str port) (display str port))
    ((str port start) (display (substring str (string-length str)) port))
    ((str port start end) (display (substring str start end) port))))

(define (flush-output-port . ignored) 'bogus)


'(NOT-IMPLEMENTED:
   ;; R7RS I/O
   binary-port? 
   call-with-port 
   flush-output-port 
   open-input-bytevector 
   open-output-bytevector 
   output-port-open?
   peek-u8 
   read-string 
   read-bytevector
   read-bytevector! 
   get-output-bytevector
   input-port-open?

   bytevector-copy! 
   make-bytevector 

   features 
   list-copy
   list-set!
   make-list
   syntax-error
   textual-port?

   ;; R7RS Errors
   error-object-irritants
   error-object-message 
   error-object?
   file-error?
   read-error? 


   ;; R7RS Math
   exact-integer-sqrt 
   floor-quotient
   floor-remainder 
   floor/
   truncate-quotient
   truncate-remainder 
   truncate/

   ;; R7RS String
   utf8->string 
   string->utf8 
   string->vector
   string-copy! 
   string-map 

   ;; R7RS Vectors
   vector->string 
   vector-copy!
   write-bytevector
   write-string

   ;; Will not implemented
   u8-ready? 
   )

