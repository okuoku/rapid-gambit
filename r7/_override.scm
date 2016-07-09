(define-macro (with-r7-override . body)
  (define override
    '(;; base
      (raise raise:r7)
      (with-exception-handler with-exception-handler:r7)
      (string-copy string-copy:r7)
      ;; process-context
      (exit exit:r7)
      ;; eval
      (eval eval:r7)
      ))
  `(let ,override ,@body))

(define (%%inject-r7-override form)
  (define override
    '(;; base
      (raise raise:r7)
      (with-exception-handler with-exception-handler:r7)
      (string-copy string-copy:r7)
      ;; process-context
      (exit exit:r7)
      ;; eval
      (eval eval:r7)
      ))
  `(let ,override ,form))
