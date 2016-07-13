(define char-foldcase char-downcase)
(define (string-foldcase str) (string-map char-foldcase str))
