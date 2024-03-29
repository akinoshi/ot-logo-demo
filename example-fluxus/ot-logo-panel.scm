; File: ot-logo-panel.scm
; -----------------------
; This is a fluxus demo script to show
; how to create OpenLabTaipei new logo
; using (build-seg-plane) and (active-box)
; functions.
;
; OpenLabTaipei
; http://www.openlabtaipei.org/
;
; (fluxus)
; http://www.pawfal.org/fluxus/
;
; Author: Akinori Kinoshita
; E-mail: art.akinoshi -at- gmail.com
; Date: Wed May  9 22:48:29 CST 2012

(clear)

(gravity (vector 0 0 0))

(define tri-list '())

(define remove-list '(
 54  55  57  58
 72  73  74  76  77  78  80  81
 95  96  99 101 102 103
119 120 125
143 144 146 147
166 167 168
186 187 191
))

(define dummy
    (with-state
        (hint-none)
        (hint-wire)
        (wire-colour (vector 0 1 0))
        (rotate (vector 0 0 22.5))
        (scale 10)
        (build-seg-plane 11 11)))

(with-primitive dummy
    (for ((i (in-range (quotient (pdata-size) 4))))
        (let ((p0 (pdata-ref "p" (* i 4)))
              (p1 (pdata-ref "p" (+ (* i 4) 1)))
              (p2 (pdata-ref "p" (+ (* i 4) 2)))
              (p3 (pdata-ref "p" (+ (* i 4) 3))))
            (set! tri-list (cons (build-polygons 3 'triangle-list) tri-list))
            (with-primitive (car tri-list)
                (pdata-set "p" 0 p0)
                (pdata-set "p" 1 p1)
                (pdata-set "p" 2 p2)
                (recalc-normals 0))
            (set! tri-list (cons (build-polygons 3 'triangle-list) tri-list))
            (with-primitive (car tri-list)
                (pdata-set "p" 0 p0)
                (pdata-set "p" 1 p2)
                (pdata-set "p" 2 p3)
                (recalc-normals 0)))))

(map (lambda (x) (with-primitive x
    (scale 10)
    (hint-unlit)
    (hint-wire)
    (backfacecull 0)
    (wire-colour (vector 0 0 0))
    (line-width 2)))
    tri-list)

(spawn-timed-task
    (+ (time-now) 1) (lambda ()
	(for-each (lambda (x)
    		(active-box (+ (car (reverse tri-list)) x))
    		(twist (+ (car (reverse tri-list)) x) (vmul (grndvec) 0.1))
    		(kick (+ (car (reverse tri-list)) x) (vmul (grndvec) 0.1)))
    	remove-list)))

(destroy dummy)

(define frame (build-pixels 100 100))

(with-primitive frame
    (scale 15)
    (translate (vector -0.5 -0.5 0.01))
    (pixels-clear (vector 1 1 1 0.01))
    (pixels-circle (vector 50 50 0) 30 (vector 0 0 0 1))
    (pixels-upload))

(with-primitive frame
    (pdata-map! (lambda (c)
        (if (= (vx c) 1.0)
            (vector 0 0 0 1)
            (vector 0 0 0 0.0001)))
        "c"))

(define center (build-cube))
(with-primitive center (hide 1))
(lock-camera center)
(with-primitive center
    (rotate (vector 0 0 -22.5))
    (rotate (vector 45 0 0)))
