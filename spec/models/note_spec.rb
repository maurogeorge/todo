require 'spec_helper'

describe Note do

  describe 'validations' do

    it { should validate_presence_of(:content) }
  end
end
