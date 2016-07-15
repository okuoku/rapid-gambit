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
	(rapid compiler))

(define (write-filtered x port)
  ;; https://github.com/okuoku/yuni/issues/45
  (define (check-sibr-xx)
    (let* ((v0 (vector))
           (v1 (vector-copy v0)))
      (eq? v0 v1)))
  (define (write-r5rssafe obj port)
    (define (filt-wrt obj)
      (cond
        ((and (char? obj) (char=? #\escape obj))
         (display "#\x1b" port))
        (else
          (write obj port))))
    (define (pr obj)
      (filt-wrt obj)
      (display " " port))
    (define (dotted-pr obj)
      (define (itr obj)
        (let ((a (car obj))
              (d (cdr obj)))
          (cond
            ((pair? d)
             (filt-wrt a)
             (display " " port)
             (itr d))
            (else
              (filt-wrt a)
              (display " . " port)
              (filt-wrt d)))))
      (display " (")
      (itr obj)
      (display " )" port))
    (cond 
      ((list? obj)
       (display " (" port)
       (for-each pr obj)
       (display ")" port))
      ((pair? obj) ;; dotted-list or just a pair
       (dotted-pr obj))
      ((vector? obj)
       (display "#(" port)
       (vector-for-each pr obj)
       (display ")" port))
      (else (write-simple obj port))))

  (define do-write (if (check-sibr-xx) write-r5rssafe write-shared))
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
      ((vector? obj) (list 'quote (vector-copy obj)))
      ((string? obj) (string-copy obj))
      (else obj)))
  (do-write (xmap x) port))

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
  (emit-bug-reporting-address))

(define output-filename #f)
(define eval-now! #f)

(define (open-output-file/force fn)
  (when (file-exists? fn)
    (delete-file fn))
  (open-output-file fn))

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
			    (version-etc "rapid-compiler")
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

