; File: ot-logo-block.scm
; -----------------------
; This is a fluxus demo script to show
; how to create OpenLabTaipei new logo
; using scheme OOP. The obj file is created
; using Blender.
;
; OpenLabTaipei
; http://www.openlabtaipei.org/
;
; (fluxus)
; http://www.pawfal.org/fluxus/
;
; Blender
; http://www.blender.org/
;
; Author: Akinori Kinoshita
; E-mail: art.akinoshi -at- gmail.com
; Date: Sat May 12 10:52:12 CST 2012

(clear)

(blur 0.1)

(require scheme/class)

(with-state
    (hint-none)
    (hint-wire)
    (wire-colour (vector 1 1 1))
    (rotate (vector 0 0 22.5))
    (scale (vector 7 5 0))
    (build-seg-plane 7 5))

(define p1 (build-locator))
(define p2 (build-locator))
(define p3 (build-locator))

(define tri-pos '(
#(-3 1 0) #(0 -1 0) #(-1 0 0) #(-1 1 0)
#(-1 -2 0) #(1 0 0) #(3 2 0) #(0 2 0)
))

(for-each (lambda (p)
    (with-state
        (parent p2)
        (colour (vector 0 1 0))
        (translate p)
        (rotate (vector 90 0 0))
        (scale (vector 0.5 0.05 0.5))
        (load-primitive "t-cube.obj")))
    tri-pos)

(define cube-pos '(
#(-3 0 0) #(-2 0 0) #(-2 -2 0) #(1 2 0)
#(2 1 0) #(3 0 0) #(-2 2 0) #(-1 2 0)
))

(for-each (lambda (p)
    (with-state
        (parent p1)
        (colour (vector 1 0 0))
        (translate p)
        (rotate (vector 90 0 0))
        (scale (vector 1 0.1 1))
        (build-cube)))
    cube-pos)

(define tri-rev-pos '(
#(0 0 0) #(-1 -1 0) #(-2 -1 0) #(1 1 0)
#(-2 1 0) #(-3 2 0) #(2 2 0)
))

(for-each (lambda (p)
    (with-state
        (parent p3)
        (colour (vector 0 0 1))
        (translate p)
        (rotate (vector 90 0 0))
        (rotate (vector 0 180 0))
        (scale (vector 0.5 0.05 0.5))
        (load-primitive "t-cube.obj")))
    tri-rev-pos)

(define spin%
    (class object%
        (init id_)

        (field (id id_))

    (define M 0.8)
    (define K 0.1)
    (define D 0.1)
    (define R 0)
    (define ps 0.0)
    (define vs 0.0)
    (define as 0)
    (define f 0)
    (define theta 0)

    (define/public (update)
        (set! f (* (- K) (- ps R)))
        (set! as (/ f M))
        (set! vs (* D (+ vs as)))
        (set! ps (+ ps vs))
        (set! theta (- ps R)))

    (define/public (get-angle) theta)

    (define/public (set-angle r) (set! R r))

    (super-new)))

(with-primitive p1 (rotate (vector 0 0 22.5)))
(with-primitive p2 (rotate (vector 0 0 22.5)))
(with-primitive p3 (rotate (vector 0 0 22.5)))

(define r1 (make-object spin% 0))
(define r2 (make-object spin% 0))
(define r3 (make-object spin% 0))

(send r1 set-angle 360)
(send r2 set-angle 360)
(send r3 set-angle 360)

(every-frame (begin
    (send r1 update)
    (with-primitive p1
        (rotate (vector (send r1 get-angle) 0 0)))
    (send r2 update)
    (with-primitive p2
        (rotate (vector 0 (send r2 get-angle) 0)))
    (send r3 update)
    (with-primitive p3
        (rotate (vector 0 0 (send r3 get-angle))))))
