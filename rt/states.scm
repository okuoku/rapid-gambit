;; Exported to YuniFFI runtime
(define %%rapid-gambit-libpath-list '())
(define (%%rapid-gambit-libpath-set! lis)
  (set! %%rapid-gambit-libpath-list lis))
(define (%%rapid-gambit-libpath)
  %%rapid-gambit-libpath-list)
