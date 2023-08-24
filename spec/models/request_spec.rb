require 'rails_helper'

RSpec.describe Request, type: :model do
  before do
    @request = FactoryBot.build(:request)
  end

  describe '予約の保存' do
    context '予約ができる場合' do
      it '件名、希望日時、カテゴリー、主訴、希望時間、派遣先住所があれば投稿できる' do
        expect(@request).to be_valid
      end
    
    end
    context '予約ができない場合' do
      it '件名が空では投稿できない' do
        @request.title = ''
        @request.valid?
        expect(@request.errors.full_messages).to include("Title can't be blank")
      end     

      it '希望日時が空では投稿できない' do
        @request.date = ''
        @request.valid?
        expect(@request.errors.full_messages).to include("Date can't be blank")
      end 

      it 'カテゴリーが空では投稿できない' do
        @request.category = Category.find_by(id: 1)
        @request.valid?
        expect(@request.errors.full_messages).to include("Category can't be blank")
      end 


      it '主訴が空では投稿できない' do
        @request.description = ''
        @request.valid?
        expect(@request.errors.full_messages).to include("Description can't be blank")
      end 

      it '希望時間が空では投稿できない' do
        @request.expected_length = ''
        @request.valid?
        expect(@request.errors.full_messages).to include("Expected length can't be blank")
      end 

      it '派遣先住所が空では投稿できない' do
        @request.expected_length = ''
        @request.valid?
        expect(@request.errors.full_messages).to include("Expected length can't be blank")
      end 

      it 'ユーザーが紐付いていなければ投稿できない' do
        @request.user = nil
        @request.valid?
        expect(@request.errors.full_messages).to include('User must exist')
      end
    end
  end
end
