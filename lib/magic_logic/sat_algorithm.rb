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
      def sbst!(num, bool)
        gsub!(/#{ATOM_PREFIX}#{num}/, bool.to_s)
      end
    end

    def dpll
      count = $atoms.count
      rslt = (1 .. 2 ** count).map do |i|
        s = evl
        count.times { |j| s.sbst!(j, (i >> j) & 1 == 1)  }
        eval(s) rescue binding.pry
      end
      case rslt.uniq
      when [true]  then true
      when [false] then false
      else              self
      end
    end
  end
end
