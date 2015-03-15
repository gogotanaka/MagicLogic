module MagicLogic
  module SatAlgorithm
    ATOM_PREFIX = "__ATOM__PREFIX__"

    def evl
      case self
      when Atom  then "(#{ATOM_PREFIX}#{$atoms.index(self)})"
      when Node  then "(#{l.evl}#{ope == :+ ? '||' : '&&'}#{r.evl})"
      when Neg   then "(!#{p.evl})"
      end
    end

    class ::String
      def sbst(bools)
        bools.each.with_index.inject(self) do |str, (bool, i)|
          str.gsub(/#{ATOM_PREFIX}#{i}/, bool.to_s)
        end
      end
    end

    def dpll
      count = $atoms.count
      svl_str = evl
      rslt = (1 .. 2 ** count).map do |i|
        eval(svl_str.sbst (1 .. count).map { |j| (i >> j) & 1 == 1 })
      end
      case rslt.uniq
      when [true]  then true
      when [false] then false
      else              self
      end
    end
  end
end
