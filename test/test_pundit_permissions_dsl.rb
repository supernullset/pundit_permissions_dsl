require 'helper'
require 'pundit_permissions_dsl'

class TestPunditPermissionsDsl < MiniTest::Unit::TestCase

  def test_version
    version = PunditPermissionsDsl.const_get('VERSION')

    assert(!version.empty?, 'should have a VERSION constant')
  end

end
