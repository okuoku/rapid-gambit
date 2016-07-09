
(define %%my-command-line #f)

(define (command-line:r7)
  (define (itr first init cur)
    (if (pair? cur)
      (let ((a (car cur))
            (d (cdr cur)))
        (if (string=? "--" a)
          (set! %%my-command-line (first d))
          (itr first init d)))
      (set! %%my-command-line init)))
  (or %%my-command-line
      (begin
        (let ((cm (command-line)))
         (itr (car cm) cm cm))
        %my-command-line)))

(define (exit:r7 b)
  (cond
    ((boolean? b)
     (if b 
       (exit 1)
       (exit 0)))
    (else
      (exit b))))

(define (emergency-exit b) (exit:r7 b))

(define (get-environment-variable name)
  (getenv name #f))

(define (get-environment-variables)
  (error "Not implemented."))

