require 'test_helper'

class CqlQdmPatientapiTest < ActiveSupport::TestCase
  test "truth" do
    refute_nil CqlQdmPatientapi::VERSION
    assert_kind_of Module, CqlQdmPatientapi
  end
end
