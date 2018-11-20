(defn make-key [x y z]
  (.. x ":" y ":" z))

(defn tile-store []
  (local self {})

  (set self.data {})

  (set self.minx 0)
  (set self.maxx 0)
  (set self.miny 0)
  (set self.maxy 0)
  (set self.minz 0)
  (set self.maxz 0)

  (defn self.update-bounds [x y z]
    (when (> x self.maxx)
      (set self.maxx x))
    (when (< x self.minx)
      (set self.minx x))

    (when (> y self.maxy)
      (set self.maxy y))
    (when (< y self.miny)
      (set self.miny y))

    (when (> z self.maxz)
      (set self.maxz z))
    (when (< z self.minz)
      (set self.minx z)))

  (defn self.get-tile [x y z]
    (. self.data (make-key x y z)))

  (defn self.set-tile [x y z data]
    (tset self.data (make-key x y z) data)
    (when data
      (self.update-bounds x y z)))

  self)
