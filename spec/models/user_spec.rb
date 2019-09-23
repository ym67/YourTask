require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "name、email、passwordのいずれかが空ならバリデーションが通らない" do
    # name無し
    user = User.new(name: '', email: 'test1@example.com', password: 'test111')
    expect(user).not_to be_valid

    # email無し
    user = User.new(name: 'テストユーザ1', email: '', password: 'test111')
    expect(user).not_to be_valid

    # password無し
    user = User.new(name: 'テストユーザ1', email: 'test1@example.com', password: '')
    expect(user).not_to be_valid
  end

  it "name、email、passwordの全てが記載されていればバリデーションが通る" do
    user = User.new(name: 'テストユーザ1', email: 'test1@example.com', password: 'test111')
    expect(user).to be_valid
  end

  it "すでに登録済みのemailで新規登録しようとしてもバリデーションが通らない" do
    user = User.new(name: 'テストユーザ1', email: 'test1@example.com', password: 'test111')
    user.save
    user2 = User.new(name: 'テストユーザ2', email: 'test1@example.com', password: 'tes222')
    expect(user2).not_to be_valid
  end

  it "passwordが6文字以下の場合、バリデーションが通らない" do
    user = User.new(name: 'テストユーザ1', email: 'test1@example.com', password: 'test')
    expect(user).not_to be_valid
  end

  it "passwordが6文字ちょうどか、それ以上の場合、バリデーションが通らない" do
    user = User.new(name: 'テストユーザ1', email: 'test1@example.com', password: '123456')
    expect(user).to be_valid
  end

  it "emailの形式が正しくない場合、バリデーションが通らない" do
    user = User.new(name: 'テストユーザ1', email: 'test1examplecom', password: 'test111')
    expect(user).not_to be_valid
  end
end
