
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
