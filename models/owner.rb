require_relative( '../db/sql_runner' )

class Owner

  attr_accessor :first_name, :last_name, :telephone_number, :street_address, :postcode, :email
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @telephone_number = options['telephone_number']
    @street_address = options['street_address']
    @postcode = options['postcode']
    @email = options['email']
  end

  def pretty_name()
    return "#{@first_name} #{@last_name}"
  end

  def pets
    sql = "SELECT *
    FROM pets
    WHERE owner_id = $1"
    values = [@id]
    pet_data = SqlRunner.run(sql, values)
    pets = Pet.map_items(pet_data)
    return pets
  end

  def vet
    sql = "SELECT *
    FROM pets
    WHERE vet_id = $1"
    values = [@id]
    pet_data = SqlRunner.run(sql, values)
    pets = Pet.map_items(pet_data)
    return pets
  end

  def self.find( id )
    sql = "SELECT * FROM owners
    WHERE id = $1"
    values = [id]
    vet = SqlRunner.run( sql, values )
    result = Owner.new( owner.first )
    return result
  end

  def update
    sql = "UPDATE owners
    SET first_name = $1,
    last_name = $2,
    telephone_number = $3,
    street_address = $4,
    postcode = $5,
    email = $6
    WHERE id = $7"
    values = [@first_name, @last_name, @telephone_number, @street_address, @postcode, @email, @id]
    SqlRunner.run(sql, values)
  end

  def save
    sql = "INSERT INTO owners
    (
    first_name,
    last_name,
    telephone_number,
    street_address,
    postcode,
    email
  )
  VALUES
  (
    $1, $2, $3, $4, $5, $6
  )
  RETURNING *"
    values = [@first_name, @last_name, @telephone_number, @street_address, @postcode, @email]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM owners"
    results = SqlRunner.run( sql )
    return results.map { |owner| Owner.new( owner ) }
  end

  def self.delete_all()
    sql = "DELETE FROM owners"
    SqlRunner.run( sql )
  end

  def self.delete(id)
    sql = "DELETE FROM owners
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def self.find( id )
    sql = "SELECT * FROM owners
    WHERE id = $1"
    values = [id]
    pet = SqlRunner.run( sql, values )
    result = Owner.new( owner.first )
    return result
  end

  def delete()
    sql = "DELETE FROM owners
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  #Helper method for mapping
  def self.map_items(owner_data)
    result = owner_data.map { |owner| Owner.new( owner ) }
    return result
  end
end
