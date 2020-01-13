require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid ' do
        expect(build(:movie)).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without content and image' do
        movie = build(:movie, title: nil, description: nil, image: nil, video: nil)
        movie.valid?
        expect(movie.errors[:title]).to include("を入力してください")
      end

      it 'is invaid without user_id' do
        movie = build(:movie, user_id: nil)
        movie.valid?
        expect(movie.errors[:user]).to include("を入力してください")
      end
    end
  end
end