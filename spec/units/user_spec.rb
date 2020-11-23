describe User do
  describe '.create' do
    it 'adds a new user to the database' do
      user = User.create(name: 'mjss', email: 'm.spencer@makers.com', password: 'p20201122')
      user_from_db = persisted_data(table: 'users', id: user.id)

      expect(user_from_db['id']).to eq(user.id)
    end

    it 'wraps the user information in an Object' do
      user = User.create(name: 'mjss', email: 'm.spencer@makers.com', password: 'p20201122')

      expect(user).to be_instance_of(User)
      expect(user.name).to eq('mjss')
      expect(user.email).to eq('m.spencer@makers.com')
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('p20201122')
      User.create(name: 'mjss', email: 'm.spencer@makers.com', password: 'p20201122')
    end
  end

  describe '.find' do
    it 'finds a User from the database by their id' do
      user_one = User.create(name: 'mjss', email: 'm.spencer@makers.com', password: 'p20201122')
      user_two = User.create(name: 'ai', email: 'ai@makers.com', password: 'aip20201122' )
      found_user = User.find(id: user_one.id)

      expect(found_user.id).to eq(user_one.id)
      expect(found_user.name).to eq('mjss')
    end

    it 'returns nil if no id given' do
      expect(User.find(id: nil)).to eq(nil)
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username, email and password, if one exists' do
      user = User.create(name: 'mjss', email: 'm.spencer@makers.com', password: 'p20201122')
      authed_user = User.authenticate(email: 'm.spencer@makers.com', password: 'p20201122')

      expect(authed_user.name).to eq(user.name)
      expect(authed_user.email).to eq(user.email)
    end

    it 'returns nil if user gives the incorrect email' do
      User.create(name: 'mjss', email: 'm.spencer@makers.com', password: 'p20201122')
      authed_user = User.authenticate(email: 'wrong@makers.com', password: 'p20201122')
      expect(authed_user).to be_nil
    end
  end
end