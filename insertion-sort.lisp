#|

These are comments?

|#

(defmacro while (test &body body)
  `(do ()
       ((not ,test))
     ,@body))

(defun insertion-sort (array)
  "like Cormen, we make a horrible destructive sort, assumes a single dimension array of numbers"
  (let ((length (1- (array-dimension array 0))))
    (do* ((index 1 (1+ index))
	  (key (aref array index) (unless (> index length) (aref array index))))
	 ((> index length) array)
      (let ((i (1- index)))
	(while (and (>= i 0)
		    (> (aref array i) key))
	  (setf (aref array (+ i 1)) (aref array i))
	  (decf i))
	(setf (aref array (+ i 1)) key)))))
