(ns dev.singleton)

(defonce singleton-stack (atom []))

(defn stack-value []
  @singleton-stack)

(defn stack-push [element]
  (swap! singleton-stack #(conj % element)))

(defn stack-pop []
  (swap! singleton-stack #(pop %)))

(stack-value)
(stack-push 2)
(stack-value)
(stack-pop)

;; Singleton pattern is often implemented with Integrant library
