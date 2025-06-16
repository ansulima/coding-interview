require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:result) { JSON.parse(response.body) }

  let!(:company_1) { create(:company) }
  let!(:company_2) { create(:company) }
  let!(:user_c1) { create(:user, company: company_1, username: 'anderson_freitas1') }
  let!(:user_c2) { create(:user, company: company_2, username: 'anderson_freitas2') }

  describe "#index" do
    context 'buscando todos os usuários de uma empresa' do
      it 'retorna os usuários da empresa' do
        get company_users_path(company_1)
        
        expect(result.size).to eq(1)
        expect(result.first['id']).to eq(user_c1.id)
      end
    end

    context 'buscando todos os usuários' do
      include_context 'pegando todos os usuários'
      it 'returns all the users' do
        get users_path

        expect(response).to have_http_status(:ok)
        expect(result.size).to eq(6)
      end
    end

    context 'buscando todos os usuários(sem paginacao)' do
      it 'retornando todos os usuários' do
        get users_path

        expect(result.size).to eq(2)
      end
    end
  end
end
