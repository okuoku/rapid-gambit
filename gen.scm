#!/usr/local/Gambit/bin/gsi

;; Generate source from Larceny output
(define psrc (open-input-file "core.scm"))

(define (gensrc port name)
  (define l (read-all port))
  (let ((outp (open-output-file name)))
   (for-each (lambda (sexp)
               (pp sexp outp)
               (newline outp))
             l)
   (close-port outp)))

(gensrc psrc "core0.scm")
