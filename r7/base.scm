;; R7RS base


;; Exceptions
(define (with-exception-handler:r7 handler thunk)
  (with-exception-catcher
    handler
    thunk))

(define (raise:r7 e)
  (abort e))

(define (raise-continuable e) ;; FIXME: not very correct
  (define h (current-exception-handler))
  (call-with-values
    (lambda () (raise e))
    (lambda x
      (current-exception-handler h)
      (values x))))

;; Errors

(define-macro (%%def-exception-object-handlers)
  (define (ent e)
    (define (basesym e) (string->symbol
                          (string-append
                            (symbol->string e)
                            "-exception?")))
    (let ((type (car e))
          (basename (cadr e))
          (components (cddr e)))
      (define (componentsym e)
        (string->symbol
          (string-append
            (symbol->string basename)
            "-exception-"
            (symbol->string e))))
      `(list ,(basesym basename)
             ',type 
             ,@(map (lambda (e) `(cons ',e ,(componentsym e))) components))))
  (define excs
    '((error noncontinuable reason)
      (error heap-overflow)
      (error stack-overflow)
      (error os procedure arguments code message)
      (file  no-such-file-or-directory procedure arguments)
      (error unbound-os-environment-variable procedure arguments)
      (error scheduler reason)
      (error deadlock)
      (error abandoned-mutex)
      (error join-timeout procedure arguments)
      (error started-thread procedure arguments)
      (error terminated-thread procedure arguments)
      (error uncaught procedure arguments reason)
      (error cfun-conversion procedure arguments code message)
      (error sfun-conversion procedure arguments code message)
      (error multiple-c-return)
      (read  datum-parsing kind parameters readenv)
      (read  expression-parsing kind parameters source)
      (error unbound-global variable code rte)
      (error type procedure arguments arg-num type-id)
      (error range procedure arguments arg-num)
      (error divide-by-zero procedure arguments)
      (error improper-length-list procedure arguments arg-num)
      (error wrong-number-of-arguments procedure arguments)
      (error number-of-arguments-limit procedure arguments)
      (error nonprocedure-operator operator arguments code rte)
      (error unknown-keyword-argument procedure arguments)
      (error keyword-expected procedure arguments)
      (error error message parameters)))

  `(define %%exception-object-handlers
     (list ,@(map ent excs))))

(%%def-exception-object-handlers)

(define (%%error-object-dispatch proc e)
  (define (itr cur)
    (and (pair? cur)
         (let ((check (caar cur)))
          (if (check e)
            (apply proc cur)
            (itr (cdr cur))))))
  (itr %%exception-object-handlers)
  #f)

(define (error-object? e)
  (%%error-object-dispatch (lambda _ #t) e))

(define (error-object-irritants e)
  (cond
    ((error-exception? e)
     (error-exception-parameters e))
    (else #f)))

(define (error-object-message e)
  (cond
    ((error-exception? e)
     (error-exception-message e))
    (else #f)))

(define (file-error? e)
  (%%error-object-dispatch (lambda (type . _) (eq? type 'file)) e))

(define (read-error? e)
  (%%error-object-dispatch (lambda (type . _) (eq? type 'read)) e))

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


; Mostly same algorithm as Chez.
;; Efficient Nondestructive Equality Checking for Trees and Graphs (ICFP 2008)
;; by Michael D. Adams and R. Kent Dybvig

(define (equal?:r7 x y)
  ;; FIXME: Implement interleaved version
  (define k0 400) ;; Took from section 4.2  (Chez uses 200)
  ;(define kb -40)
  ;; box
  (define (box? b) (pair? b))
  (define (box obj) (list obj))
  (define (unbox b) (car b))
  (define (set-box!/false b v) (set-car! b v) #f)
  ;; Gambit: use tables for hash-table replacement
  (define (tbl-new) (make-table size: 400 test: eq? hash: eq?-hash))

  ;; union-find: As in the paper + some folding
  (define (union-find tbl x y)
    (define (tbl-add!/false obj v) (table-set! tbl obj v) #f) ;; v: boxes
    (define (tbl-ref obj) (table-ref tbl obj #f))
    (define (find b)
      (let ((n (unbox b)))
       (if (box? n)
         (let loop ((b b) (n n))
          (let ((nn (unbox n)))
           (cond ((box? n)
                  (set-box!/false b nn)
                  (loop n nn))
                 (else n))))
         b)))
    (let ((bx (tbl-ref x))
          (by (tbl-ref y)))
      (if (not bx)
        (if (not by)
          (let ((b (box 1)))
           (tbl-add!/false x b)
           (tbl-add!/false y b))
          (let ((ry (find by)))
           (tbl-add!/false x ry)))
        (if (not by)
          (let ((rx (find bx)))
           (tbl-add!/false y rx))
          (let ((rx (find bx))
                (ry (find by)))
            (or (eq? rx ry)
                (let ((nx (unbox rx))
                      (ny (unbox ry)))
                  (cond ((> nx ny)
                         (set-box!/false ry rx)
                         (set-box!/false rx (+ nx ny)))
                        (else 
                          (set-box!/false rx ry)
                          (set-box!/false ry (+ nx ny)))))))))))

  (define (pre? x y k)
    (cond
      ((eq? x y) k)
      ((pair? x)
       (and (pair? y)
            (if (<= k 0)
              k
              (let ((k (pre? (car x) (car y) (- k 1))))
               (and k (pre? (cdr x) (cdr y) k))))))
      ((vector? x)
       (and (vector? y)
            (let ((n (vector-length x)))
             (and (= n (vector-length y))
                  (let loop ((i 0) (k k))
                   (if (or (= i n) (<= k 0))
                     k
                     (let ((k (pre? (vector-ref x i)
                                    (vector-ref y i)
                                    (- k 1))))
                       (and k (loop (+ i 1) k)))))))))
      (else (and (equal? x y) k))))

  ;; uf-equal?
  (define (uf-equal? x y) 
    (let ((tbl (tbl-new)))
     (define (e? x y)
       (cond ((eq? x y) ;; Short cut
              #t)
             ((pair? x)
              (and (pair? y)
                   (or (union-find tbl x y)
                       (and (e? (car x) (car y))
                            (e? (cdr x) (cdr y))))))
             ((vector? x)
              (and (vector? y)
                   (let ((n (vector-length x)))
                    (and (= n (vector-length y))
                         (or (union-find tbl x y)
                             (let loop ((i 0))
                              (or (= i n)
                                  (and (e? (vector-ref x i)
                                           (vector-ref y i))
                                       (loop (+ i 1))))))))))
             (else (equal? x y))))
     (e? x y)))
  (let ((k (pre? x y k0))) 
   (and k (or (> k 0) (uf-equal? x y)))))

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
(define make-bytevector make-u8vector)

;; Strings
(define string-copy:r5 string-copy)

(define string-copy:r7
  (case-lambda
    ((str) (string-copy:r5 str))
    ((str start) (substring str start (string-length str)))
    ((str start end) (substring str start end))))

(define (string-for-each p str)
  (for-each p (string->list str)))

(define (string-map p . str*)
  (list->string
    (apply map p (map string->list str*))))

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

(define (call-with-port port proc)
  (call-with-values
    (lambda () (proc port))
    (lambda x (close-port port) (values x))))

;; R7RS String

(define (%utf8->string u8) ;; FIXME: Detect illegal sequence more strictly
  (define len (u8vector-length u8))
  (define (complain) (error "Illegal utf8 sequence" u8))
  (call-with-output-string
    '()
    (lambda (p)
      (let loop ((idx 0))
       (define rest (- len idx))
       (cond
         ((= idx len)
          ;; DONE
          p)
         (else
           (let ((c0 (u8vector-ref u8 idx)))
            (cond
              ((< c0 #x80) ;; 1 byte
               (write-char (integer->char c0) p)
               (loop (+ 1 idx)))
              ((< c0 #xe0) ;; 2 bytes
               (if (< rest 1) (complain))
               (let* ((c1 (u8vector-ref u8 (+ 1 idx)))
                      (i (bitwise-ior
                           (arithmetic-shift (bitwise-and #x1f c0) 6)
                           (bitwise-and #x3f c1))))
                 (write-char (integer->char i) p))
               (loop (+ 2 idx)))
              ((< c0 #xf0) ;; 3 bytes
               (if (< rest 2) (complain))
               (let* ((c1 (u8vector-ref u8 (+ 1 idx)))
                      (c2 (u8vector-ref u8 (+ 2 idx)))
                      (i (bitwise-ior
                           (arithmetic-shift (bitwise-and #xf c0) 12)
                           (arithmetic-shift (bitwise-and #x3f c1) 6)
                           (bitwise-and #x3f c2))))
                 (write-char (integer->char i) p))
               (loop (+ 3 idx)))
              ((< c0 #xf5) ;; 4 bytes
               (if (< rest 3) (complain))
               (let* ((c1 (u8vector-ref u8 (+ 1 idx)))
                      (c2 (u8vector-ref u8 (+ 2 idx)))
                      (c3 (u8vector-ref u8 (+ 3 idx)))
                      (i (bitwise-ior
                           (arithmetic-shift (bitwise-and #x7 c0) 18)
                           (arithmetic-shift (bitwise-and #x3f c1) 12)
                           (arithmetic-shift (bitwise-and #x3f c2) 6)
                           c3)))
                 (write-char (integer->char i) p))
               (loop (+ 4 idx)))
              (else (complain))))))))))

(define utf8->string
  (case-lambda
    ((u8) (%utf8->string u8))
    ((u8 start) (%utf8->string (subu8vector u8 start (u8vector-length u8))))
    ((u8 start end) (%utf8->string (subu8vector u8 start end)))))

(define (%string->utf8 str)
  (define len (string-length str))
  (call-with-output-u8vector 
    '()
    (lambda (p)
      (let loop ((idx 0))
       (cond
         ((= idx len)
          ;; DONE
          p)
         (else
           (let ((i (char->integer (string-ref str idx))))
            (cond
              ((< i #x80) ;; 1 byte
               (write-u8 i p))
              ((< i #x800) ;; 2 bytes
               (let ((c0 (bitwise-ior #xc0 (bitwise-and 
                                             #x1f (arithmetic-shift i -6))))
                     (c1 (bitwise-ior #x80 (bitwise-and #x3f i))))
                 (write-u8 c0 p)
                 (write-u8 c1 p)))
              ((< i #x10000) ;; 3 bytes
               (let ((c0 (bitwise-ior #xe0 (bitwise-and 
                                             #xf (arithmetic-shift i -12))))
                     (c1 (bitwise-ior #x80 (bitwise-and
                                             #x3f (arithmetic-shift i -6))))
                     (c2 (bitwise-ior #x80 (bitwise-and #x3f i))))
                 (write-u8 c0 p)
                 (write-u8 c1 p)
                 (write-u8 c2 p)))
              ((< i #x110000) ;; 4 bytes
               (let ((c0 (bitwise-ior #xf0 (bitwise-and
                                             #x7 (arithmetic-shift i -18))))
                     (c1 (bitwise-ior #x80 (bitwise-and
                                             #x3f (arithmetic-shift i -12))))
                     (c2 (bitwise-ior #x80 (bitwise-and
                                             #x3f (arithmetic-shift i -6))))
                     (c3 (bitwise-ior #x80 (bitwise-and #x3f i))))
                 (write-u8 c0 p)
                 (write-u8 c1 p)
                 (write-u8 c2 p)
                 (write-u8 c3 p)))
              (else
                (error "Invalid character" i str))))
           (loop (+ 1 idx))))))))

(define string->utf8
  (case-lambda
    ((str) (%string->utf8 str))
    ((str start) (%string->utf8 (substring str start (string-length str))))
    ((str start end) (%string->utf8 (substring str start end)))))

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

   features 
   list-copy
   list-set!
   make-list
   syntax-error
   textual-port?

   ;; R7RS Math
   exact-integer-sqrt 
   floor-quotient
   floor-remainder 
   floor/
   truncate-quotient
   truncate-remainder 
   truncate/

   ;; R7RS String
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

