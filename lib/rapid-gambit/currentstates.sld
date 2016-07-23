(define-library (rapid-gambit currentstates)
                (export currentstate-libpath-set!
                        currentstate-libpath)
                (import (scheme base)
                        (rapid primitive))
                (begin
;;
(define-primitive currentstate-libpath-set! '%%rapid-gambit-libpath-set!)
(define-primitive currentstate-libpath '%%rapid-gambit-libpath)
                  
))
