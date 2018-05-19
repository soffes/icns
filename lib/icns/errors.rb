# frozen_string_literal: true

module Icns
  class Error < StandardError; end

  class FileNotFound < Error; end
  class InvalidHeader < Error; end
end
