(define (environment . ignored) 'ignored-environment)

(define (%%expand-input frm)
  ;; Pre-process form with simply-minded macro expander
  ;; which only supports:
  ;; 
  ;;  (quote frm)
  ;;  #(v ...)    - Self evaluating vector
  ;;  #u8(b ...)  - Self evaluating bytevector(u8vector on Gambit)
  ;;  let-values
  ;;  set!-values
  ;;  case-lambda
  ;;
  ;; it assumes alpha transform which should be done on
  ;; rapid-scheme frontend
  (define (do-expand orig head body)
    (case head
      ((quote) orig) ;; short cut
      ((let-values)
       (%%expand-input (apply %%expand-let-values body)))
      ((set!-values)
       (%%expand-input (apply %%expand-set!-values body)))
      ((case-lambda)
       (%%expand-input (apply %%expand-case-lambda body)))
      (else (cons head (map expand-1 body)))))

  (define (expand-1 frm)
    ;(pp (list 'EXPAND: frm))
    (cond
      ((and (pair? frm) (list? frm))
       ;; We don't have any interest on dotted-lists
       ;; (they're only appeared as (lambda (a . b) ...) etc)
       (let ((a (car frm))
             (d (cdr frm)))
         (cond
           ((pair? a)
            (map expand-1 frm))
           (else (do-expand frm a d)))))
      ((vector? frm)
       `(quote ,frm))
      ((u8vector? frm)
       `(quote ,frm))
      (else frm)))
  (expand-1 frm))

(define (eval:r7 frm env)
  (define e (%%inject-r7-override (%%expand-input frm)))
  ;(pp frm (current-output-port))
  ;(display "----\n")
  ;(pp e (current-output-port))
  (eval e))
