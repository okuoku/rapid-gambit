; Modified for rapid-gambit


;;; Rapid Scheme --- An implementation of R7RS

;; Copyright (C) 2016 Marc Nieper-Wißkirchen

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(import (rapid base)
	(scheme process-context)
	(scheme write)
        (scheme file)
        (scheme eval)
	(rapid and-let)
	(rapid error)
	(rapid format)
	(rapid args-fold)
	(rapid version-etc)
	(rapid syntax)
	(rapid libraries)
	(rapid compiler)
        (rapid-gambit currentstates)
        (rapid-gambit buildconfig))

(define (write-filtered x port)
  (define (xmap obj)
    (cond
      ((pair? obj)
       (cond
         ;; do not convert quoted vectors
         ((and (eq? (car obj) 'quote)
               (pair? (cdr obj))
               (vector? (cadr obj)))
          obj)
         (else
           (cons (xmap (car obj)) (xmap (cdr obj))))))
      ((vector? obj) (list 'quote obj))
      ((string? obj) (string-copy obj))
      (else obj)))
  (write-shared (xmap x) port))

(define (help)
  (write-string
   (format "Usage: ~a [OPTION] file\n  \
              -o,           output filename\n  \
              -d, --debug   print more information about progress\n  \
              -I, --include prepends a library search directory\n  \
              -h, --help    display this help and exit\n  \
              -v, --version output version information and exit\n"
	   (car (command-line))))
  (newline)
  ;(emit-bug-reporting-address)
  )

(define output-filename #f)
(define eval-now! #f)

(define (open-output-file/force fn)
  (when (file-exists? fn)
    (delete-file fn))
  (open-output-file fn))

;; Add default library paths
(for-each (lambda (l)
            (current-library-directories
              (cons l (current-library-directories))))
          (reverse (buildconfig-libpath)))

(let-values
    (((input)
      (args-fold (cdr (command-line))
		 (list
                  (option '(#\o) #t #f
                          (lambda (option name arg input)
                            (set! output-filename arg)
                            input))
		  (option '(#\d "debug") #f #f
			  (lambda (option name arg input)
			    (current-log-level 'info)
			    input))
		  (option '(#\h "help") #f #f
			  (lambda (option name arg input)
			    (help)
			    (exit)))
		  (option '(#\v "version") #f #f
			  (lambda (option name arg input)
                            (display "Rapid-Gambit:\n")
                            (display "rapid-gambit is based on rapid-scheme [")
                            (display (buildconfig-version/rapid-scheme))
                            (display "]\n")
			    (version-etc "rapid-gambit")
                            (display "Includes Gambit-C http://gambitscheme.org")
			    (exit)))
		  (option '(#\I "include") #t #t
			  (lambda (option name arg input)
			    (current-library-directories
			     (cons arg (current-library-directories)))
			    input)))
		 (lambda (option name arg input)
		   (rapid-error 0 "invalid-option ‘~a’" name)
		   (help)
		   (exit 1))
		 (lambda (operand input)
		   operand)
		 #f)))
 
  (unless input
    (rapid-error 0 "no input file given")
    (help)
    (exit 1))

  (unless output-filename (set! eval-now! #t))

  ;; Save states
  (currentstate-libpath-set! (current-library-directories))

  (and-let*
      ((expanded-program (compile input)))
    (cond
      (eval-now!
        (eval (cadr expanded-program) 
              (environment '(rapid primitive))))
      (else
        (let ((p (or (and output-filename 
                          (open-output-file/force output-filename))
                     (current-output-port))))
          (for-each (lambda (sexp) 
                      (write-filtered sexp p)
                      (when output-filename
                        (newline p)))
                    expanded-program)
          (when output-filename
            (flush-output-port p)
            (close-port p)))
        (unless output-filename (newline))))))

