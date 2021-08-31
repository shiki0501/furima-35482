require 'rails_helper'

RSpec.describe DeliveryBuy, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @delivery_buy = FactoryBot.build(:delivery_buy, user_id: user.id, item_id: item.id)
      sleep 0.5
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@delivery_buy).to be_valid
      end
      it 'building_name は空でも保存できること' do
        @delivery_buy.building_name = ''
        expect(@delivery_buy).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空だと保存できないこと' do
        @delivery_buy.token = ''
        @delivery_buy.valid?
        expect(@delivery_buy.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @delivery_buy.postal_code = ''
        @delivery_buy.valid?
        expect(@delivery_buy.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにでは(-)がないと保存できないこと' do
        @delivery_buy.postal_code = '8700958'
        @delivery_buy.valid?
        expect(@delivery_buy.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'shipping_area_idが空だと保存できないこと' do
        @delivery_buy.shipping_area_id = ''
        @delivery_buy.valid?
        expect(@delivery_buy.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'shipping_area_idが1だと保存できないこと' do
        @delivery_buy.shipping_area_id = '1'
        @delivery_buy.valid?
        expect(@delivery_buy.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @delivery_buy.address = ''
        @delivery_buy.valid?
        expect(@delivery_buy.errors.full_messages).to include("Address can't be blank")
      end
      it 'tellが空だと保存できないこと' do
        @delivery_buy.tell = ''
        @delivery_buy.valid?
        expect(@delivery_buy.errors.full_messages).to include("Tell can't be blank")
      end
      it 'tellは11桁以内の数値でないと保存できないこと' do
        @delivery_buy.tell = '080-8656-3453'
        @delivery_buy.valid?
        expect(@delivery_buy.errors.full_messages).to include('Tell is invalid.Only numbers within 11 digits can be saved')
      end
      it 'tellは9桁以下の数値では保存できないこと' do
        @delivery_buy.tell = '080-8656-34'
        @delivery_buy.valid?
        expect(@delivery_buy.errors.full_messages).to include('Tell is invalid.Only numbers within 11 digits can be saved')
      end
      it 'tellは12桁以上の数値では保存できないこと' do
        @delivery_buy.tell = '080-8656-345353'
        @delivery_buy.valid?
        expect(@delivery_buy.errors.full_messages).to include('Tell is invalid.Only numbers within 11 digits can be saved')
      end
      it 'user_idが紐ついてないと保存できないこと' do
        @delivery_buy.user_id = ''
        @delivery_buy.valid?
        expect(@delivery_buy.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐ついてないと保存できないこと' do
        @delivery_buy.item_id = ''
        @delivery_buy.valid?
        expect(@delivery_buy.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end