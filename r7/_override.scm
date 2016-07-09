(define-macro (with-r7-override . body)
  (define override
    '(;; base
      (string-copy string-copy:r7)
      ;; process-context
      (exit exit:r7)
      ))
  `(let ,override ,@body))

