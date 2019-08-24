require_relative( '../db/sql_runner' )


class Vet

  attr_accessor :first_name, :last_name, :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def self.find( id )
    sql = "SELECT * FROM vets
    WHERE id = $1"
    values = [id]
    vet = SqlRunner.run( sql, values )
    result = Vet.new( vet.first )
    return result
  end

  # def pets
  #   sql = "SELECT *
  #   FROM pets
  #   WHERE pet.id = $1"
  #   values = [@id]
  #   pet_data = SqlRunner.run(sql, values)
  #   pet = Pet.map_items(pet_data).first
  #   return film
  # end

  def update
    sql = "UPDATE vets
           SET first_name = $1,
           last_name = $2
           WHERE id = $3"
    values = [@first_name, @last_name, @id]
    SqlRunner.run(sql, values)
  end

  def save()
    sql = "INSERT INTO vets
    (
      first_name,
      last_name
    )
    VALUES
    (
      $1, $2
    )
    RETURNING *"
    values = [@first_name, @last_name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM vets"
    results = SqlRunner.run( sql )
    return results.map { |vet| Vet.new( vet ) }
  end

  def self.delete_all()
    sql = "DELETE FROM vets"
    SqlRunner.run( sql )
  end

  def self.delete(id)
    sql = "DELETE FROM vets
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def delete()
    sql = "DELETE FROM vets
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

end
