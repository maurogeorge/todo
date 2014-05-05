require 'spec_helper'

describe NotesController do

  describe 'routing' do

    it 'routes to notes#index' do
      expect(get('/')).to route_to('notes#index')
    end

    it 'routes to notes#create' do
      expect(post('/notes')).to route_to('notes#create')
    end
  end

  describe 'route helpers' do

    it 'root_path' do
      expect(root_path).to eq('/')
    end

    it 'notes_path' do
      expect(notes_path).to eq('/notes')
    end
  end
end
