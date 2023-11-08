#lang racket

(define alphabet '(#\A #\B #\C #\D #\E #\F #\G #\H #\I #\J #\K #\L #\M #\N #\O #\P #\Q #\R #\S #\T #\U #\V #\W #\X #\Y #\Z))

;; Recursive function that passes the list, the value to search for, the index and the lst-len (for lazy evaluation)
;; every iteration as long as the value is not already found and the index is not outside the list
(define (search-list lst v index lst-len)
    (cond
        [(> index (- lst-len 1)) #f] ;; Return false if the index is outside the list -> value could not be found
        [(equal? (list-ref lst index) v) index] ;; Return the value when the list element at "index" equals the value to search for
        [else (search-list lst v (+ index 1) lst-len)])) ;; Recurse if no event occured by adding 1 to the index and repeating

;; Initiates the "search-list"-function at index 0 while only taking the list and the value to search for
;; as arguments to make it easier to use
(define (find-index lst v)
    (search-list lst v 0 (length lst)))


;; Example ;;
(display (string-append "Index of A: " (~v (find-index alphabet #\A)) "\n"))
(display (string-append "Index of M: " (~v (find-index alphabet #\M)) "\n"))
(display (string-append "Index of Z: " (~v (find-index alphabet #\Z)) "\n"))
(display (string-append "Index of &: " (~v (find-index alphabet #\&)) "\n"))