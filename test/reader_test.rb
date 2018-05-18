# frozen_string_literal: true

require 'test_helper'

class ReaderTest < Minitest::Test
  def setup
    super

    path = File.expand_path('../fixtures/Preview.icns', __FILE__)
    @reader = Icns::Reader.new(path)
  end

  def test_types
    types = [
      'is32', 's8mk', 'il32', 'l8mk', 'ic07', 'ic08', 'ic09', 'ic11', 'ic12',
      'ic13', 'ic14', 'ic10'
    ]
    assert_equal types, @reader.types
  end

  def test_image_data_for_type
    refute_nil @reader.image_for_type('is32')
    refute_nil @reader.image_for_type('s8mk')
    refute_nil @reader.image_for_type('il32')
    refute_nil @reader.image_for_type('l8mk')
    refute_nil @reader.image_for_type('ic07')
    refute_nil @reader.image_for_type('ic08')
    refute_nil @reader.image_for_type('ic09')
    refute_nil @reader.image_for_type('ic10')
    refute_nil @reader.image_for_type('ic11')
    refute_nil @reader.image_for_type('ic12')
    refute_nil @reader.image_for_type('ic13')
    refute_nil @reader.image_for_type('ic14')
  end

  def test_image_data_for_size
    refute_nil @reader.data_for_size(32)
    refute_nil @reader.data_for_size(64)
    refute_nil @reader.data_for_size(128)
    refute_nil @reader.data_for_size(256)
    refute_nil @reader.data_for_size(512)
    refute_nil @reader.data_for_size(1024)
  end

  def test_sizes
    assert_equal [32, 64, 128, 256, 512, 1024], @reader.sizes
  end
end
