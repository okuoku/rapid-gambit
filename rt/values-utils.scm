(define-macro (let-values cls . body)
  (if (pair? cls)
    (let ((a (car cls))
          (d (cdr cls)))
      (let ((frms (car a))
            (init (cadr a)))
        `(call-with-values
           (lambda () ,init)
           (lambda ,frms 
             (let-values ,d ,@body)))))
    `(let () ,@body)))

;; FIXME: copy-paste
(define (%%expand-let-values cls . body)
  (if (pair? cls)
    (let ((a (car cls))
          (d (cdr cls)))
      (let ((frms (car a))
            (init (cadr a)))
        `(call-with-values
           (lambda () ,init)
           (lambda ,frms 
             (let-values ,d ,@body)))))
    `(let () ,@body)))

(define-macro (set!-values v* body)
  (let ((xfrm (map gensym v*)))
   `(call-with-values
      (lambda () ,body)
      (lambda ,xfrm 
        ,@(map (lambda (frm x) `(set! ,frm ,x)) v* xfrm)))))

;; FIXME: copy-paste
(define (%%expand-set!-values v* body)
  (let ((xfrm (map gensym v*)))
   `(call-with-values
      (lambda () ,body)
      (lambda ,xfrm 
        ,@(map (lambda (frm x) `(set! ,frm ,x)) v* xfrm)))))

