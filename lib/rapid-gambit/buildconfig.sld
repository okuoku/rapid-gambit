(define-library (rapid-gambit buildconfig)
                (export buildconfig-libpath)
                (import (scheme base)
                        (rapid primitive))
                (begin
;;


(define-primitive %%config-install-prefix '%%config-install-prefix)

(define (buildconfig-libpath)
  (list
    (string-append %%config-install-prefix 
                   "/share/rapid-gambit/lib")))
                  
))
