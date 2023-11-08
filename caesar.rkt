#lang racket

;=====================================================
; Title: Caesar Racket Implementation
; Author: Tudor-Sebastian Stuhl
; Date: 08.11.2023
;
; Copyright: Copyright 2023 Tudor-Sebastian Stuhl
; License: Apache-2.0
; Version: 1.0
;
; Maintainer: Tudor-Sebastian Stuhl
; E-Mail: tudor-sebastian.stuhl@gyloh.hamburg.de
;=====================================================

;; Shortcode for modulo
(define % modulo)

;; Define the supported alphabet as a list of characters to find the index for certain characters and vice versa
(define alphabet '(#\A #\B #\C #\D #\E #\F #\G #\H #\I #\J #\K #\L #\M #\N #\O #\P #\Q #\R #\S #\T #\U #\V #\W #\X #\Y #\Z))
;; Define the length of the alphabet here to enable lazy evaluation since it would otherwise be evaluated multiple times in this code
(define alph-len (length alphabet))

;; Functor that decomposes a string to a char-list with uppercase letters
(define (dec-str str)
    (string->list (string-upcase str)))

;; Monad that converts a character to it's position in the alphabet, shifts that number by the shift-index and converts it then back
;; to a character if the original character is a member of the alphabet list. Otherwise, the function does nothing to the character.
;; The new character's index is calculated modulo the alphabet length to start at the other side of the alphabet in case Z or A are surpassed.
(define (find-val char shift)
    (cond 
        [(list? (member char alphabet)) (list-ref alphabet (% (+ (index-of alphabet char) shift) alph-len))]
        [else char]))

;; Curried function that enables the definition of a function containing a set string which then takes a shift-index.
(define shift
    (lambda (str)
        (lambda (shift-index) ;; Monad
            ;; Define "char-list" by applying "dec-str" to the string to enable lazy evaluation
            (define char-list (dec-str str))
            ;; Map the "find-val"-function to all the values in "char-list" using a list of it's length containing the shift index repeatedly
            ;; and then convert the result back to a string
            (list->string (map find-val char-list (make-list (length char-list) shift-index))))))


;; Example ;;

(define plain "Hello World!")
(define shift-index 3)
(display (string-append "Encrypting " plain " with shift-index " (~v shift-index) "...\n"))

(define encrypt (shift plain))
(define encrypted (encrypt 3))
(display (string-append "Encrypted text: " encrypted "\n"))

;; The decrypt function passes the shift-index through a new function instead of just taking the curried function
;; from (shift encrypted) to be able to form the additive inverse of the shift-index
(define (decrypt shift-index) ((shift encrypted) (- shift-index)))
(define decrypted (decrypt shift-index))
(display (string-append "Decrypted text: " decrypted "\n"))