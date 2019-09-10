# frozen_string_literal: true

RSpec.describe PhotoTools::Signer do
  subject { PhotoTools::Signer.new(signature_image_path: './spec/data/sig.png') }

  it { expect(subject).to have_attributes(signature_image_path: './spec/data/sig.png') }
  it { expect(subject).to have_attributes(images_to_sign_paths: []) }

  describe '#load_image_to_sign' do
    before do
      subject.load_image_to_sign(image_path: './spec/data/image.jpg')
    end

    it 'should add image to sign' do
      expect(subject).to have_attributes(images_to_sign_paths: ['./spec/data/image.jpg'])
    end
  end

  describe '#sign_image' do
    let!(:signed_image) { subject.sign_image(image_path: './spec/data/image.jpg') }

    it 'should produce object with class MiniMagick::Image' do
      expect(signed_image).to be_an_instance_of(MiniMagick::Image)
    end

    it 'signed image should have different MiniMagick::Image signature' do
      original = MiniMagick::Image.open('./spec/data/image.jpg')
      expect(original.signature).not_to be equal(signed_image.signature)
    end
  end

  describe '#sign_and_write' do
    before do
      subject.load_image_to_sign(image_path: './spec/data/image.jpg')
      subject.sign_and_write(output_dir: './spec/output')
    end

    after(:all) do
      File.delete('./spec/output/image.jpg')
      Dir.rmdir('./spec/output')
    end

    it 'should sign and write image' do
      expect(File.exist?('./spec/output/image.jpg')).to be(true)
    end
  end
end
