(import (scheme base)
        (scheme write)
        (scheme read)
        (scheme file)
        ;(scheme cxr)
        (rapid primitive))

(define-primitive eval-core 'eval) ;; => yields eval:r7 for now
(define-primitive pp 'pp)


;; 3
(define (caaar pair)
  (car (caar pair)))
(define (caadr pair)
  (car (cadr pair)))
(define (cadar pair)
  (car (cdar pair)))
(define (caddr pair)
  (car (cddr pair)))
(define (cdaar pair)
  (cdr (caar pair)))
(define (cdadr pair)
  (cdr (cadr pair)))
(define (cddar pair)
  (cdr (cdar pair)))
(define (cdddr pair)
  (cdr (cddr pair)))

;; 4a
(define (caaaar pair)
  (caar (caar pair)))
(define (caaadr pair)
  (caar (cadr pair)))
(define (caadar pair)
  (caar (cdar pair)))
(define (caaddr pair)
  (caar (cddr pair)))
(define (cadaar pair)
  (cadr (caar pair)))
(define (cadadr pair)
  (cadr (cadr pair)))
(define (caddar pair)
  (cadr (cdar pair)))
(define (cadddr pair)
  (cadr (cddr pair)))

;; 4d
(define (cdaaar pair)
  (cdar (caar pair)))
(define (cdaadr pair)
  (cdar (cadr pair)))
(define (cdadar pair)
  (cdar (cdar pair)))
(define (cdaddr pair)
  (cdar (cddr pair)))
(define (cddaar pair)
  (cddr (caar pair)))
(define (cddadr pair)
  (cddr (cadr pair)))
(define (cdddar pair)
  (cddr (cdar pair)))
(define (cddddr pair)
  (cddr (cddr pair)))


(define rapid-require "rapid-scheme/share/rapid/primitives.scm")
(define r7-tbl "misc/impltrack/r7-symbols.scm")
(define known-bad "misc/impltrack/known-bad.scm")
(define known-good "misc/impltrack/known-good.scm")
(define override "r7/_override.scm")

(define (has-core? sym)
  (with-exception-handler
    (lambda (e) #f)
    (lambda ()
      (and (procedure? (eval-core sym "bogus"))
           #t))))

(define (extract-rapid-require ent)
  (and (list? ent)
       (eq? 'define-primitive (car ent))
       (cadr ent)))

(define (extract-override ent)
  (and (list? (car ent))
       (eq? '%%inject-r7-override
            (car (cadr (car ent))))
       (cadr (caddr (caddr (car ent))))))


(define (port->sexp p)
  (define (itr cur)
    (let ((r (read p)))
     (if (eof-object? r)
       (reverse cur)
       (itr (cons r cur))) ))
  (itr '()))

(define (file->sexp pth)
  (define p (open-input-file pth))
  (let ((obj (port->sexp p)))
   (close-port p)
   obj))

;; dict
;; #(sym STATUS lib section comment)

(define symbols '())

(define (display/fill width obj)
  (let ((p (open-output-string)))
   (display obj p)
   (let* ((str (get-output-string p))
          (len (string-length str)))
     (display
       (if (>= len width)
         str
         (string-append
           str
           (make-string (- width len) #\space)))))))


(define (display-table)
  (define width-symbol 30)
  (define width-status 16)
  (define width-lib 24)
  (define width-section 24)

  (define total 0)
  (define maybe 0)
  (define bad 0)
  (define notyet 0)
  (define implemented 0)
  (define rapid-scheme 0)

  (define (display-header)
    (display "# Implementation status\n\n")
    (display "- R7RS Coverage % (Incl. Not confirmed): ")
    (display (* 100 (inexact (/ (+ implemented rapid-scheme maybe) total))))
    (newline)
    (display "- Total: ")
    (display total)
    (newline)
    (display "- Implemented procedures: ")
    (display implemented)
    (newline)
    (display "- Implemented by Rapid-Scheme: ")
    (display rapid-scheme)
    (newline)
    (display "- Maybe implemented: ")
    (display maybe)
    (newline)
    (display "- Not yet implemented: ")
    (display notyet)
    (newline)
    (display "- Bad: ")
    (display bad)
    (newline)
    (newline)
    )


  (for-each
    (lambda (v)
      (let ((status (or (vector-ref v 1)
                        'rapid-scheme)))
        (case status
          ((NOTYET) (set! notyet (+ 1 notyet)))
          ((maybe) (set! maybe (+ 1 maybe)))
          ((BAD) (set! bad (+ 1 bad)))
          ((implemented) (set! implemented (+ 1 implemented)))
          ((rapid-scheme) (set! rapid-scheme (+ 1 rapid-scheme)))
          (else
            (error "Huh?" v)))
        (set! total (+ 1 total)) ))
    symbols) 

  (display-header)

  (display "# Symbol status\n")
  (display "|Symbol|status|library|R7RS Section|Remarks|\n")
  (display "|:-----|:----:|:-----:|:-----------|:------|\n")

  (for-each
    (lambda (v)
      (let ((sym (vector-ref v 0))
            (status (or (vector-ref v 1)
                        'rapid-scheme))
            (lib (or (vector-ref v 2)
                     "Unknown"))
            (section (or (vector-ref v 3)
                         "Unknown"))
            (comment (or (vector-ref v 4) "")))
        (display "|")
        (display/fill width-symbol sym)
        (display "|")
        (display/fill width-status status)
        (display "|")
        (display/fill width-lib lib)
        (display "|")
        (display/fill width-section section)
        (display "|")
        (display comment)
        (display "|\n"))
      )
    symbols))

(define (modify-symbol! fail? sym proc)
  (let loop ((cur symbols))
   (if (pair? cur)
     (let ((a (car cur)))
      (if (eq? (vector-ref a 0) sym)
        (proc a)
        (loop (cdr cur))))
     (cond
       (fail? 
         (error "Not found" sym))
       (else
         #|
         (display "Symbol: ")
         (display sym)
         (display " was not found (recovered)\n")
         |#
         (let ((x (vector sym #f #f #f #f)))
          (proc x)
          (set! symbols (append symbols (list x)))))))))

(let ((require (map extract-rapid-require (file->sexp rapid-require)))
      (r7 (file->sexp r7-tbl))
      (bad (file->sexp known-bad))
      (good (file->sexp known-good))
      (ovl (extract-override (file->sexp override))))

  (define (mark-using-list! lis code)
    (define (do-modify! sym comment)
      (modify-symbol! 
        #t sym
        (lambda (v)
          (let ((c (vector-ref v 1)))
           (unless c
             (vector-set! v 1 code)
             (vector-set! v 4 comment))))))
    (for-each (lambda (ent)
                (cond
                  ((list? ent)
                   (let ((sym (car ent))
                         (comment (cadr ent)))
                     (do-modify! sym comment)))
                  (else
                    (do-modify! ent ""))))
              lis) )

  ;; Fill section names
  (let loop ((rest r7))
   (when (pair? rest)
     (let ((a (car rest))
           (next (cdr rest)))
       (when (string? (car a))
         (for-each (lambda (sym)
                     (set! symbols
                       (cons 
                         (vector sym #f "Unknown" (car a) #f)
                         symbols)))
                   (cdr a)))
       (loop next))))

  ;; Add R7RS library symbols
  (let loop ((rest r7))
   (if (pair? rest)
     (let ((a (car rest))
           (next (cdr rest)))
       (when (list? (car a))
         (for-each (lambda (sym) 
                     (modify-symbol! #f sym (lambda (v) (vector-set! v 2 (car a)))))
                   (cdr a)))
       (loop next))
     (set! symbols (reverse symbols))))


  ;; Mark known-bads
  (mark-using-list! bad 'BAD)
  (mark-using-list! good 'implemented)

  ;; Mark Dispatched
  (for-each (lambda (e)
              (let ((from (car e))
                    (to (cadr e)))
                (modify-symbol! 
                  #t from
                  (lambda (v) 
                    (vector-set! v 1 'implemented)
                    (vector-set! v 4 
                                 (string-append
                                   "Rapid-gambit runtime override ("
                                   (symbol->string to)
                                   ")"))))))
            ovl)
  ;; Mark Required
  (for-each (lambda (sym)
              (modify-symbol!
                #t sym
                (lambda (v)
                  (let ((cur (vector-ref v 1)))
                   (unless cur
                     (let ((impl? (has-core? sym)))
                      (vector-set! v 1 (if impl? 'maybe 'NOTYET))))))))
            require)
  (display-table)
  )


