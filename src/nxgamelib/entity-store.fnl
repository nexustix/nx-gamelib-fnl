(defn entity-store []
  (local self {})
  (set self.entities {})
  (var counter 0)

  (defn update-counter [id]
    (when (> id counter)
      (set counter id)))

  (defn self.add-entity [entity]
    (set counter (+ counter 1))
    (tset self.entities counter entity)
    counter)

  (defn self.get-entity [id]
    (. self.entities id)))
