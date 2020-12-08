require 'rails_helper'
 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
   describe 'ユーザー新規登録' do
     it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
      expect(@user).to be_valid
     end
     it "ニックネームが必須であること" do
       @user.nickname = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
     it "メールアドレスが必須であること" do
       @user.email = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
     end
      it "メールアドレスが一意性であること" do
       user = FactoryBot.create(:user, email: "test@co.jp")
       @user.email = user.email
       @user.valid?
       expect(@user.errors.full_messages).to include("Email has already been taken")
      end
      it "メールアドレスは、@を含む必要があること" do
       @user.email = "abc.com"
       @user.valid?
       expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "パスワードが必須であること" do
       @user.password =  ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "パスワードは、6文字以上での入力が必須であること" do
       @user.password = "ttttt"
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
       it "パスワードは、半角数字での入力が必須であること" do
       @user.password = "333333"
       @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
       end
       it "パスワードは、半角英語のみでの入力が必須であること" do
       @user.password = "wwwwwww"
       @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
       end
      it "パスワードは、半角英数字混合での入力が必須であること" do
       @user.password = "abcdef"
       @user.valid?
       expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "パスワード確認用が入力されてない時は登録できない" do
       @user.password =  "test12"
       @user.password_confirmation = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "パスワードとパスワード（確認用）、値の一致が必須であること" do
       @user.password =  "test12"
       @user.password_confirmation = "test11"
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "名字の漢字のカラムが必須であること" do
       @user.first_name =  ""
       @user.valid?
       expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "名字の漢字のカラムが全角であること" do
        @user.first_name =  "a"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
       end
      it "名前の漢字のカラムが必須であること" do
        @user.last_name =  ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
       end
       it "名前の漢字のカラムが全角であること" do
        @user.last_name =  "a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
       end
       it "名字のフリガナのカラムが必須であること" do
        @user.first_name_kana =  ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
       end
       it "名字のフリガナのカラムが全角であること" do
        @user.first_name_kana =  "a"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
       end
       it "名前のフリガナのカラムが必須であること" do
        @user.last_name_kana =  ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
       end
       it "名前のフリガナのカラムが全角であること" do
        @user.last_name_kana =  "a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
       end
       it "生年月日が必須であること" do
        @user.birthday =  ""
        @user.valid?
       expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
   end
 end
