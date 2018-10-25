(local util {})

(defn util.distance [x0 y0 x1 y1]
  (math.sqrt
    (+
      (^ (- x0 x1) 2)
      (^ (- y0 y1) 2))))


util
