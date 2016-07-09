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

(define-macro (set!-values v* body)
  (let ((xfrm (map gensym v*)))
   `(call-with-values
      (lambda () ,body)
      (lambda ,xfrm 
        ,@(map (lambda (frm x) `(set! ,frm ,x)) v* xfrm)))))

(define-macro (letrec*-values cls . body) ;; Unused?
  (define (%letrec*-values-collect-frms cls)
    (define (itr cur cls)
      (if (pair? cls)
        (let* ((a (car cls))
               (next (cdr cls))
               (frm (car a)))
          (cond
            ((pair? frm)
             (itr (append frm cur) next))
            (else
              (itr (cons frm cur) next))))
        cur))
    (itr '() cls))
  (define (%letrec*-values-recv cl)
    (let ((frm (car cl))
          (body (cadr cl)))
      (cond
        ((list? frm)
         (let ((xfrm (map gensym frm)))
          `(call-with-values
             (lambda () ,body)
             (lambda ,xfrm 
               ,@(map (lambda (f x) `(set! ,f ,x)) frm xfrm)))))
        (else
          (let ((xfrm (gensym frm)))
           `(call-with-values
              (lambda () ,body)
              (lambda ,xfrm
                (set! ,frm ,xfrm))))))))
  (define frms (%letrec*-values-collect-frms cls))
  `(let ()
    ,@(map (lambda (x) `(define ,x "undefined-letrec*-values")) frms)
    ,@(map %letrec*-values-recv cls)
    (begin ,@body)))


#|
;; FIXME: R7RS define-values would not work here.. (find out why.)

(define-syntax %letrec*-values/emit*set!
  (syntax-rules ()
    ((_ () () . body)
     ;; Term
     (let () . body))
    ((_ (((var temp) ...) . next-vars) (((cvar ...) init) . next-cls) . body)
     ;; Loop
     (call-with-values
       (lambda () init)
       (lambda (temp ...)
         (set! var temp)
         ...
         (%letrec*-values/emit*set! next-vars next-cls . body))) )
    ((_ ((var temp) . next-vars) ((cvar init) . next-cls) . body)
     ;; Loop
     (call-with-values
       (lambda () init)
       (lambda temp
         (set! var temp)
         (%letrec*-values/emit*set! next-vars next-cls . body))))))

(define-syntax %letrec*-values/emit*locs
  (syntax-rules ()
    ((_ () body) body)
    ((_ (((var temp) ...) . next) body)
     (let* ((var "letrec*-values-temp") ...) 
      (%letrec*-values/emit*locs next body)))
    ((_ ((var temp) . next) body)
     (let ((var "letrec*-values-temp")) 
      (%letrec*-values/emit*locs next body)))))

(define-syntax %letrec*-values/emit
  (syntax-rules ()
    ((_ var+temp* cls* . body)
     (%letrec*-values/emit*locs
       var+temp*
       (%letrec*-values/emit*set!
         var+temp* cls* . body)))))

(define-syntax %letrec*-values/gentemp*list
  (syntax-rules ()
    ((_ acc () up next orig . body)
     ;; Term
     (%letrec*-values/gentemp (acc . up) next orig . body))
    ((_ (cur ...) (var . varnext) up next orig . body)
     ;; Loop
     (%letrec*-values/gentemp*list
       (cur ... (var %temp))
       varnext up next orig . body))))

(define-syntax %letrec*-values/gentemp
  (syntax-rules ()
    ((_ acc () orig . body)
     (%letrec*-values/emit acc orig . body))
    ((_ acc ((vars ...) . next) orig . body)
     (%letrec*-values/gentemp*list () (vars ...) acc next orig . body))
    ((_ acc (var . next) orig . body)
     (%letrec*-values/gentemp ((var %temp) . acc) next orig . body))))

(define-syntax %letrec*-values/reqtemp ;; FIXME: merge to /gentemp
  (syntax-rules ()
    ((_ temps () orig . body)
     ;; Term
     (%letrec*-values/gentemp () temps orig . body))
    ((_ temps ((var init) . next) orig . body)
     ;; Loop
     (%letrec*-values/reqtemp
       (var . temps)
       next
       orig
       . body))))

(define-syntax letrec*-values
  (syntax-rules ()
    ((_ () . body) ;; short cut
     (let () . body))
    ((_ (cls ...) . body)
     (%letrec*-values/reqtemp () (cls ...) (cls ...) . body))))
|#
