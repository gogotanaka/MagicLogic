module MagicLogic
  module Utils
    def neg?(p)
      (is_neg? && self.p == p) || (p.is_neg? && p.p == self)
    end

    def is_neg?
      is_a?(NEG)
    end

    def is_form?(ope=nil)
      return is_a?(FORM) && self.ope == ope if ope
      is_a?(FORM)
    end

    def is_or?
      is_form?(:+)
    end

    def is_and?
      is_form?(:*)
    end

    def include?(p)
      false
    end
  end
end
