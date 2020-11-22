require_relative './database_connection'

class User
  attr_reader :id, :name, :email

  def initialize(id:, name:, email:)
    @id = id
    @name = name
    @email = email
  end

  def self.create(name:, email:, password:)
    result = DatabaseConnection.query(
      "INSERT INTO users (name, email, password) 
      VALUES ('#{name}', '#{email}', '#{password}')
      RETURNING id, name, email;"
    ).first

    User.new(
      id: result['id'], 
      name: result['name'], 
      email: result['email']
    )
  end
end