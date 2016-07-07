;; Generate source
(define psrc (open-input-file "core.scm"))

(define (gensrc port name)
  (define l (read-line port))
  (cond
    ((char=? #\( (string-ref l 0))
     (let ((inp (open-input-string l))
           (outp (open-output-file name)))
       (pp (read inp) outp)
       (pp (read inp) outp)
       (close-port outp)))
    (else (gensrc port name))))

(gensrc psrc "core0.scm")
