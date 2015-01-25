require 'minitest_helper'
include MagicLogic
class TestMagicLogic < MiniTest::Unit::TestCase
  $p = P['P']
  $q = P['Q']
  $r = P['R']

  def test_basis
    assert_to_s "P"               , $p
    assert_to_s "(P|Q)"           , $p + $q
    assert_to_s "(P&Q)"           , $p * $q
    assert_to_s "~P"              , ~$p
    assert_to_s "(~P|Q)"          , $p >= $q
    assert_to_s "((~P|Q)&(~Q|P))" , $p <=> $q
  end

  def test_tautology
    assert_dpll true , ~(~$p) >= $p
    assert_dpll true , ($p * ($p >= $q)) >= $q
    assert_dpll true , (($p >= $q) * ($q >= $r)) >= ($p >= $r)
    assert_dpll true , (~$p * ($p + $q)) >= ($q)
    assert_dpll true , (($p >= $q) * ($q >= $r) * $p) >= ($r)
    assert_dpll true , ($p * ~$p) >= $r
  end

  def test_no_tautology
    assert_dpll false , $p * $q * ~$p
    assert_dpll false , ~$p * (~$p >= $p)
  end

  def test_prolog
    assert_equal "TRUE"        , [$p] >> $p
    assert_equal "TRUE"        , [$p >= $q, $q >= $r] >> ($p >= $r)
    assert_equal "UNDECIDABLE" , [$p] >> $q
  end
end
