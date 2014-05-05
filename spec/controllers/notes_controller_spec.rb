require 'spec_helper'

describe NotesController do

  describe "GET 'index'" do

    let!(:note) do
      create(:note)
    end

    before do
      get :index
    end

    it { should respond_with(:success) }
    it { should render_template(:index) }
    it { should render_with_layout(:application) }

    it 'assigns all notes' do
      expect(assigns(:notes)).to include(note)
    end
  end
end
