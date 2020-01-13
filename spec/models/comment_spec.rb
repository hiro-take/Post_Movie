require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid ' do
        expect(build(:comment)).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without text' do
        comment = build(:comment, text: nil)
        comment.valid?
        expect(comment.errors[:text]).to include("を入力してください")
      end

      it 'is invaid without user_id' do
        comment = build(:comment, user_id: nil)
        comment.valid?
        expect(comment.errors[:user]).to include("を入力してください")
      end


      it 'is invaid without movie_id' do
        comment = build(:comment, movie_id: nil)
        comment.valid?
        expect(comment.errors[:movie]).to include("を入力してください")
      end

    end
  end
end