#lang racket

;;-------------------------------------------------------------------------------
;; Name:Gregory Baumann
;; Pledge:I pledge my honor I have abided by the stevens honor system
;;-------------------------------------------------------------------------------

(define (- A)
  (not A)
  )
(define (n A B)
  (and A B)
  )
(define (u A B)
  (or A B)
  )
(define (> A B)
  (implies A B)
  )
(define (< A B)
  (and (implies A B) (implies B A))
  )

;;Formate

(define test
  '("(a>(b|c))" "-a")
  )

(define (equal-LP? s)
  (if (equal? "(" s) #t
      #f
      )
  )

(define (equal-RP? s)
  (if (equal? ")" s) #t
      #f)
  )

(define (equal-op? s)
  (if (equal? s ">") #t
      (if (equal? s "<") #t
          (if (equal? s "|") #t
              (if (equal? s "&") #t
                  (if (equal? s "-") #t
                      #f)
                  )
              )
          )
      )
  )

(define (equal-car? s)
  (if (equal-op? s) #f
      (if (equal-RP? s) #f
          (if (equal-LP? s) #f
              #t
              )
          )
      )
  )


       
(define (set-up H)
  (cons H (list (set-upHelp (car H))))
  )
(define (set-upHelp H)
  (if (equal? H "") '()
      (if (not (equal-car? (string (string-ref H 0)))) (set-upHelp (substring H 1))
          (cons (list (string (string-ref H 0)) 0) (set-upHelp (substring H 1)))
          )
      )
  )

(define test-set
  (set-up test)
  )

(define (get-char-value H s)
  (get-char-value-help (car (cdr H)) s)
  )
(define (get-char-value-help H s)
  (if (equal? (car (car H)) s) (car (cdr (car H)))
      (get-char-value-help (cdr H) s)
      )
  )
(define (set-char-value H s v)
  (cons (car H) (list (set-char-value-help (car (cdr H)) s v)))
  )
(define (set-char-value-help vL s v)
  (if (equal? vL '()) '()
      (if (equal? (car (car vL)) s) (cons (list s v) (set-char-value-help (cdr vL) s v))
          (cons (car vL) (set-char-value-help (cdr vL) s v))
          )
      )
  )

(define (get-counter H)
  (get-counterHelp (car H) '() '() (car (cdr H)))
  )
(define (get-counterHelp H cL oL vL)
)
