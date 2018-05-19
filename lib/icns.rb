# frozen_string_literal: true

require 'icns/version'
require 'icns/reader'

module Icns
  # Map of type names to pixel sizes
  TYPE_TO_SIZE = {
    # 32×32 1-bit mono icon
    'ICON' => 32,

    # 32×32 1-bit mono icon with 1-bit mask
    'ICN#' => 32,

    # 16×12 1 bit mono icon with 1-bit mask
    'icm#' => 16,

    # 16×12 4 bit icon
    'icm4' => 16,

    # 16×12 8 bit icon
    'icm8' => 16,

    # 16×16 1-bit mask
    'ics#' => 16,

    # 16×16 4-bit icon
    'ics4' => 16,

    # 16x16 8 bit icon
    'ics8' => 16,

    # 16×16 24-bit icon
    'is32' => 16,

    # 16x16 8-bit mask
    's8mk' => 16,

    # 32×32 4-bit icon
    'icl4' => 32,

    # 32×32 8-bit icon
    'icl8' => 32,

    # 32x32 24-bit icon
    'il32' => 32,

    # 32×32 8-bit mask
    'l8mk' => 32,

    # 48×48 1-bit mask
    'ich#' => 48,

    # 48×48 4-bit icon
    'ich4' => 48,

    # 48×48 8-bit icon
    'ich8' => 48,

    # 48×48 24-bit icon
    'ih32' => 48,

    # 48×48 8-bit mask
    'h8mk' => 48,

    # 128×128 24-bit icon
    'it32' => 128,

    # 128×128 8-bit mask
    't8mk' => 128,

    # 16x16 icon in JPEG 2000 or PNG format
    'icp4' => 16,

    # 32x32 icon in JPEG 2000 or PNG format
    'icp5' => 32,

    # 64x64 icon in JPEG 2000 or PNG format
    'icp6' => 64,

    # 128x128 icon in JPEG 2000 or PNG format
    'ic07' => 128,

    # 256×256 icon in JPEG 2000 or PNG format
    'ic08' => 256,

    # 512×512 icon in JPEG 2000 or PNG format
    'ic09' => 512,

    # 1024×1024 in 10.7 (or 512x512@2x "retina" in 10.8) icon in JPEG 2000 or
    # PNG format
    'ic10' => 1024,

    # 16x16@2x "retina" icon in JPEG 2000 or PNG format
    'ic11' => 32,

    # 32x32@2x "retina" icon in JPEG 2000 or PNG format
    'ic12' => 64,

    # 128x128@2x "retina" icon in JPEG 2000 or PNG format
    'ic13' => 256,

    # 256x256@2x "retina" icon in JPEG 2000 or PNG format
    'ic14' => 512
  }.freeze

  # Types to try for each size
  SIZE_TO_TYPE = {
    16 => %w[icp4],
    32 => %w[icp5 ic11],
    64 => %w[icp6 ic12],
    128 => %w[ic07],
    256 => %w[ic08 ic13],
    512 => %w[ic09 ic14],
    1024 => %w[ic10]
  }.freeze
end
