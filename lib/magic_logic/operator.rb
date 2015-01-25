module MagicLogic
  module Operator
    [:+, :*].each do |ope|
      define_method(ope) do |q|
        Node.new(self, ope, q)
      end
    end

    def ~@
      Neg.new(self)
    end

    def >=(q)
      (~self + q)
    end

    def <=>(q)
      (self >= q) * (q >= self)
    end
  end
end
