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

  describe "POST 'create'" do

    context 'with valid params' do

      let(:params) do
        { note: attributes_for(:note) }
      end

      it 'creates a new note' do
        expect do
          post :create, params
        end.to change(Note, :count).by(1)
      end

      it 'assigns a newly @note' do
        post :create, params
        expect(assigns(:note)).to be_a(Note)
      end

      it 'persists @note' do
        post :create, params
        expect(assigns(:note)).to be_persisted
      end

      it 'redirects to notes path' do
        post :create, params
        should redirect_to(root_path)
      end

      it 'sets the flash correctly' do
        post :create, params
        should set_the_flash[:notice].to(/sucesso/)
      end
    end

    context 'with invalid params' do

      let(:params) do
        { note: attributes_for(:note, content: '') }
      end

      it 'does not create a new note' do
        expect do
          post :create, params
        end.to_not change(Note, :count)
      end

      it 'assigns @note with a new one' do
        post :create, params
        expect(assigns(:note)).to be_a_new(Note)
      end

      it "re-renders the 'index' template" do
        post :create, params
        should render_template('index')
      end

      it 'assigns all notes' do
        note = create(:note)
        post :create, params
        expect(assigns(:notes)).to include(note)
      end
    end
  end
end
