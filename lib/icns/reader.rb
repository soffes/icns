# frozen_string_literal: true

require 'icns/errors'

module Icns
  class Reader
    # Initialize with a path to a valid ICNS file
    def initialize(path)
      throw FileNotFound unless File.exists?(path)

      @path = path
      @parts = {}

      read_metadata
    end

    # Available types
    def types
      @parts.keys
    end

    # Raw data for a type
    def data_for_type(type)
      return nil unless part = @parts[type.to_s]

      File.open(@path) do |file|
        # Seek to the image data position
        file.pos = part[:offset]

        # Read the length of the image data
        file.read(part[:length])
      end
    end

    # PNG or JPEG-2000 data for a size
    def image_for_size(size)
      return nil unless types = SIZE_TO_TYPE[size.to_i]

      data = nil
      types.each do |type|
        break if data = data_for_type(type)
      end

      data
    end

    # Available image sizes
    def sizes
      types = SIZE_TO_TYPE.values.flatten
      @parts.keys.select { |k| types.include?(k) }.
        map { |k| TYPE_TO_SIZE[k] }.sort.uniq
    end

    private

    # These types are just metadata and not images.
    TYPES_BLACKLIST = [
      # An optional table of contents
      'TOC ',

      # 4-byte big endian float - equal to the bundle version number of Icon
      # Composer.app that created to icon
      'icnV'
    ].freeze

    def read_metadata
      # TODO: Parse `TOC ` part if available

      File.open(@path) do |file|
        # The first 4 bytes must be 'icns'
        throw InvalidHeader unless file.read(4) == 'icns'

        # The next 4 bytes are the total length of the file. Skip ahead.
        file.pos += 4

        # Keep reading until we hit the end
        while true
          # If we can't read the icon type and length, we’re at the end
          break unless (type = file.read(4)) && (length = file.read(4))

          # Convert the length into an integer. The length includes the icon
          # header. We just want the length of the image data.
          length = length.unpack('N')[0] - 8

          unless TYPES_BLACKLIST.include?(type)
            # Add to our hash of type name to image data locations
            puts "WARNING: duplicate part '#{type}'" if @parts[type]
            @parts[type] = { offset: file.pos, length: length }
          end

          # Advance past the image data
          file.pos += length
        end
      end
    end
  end
end
