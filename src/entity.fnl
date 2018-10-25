(defn entity [kind]
  (local self {})
  (set self.kind (or kind "generic")))
