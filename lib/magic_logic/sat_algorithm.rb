module MagicLogic
  module SatAlgorithm
    ATOM_PREFIX = "__ATOM__PREFIX__"

    def evl
      case self
      when Taut  then "(true)"
      when UTaut then "(false)"
      when Atom  then "(#{ATOM_PREFIX}#{$atoms.index(self)})"
      when FORM  then "(#{vars.map(&:evl).join(_ ope, '||', '&&')})"
      when NEG   then "(!#{p.evl})"
      end
    end

    class ::String
      def sbst!(num, bool)
        gsub!(/#{ATOM_PREFIX}#{num}/, bool.to_s)
      end
    end

    def dpll
      case self
      when *[Taut, UTaut, Atom]
        self
      else
        #TODO: refactor
        count = $atoms.count
        rslt = (1 .. 2 ** count).map do |i|
          s = evl
          count.times { |j| s.sbst!(j, (i >> j) & 1 == 1)  }
          eval(s)
        end
        case rslt.uniq
        when [true]  then $tout
        when [false] then $utout
        else              self
        end
      end
    end
  end
end
