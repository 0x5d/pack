require './data/adapters/mongo/pack'

scope do
  test 'validates presence of name' do
    pack = Adapters::Pack.new
    assert !pack.valid?
  end
end
