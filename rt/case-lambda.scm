;; Took from R7RS, re-written in R5RS syntax-rules
(define-syntax %case-lambda0
  (syntax-rules ()
    ((_ dbg args len) (begin 
                        (pp (list 'dbg: 'dbg))
                        (pp (list 'arg: args))
                        (error "no maching clause" 'dbg)))
    ((_ dbg args len ((p ...) . body) . rest)
     (if (= len (length '(p ...)))
       (apply (lambda (p ...) . body) args)
       (%case-lambda0 dbg args len . rest)))
    ((_ dbg args len ((p ... . tail) . body) . rest)
     (if (>= len (length '(p ...)))
       (apply (lambda (p ... . tail) . body) args)
       (%case-lambda0 dbg args len . rest)))
    ((_ dbg args len (p . body))
     (apply (lambda p . body) args))))

(define-syntax case-lambda
  (syntax-rules ()
    ((case-lambda (arg body)) ;; short cut
     (lambda arg body))
    ((case-lambda cls0 cls1 ...)
     (lambda args
       (let ((len (length args)))
        (%case-lambda0 (cls0 cls1 ...) args len cls0 cls1 ...))))))
