# frozen_string_literal: true

require 'photo_tools/version'
require 'mini_magick'

module PhotoTools
  Error = Class.new(StandardError)

  # Class for creating signature over image
  class Signer
    include MiniMagick

    attr_reader :signature_image_path, :images_to_sign_paths

    def initialize(signature_image_path:)
      @signature_image_path = signature_image_path
      @images_to_sign_paths = []
    end

    def load_image_to_sign(image_path:)
      @images_to_sign_paths << image_path
    end

    def sign_and_display
      # take first image, sign and display
      image_path = @images_to_sign_paths.first
      signed = sign_image(image_path: image_path)
      system("display #{signed.path}")
    end

    def sign_and_write(output_dir: 'output')
      # take first image, sign and save
      image_path = @images_to_sign_paths.first
      signed = sign_image(image_path: image_path)
      Dir.mkdir(output_dir) unless Dir.exist?(output_dir)
      signed.write("./#{output_dir}/#{image_path.split('/').last}")
    end

    def sign_image(image_path:)
      signature_image = Image.open(@signature_image_path)
      image = Image.open(image_path)
      result = image.composite(signature_image) do |c|
        c.compose 'Over'
        c.geometry '+80+80'
        c.gravity 'SouthEast'
      end
      result
    end
  end
end
