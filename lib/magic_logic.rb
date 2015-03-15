require "magic_logic/base"

module MagicLogic
  class Atom < Struct.new(:obj)
    include Base

    def to_s
      obj.to_s
    end
  end

  class Neg < Struct.new(:p)
    include Base

    def to_s
      "~#{p}"
    end
  end

  class Node < Struct.new(:l, :ope, :r)
    include Base

    def to_s
      "(#{l}#{ope == :+ ? '|' : '&'}#{r})"
    end
  end
end
include MagicLogic

class ::Array
  def >>(con)
    case (inject(:*) >= con).dpll
    when true  then 'TRUE'
    when false then 'FALSE'
    else            'UNDECIDABLE'
    end
  end
end

P = Atom
$atoms = []
def Atom.[](x)
  new(x).tap { |p| $atoms << p; $atoms.uniq! }
end
