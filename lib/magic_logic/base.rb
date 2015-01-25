require "magic_logic/utils"
require "magic_logic/operator"
require "magic_logic/sat_algorithm"

module MagicLogic
  module Base
    include Operator
    include Utils
    include SatAlgorithm
  end
end
