;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname HW3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;exercise 1.21
(define product
	(lambda (sos1 sos2)
		(cond ((null? sos1) '())
			(else (append (product-symbol (car sos1) sos2)
				(product (cdr sos1) sos2))))))

(define product-symbol
	(lambda (sym lst)
		(cond ((null? lst) '())
			(else (cons (list sym (car lst))
				(product-symbol sym (cdr lst)))))))
                            
           
(product '(x y z) '(a b))
     
    
;exercise 1.22
(define filter-in
  (lambda (var lst)
    (if (null? lst)
        '()
        (if (var(car lst))
            (cons (car lst)
                  (filter-in var (cdr lst)))
        (filter-in var (cdr lst))))))

(filter-in number? '(a 2 (1 3) b 7)) '(2 7)
(filter-in symbol? '(a 2 (1 3) b 7)) '(2 7)
                         
;exercise 1.23
(define list-index
  (lambda (var lst index)
    (if (null? lst)
        #f
        (if (var(car lst))
            index
            (list-index var (cdr lst) (+ index 1))))))

(list-index number? '(a 2 (1 3) b 7) 0)
(list-index symbol? '(1 (1 3) foo 7) 1)
                  
