require 'spec_helper'

describe NotesController do

  describe 'routing' do

    it 'routes to notes#index' do
      expect(get('/')).to route_to('notes#index')
    end
  end

  describe 'route helpers' do

    it 'root_path' do
      expect(root_path).to eq('/')
    end
  end
end
