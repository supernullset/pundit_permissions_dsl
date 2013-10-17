require 'helper'
require 'pundit_permissions_dsl'

class TestPunditPermissionsDSL < MiniTest::Unit::TestCase

  def test_version
    version = PunditPermissionsDSL.const_get('VERSION')

    assert(!version.empty?, 'should have a VERSION constant')
  end

end
