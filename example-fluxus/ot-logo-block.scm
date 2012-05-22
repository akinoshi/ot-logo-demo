; File: ot-logo-block.scm
; -----------------------
; This is a fluxus demo script to show
; how to create OpenLabTaipei new logo
; using (load-primitive) and (active-mesh)
; functions. The obj file is created
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
; Date: Wed May  9 23:09:23 CST 2012

(clear)

(collisions 1)

#;(with-state
    (hint-none)
    (backfacecull 0)
    (hint-wire)
    (wire-colour (vector 0 0 0))
    (rotate (vector 90 0 0))
    (translate (vector 0 0 -0.5))
    (scale 11)
    (build-seg-plane 11 11))

(light-diffuse 0 (vector 0 0 0))
(let ((l (make-light 'point 'free)))
    (light-position l (vector 10 100 10))
    (light-diffuse l (vector 1 1 1))
    (light-ambient l (vector 0.2 0.2 0.2))
    (shadow-light l))

(gravity (vector 0 -1 0))
(ground-plane (vector 0 1 0) 0)
(with-state
    (rotate (vector 90 0 0))
    (scale 50)
    (build-plane))

(define cube-pos '(
#(-3 0 0) #(-2 0 0) #(-2 0 -2) #(-1 0 -2)
#(1 0 -2) #(2 0 -1) #(3 0 0) #(-2 0 2)))

(define (setup-cube ls)
    (for-each (lambda (x)
        (with-state
            (colour (vector 1 0 0))
            (hint-cast-shadow)
            (translate x)
            (active-box (build-cube))))
    ls))

(setup-cube cube-pos)

(define tri-pos '(
#(-3 0 -1) #(-1 0 0) #(-1 0 -1) #(0 0 -2)
#(0 0 1) #(-1 0 2) #(1 0 0) #(3 0 -2)))

(define (setup-tri ls)
    (for-each (lambda (x)
        (with-state
            (colour (vector 0 1 0))
            (hint-cast-shadow)
            (translate x)
            (scale 0.5)
            (active-mesh (load-primitive "t-cube.obj"))))
    ls))

(setup-tri tri-pos)

(define tri-rev-pos '(
#(0 0 0) #(-3 0 -2) #(-2 0 -1) #(-2 0 1)
#(-1 0 1) #(1 0 -1) #(2 0 -2)))

(define (setup-tri-rev ls)
    (for-each (lambda (x)
        (with-state
            (colour (vector 0 0 1))
            (hint-cast-shadow)
            (translate x)
            (rotate (vector 0 180 0))
            (scale 0.5)
            (active-mesh (load-primitive "t-cube.obj"))))
    ls))

(setup-tri-rev tri-rev-pos)

(define center (build-cube))
(with-primitive center (hide 1))
(lock-camera center)

(with-primitive center
    (rotate (vector 0 -22.5 0))
    (rotate (vector -60 0 0)))
