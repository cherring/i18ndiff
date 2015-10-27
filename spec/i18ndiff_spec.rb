require 'spec_helper'

describe I18ndiff do

  let(:old_file) { File.expand_path('../fixtures/old_translations.yml', __FILE__) }
  let(:new_file) { File.expand_path('../fixtures/new_translations.yml', __FILE__) }
  let(:diff) { YAML.load_file(File.expand_path('../fixtures/diff.yml', __FILE__)).to_yaml }

  it "outputs the stuff in the new file that is not in the old file" do
    expect(I18ndiff.convert(old_file, new_file)).to eq(diff)
  end

end
