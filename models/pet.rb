require_relative( '../db/sql_runner' )


class Pet

  attr_accessor :name, :birth_date, :sex, :owner, :type, :notes, :vet_id, :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @birth_date = options['birth_date']
    @sex = options['sex']
    @owner = options['owner']
    @type = options['type']
    @notes = options['notes']
    @vet_id = options['vet_id'].to_i if options['vet_id']
  end

  def save()

    sql = "INSERT INTO pets
    (
      name,
      birth_date,
      sex,
      owner,
      type,
      notes,
      vet_id
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7
    )
    RETURNING id"
    values = [@name, @birth_date, @sex, @owner, @type, @notes, @vet_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM pets"
    results = SqlRunner.run( sql )
    return results.map { |pet| Pet.new( pet ) }
  end

  def self.delete_all()
    sql = "DELETE FROM pets"
    SqlRunner.run( sql )
  end

  def self.delete(id)
    sql = "DELETE FROM pets
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def self.find( id )
    sql = "SELECT * FROM pets
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Pet.new( results.first )
  end

end
