(define-macro (case-lambda . cls*)
  (define (dotted-length pr)
    (define (itr acc p)
      (if (pair? p)
        (itr (+ 1 acc) (cdr p))
        acc))
    (itr 0 pr))
  (define (%emit-case-lambda len args cls*)
    (cond
      ((pair? cls*)
       (let ((a (car cls*))
             (next (cdr cls*)))
         (define (fail) (%emit-case-lambda len args next))
         (let ((frm (car a))
               (body* (cdr a)))
           (cond
             ((list? frm)
              (let ((xlen (length frm)))
               `(if (= ,len ,xlen)
                  (apply (lambda ,frm ,@body*) ,args)
                  ,(fail))))
             ((pair? frm)
              (let ((xlen (dotted-length frm)))
               `(if (>= ,len ,xlen)
                  (apply (lambda ,frm ,@body*) ,args)
                  ,(fail))))
             (else
               `(apply (lambda ,frm ,@body*) ,args))))))
      (else
        '(error "no matching clause"))))
  (if (= 1 (length cls*))
    (append `(lambda ,(caar cls*)) (cdar cls*))
    (let ((args (gensym))
          (len (gensym)))
      `(lambda ,args
         (let ((,len (length ,args)))
          ,(%emit-case-lambda len args cls*))))))

;; FIXME: copy-paste
(define (%%expand-case-lambda . cls*)
  (define (dotted-length pr)
    (define (itr acc p)
      (if (pair? p)
        (itr (+ 1 acc) (cdr p))
        acc))
    (itr 0 pr))
  (define (%emit-case-lambda len args cls*)
    (cond
      ((pair? cls*)
       (let ((a (car cls*))
             (next (cdr cls*)))
         (define (fail) (%emit-case-lambda len args next))
         (let ((frm (car a))
               (body* (cdr a)))
           (cond
             ((list? frm)
              (let ((xlen (length frm)))
               `(if (= ,len ,xlen)
                  (apply (lambda ,frm ,@body*) ,args)
                  ,(fail))))
             ((pair? frm)
              (let ((xlen (dotted-length frm)))
               `(if (>= ,len ,xlen)
                  (apply (lambda ,frm ,@body*) ,args)
                  ,(fail))))
             (else
               `(apply (lambda ,frm ,@body*) ,args))))))
      (else
        '(error "no matching clause"))))
  (if (= 1 (length cls*))
    (append `(lambda ,(caar cls*)) (cdar cls*))
    (let ((args (gensym))
          (len (gensym)))
      `(lambda ,args
         (let ((,len (length ,args)))
          ,(%emit-case-lambda len args cls*))))))

#|
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
|#

