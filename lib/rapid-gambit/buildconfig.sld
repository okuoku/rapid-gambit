(define-library (rapid-gambit buildconfig)
                (export buildconfig-libpath
                        buildconfig-version/rapid-scheme
                        )
                (import (scheme base)
                        (rapid primitive))
                (begin
;;


(define-primitive %%config-install-prefix '%%config-install-prefix)
(define-primitive %%rapid-scheme-version '%%rapid-scheme-version)

(define (buildconfig-libpath)
  (list
    (string-append %%config-install-prefix 
                   "/share/rapid-gambit/lib")))

(define (buildconfig-version/rapid-scheme) %%rapid-scheme-version)
                  
))
