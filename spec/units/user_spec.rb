describe User do
  describe '.create' do
    it 'adds a new user to the database' do
      user = User.create(name: 'mjss', email: 'm.spencer@makers.com', password: 'p20201122')
      user_from_db = persisted_data(table: 'users', id: user.id)

      expect(user_from_db['id']).to eq(user.id)
    end

    it 'wraps the user in an Object' do
      user = User.create(name: 'mjss', email: 'm.spencer@makers.com', password: 'p20201122')

      expect(user).to be_instance_of(User)
      expect(user.name).to eq('mjss')
      expect(user.email).to eq('m.spencer@makers.com')
    end
  end
end