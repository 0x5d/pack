require './data/adapters/mongo/user'

scope do
  test 'validates presence of name' do
    user = Adapters::User.new(email: 'p@ncho.com')
    assert !user.valid?
  end

  test 'validates presence of email' do
    user = Adapters::User.new(name: 'Pancho')
    assert !user.valid?
  end

  test 'validates format of email' do
    user = Adapters::User.new(name: 'Pancho', email: 'not an email')
    assert !user.valid?
  end
end
