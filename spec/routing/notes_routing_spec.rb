require 'spec_helper'

describe NotesController do

  describe 'routing' do

    it 'routes to notes#index' do
      expect(get('/')).to route_to('notes#index')
    end

    it 'routes to notes#create' do
      expect(post('/notes')).to route_to('notes#create')
    end

    it 'routes to notes#destroy' do
      expect(delete('/notes/1')).to route_to('notes#destroy', id: '1')
    end
  end

  describe 'route helpers' do

    it 'root_path' do
      expect(root_path).to eq('/')
    end

    it 'notes_path' do
      expect(notes_path).to eq('/notes')
    end

    it 'note_path' do
      expect(note_path(1)).to eq('/notes/1')
    end
  end
end
