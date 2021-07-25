require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できる時' do
      it 'name,description,category_id,status_id,delivery_charge_id,shipping_area_id,shipping_day_id,price,imageが必須であること' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できない時' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      # it 'emailが@を含まなければ登録できない' do
      #   @user.email = 'feed.com'
      #   @user.valid?
      #   expect(@user.errors.full_messages).to include('Email is invalid')
      # end
      # it 'emailが重複した場合は登録できない' do
      #   @user.save
      #   another_user = FactoryBot.build(:user)
      #   another_user.email = @user.email
      #   another_user.valid?
      #   expect(another_user.errors.full_messages).to include('Email has already been taken')
      # end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        # binding.pry
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      # it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      #   @user.password_confirmation = ''
      #   @user.valid?
      #   expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      # end
      it 'status_idが空では登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      # it 'passwordは半角英数字混合での入力がなければ登録できない' do
      #   @user.password = '123456'
      #   @user.password_confirmation = '123456'
      #   @user.valid?
      #   expect(@user.errors.full_messages).to include('Password is invalid')
      # end
      # it 'passwordは半角英字入力のみでは登録できない' do
      #   @user.password = 'qwerty'
      #   @user.password_confirmation = 'qwerty'
      #   @user.valid?
      #   expect(@user.errors.full_messages).to include('Password is invalid')
      # end
      # it 'passwordは全角入力のみでは登録できない' do
      #   @user.password = 'ｑｗｅｒｔｙ'
      #   @user.password_confirmation = 'ｑｗｅｒｔｙ'
      #   @user.valid?
      #   expect(@user.errors.full_messages).to include('Password is invalid')
      # end
      it 'delivery_charge_idが空では登録できない' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      # it 'first_name_kanjiが漢字・ひらがな・カタカナ以外では登録できない' do
      #   @user.first_name_kanji = 'summoon'
      #   @user.valid?
      #   expect(@user.errors.full_messages).to include('First name kanji is invalid')
      # end
      it 'shipping_area_idが空では登録できない' do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      # it 'last_name_kanjiが漢字・ひらがな・カタカナ以外では登録できない' do
      #   @user.last_name_kanji = 'sunmoon'
      #   @user.valid?
      #   expect(@user.errors.full_messages).to include('Last name kanji is invalid')
      # end
      it 'shipping_day_idが空では登録できない' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      # it 'first_name_kanaが全角カタカナ以外では登録できない' do
      #   @user.first_name_kana = 'ぶきよう'
      #   @user.valid?
      #   expect(@user.errors.full_messages).to include('First name kana is invalid')
      # end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが¥300~¥9,999,999の範囲ないでないと登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが半角英数字でないと登録できない' do
        @item.price = '５０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end

# name               { Faker::Name.initials(number: 2) }
# description        { Faker::Lorem.sentence }
# category_id        { Faker::Number.between(from: 2, to: 3) }
# status_id          { Faker::Number.between(from: 2, to: 3) }
# delivery_charge_id { Faker::Number.between(from: 2, to: 3) }
# shipping_area_id   { Faker::Number.between(from: 2, to: 3) }
# shipping_day_id    { Faker::Number.between(from: 2, to: 3) }
# price
