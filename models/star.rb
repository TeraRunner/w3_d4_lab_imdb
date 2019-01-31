require_relative("../db/sql_runner")

class Star
  attr_reader :id
  attr_accessor :first_name, :last_name

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  # def movies()
  #   sql = "SELECT movies.*
  #     FROM movies
  #     INNER JOIN castings
  #     ON castings.stars_id = stars.id
  #     WHERE castings.movie_id = $1"
  #   values = [@id]
  #   stars = SqlRunner.run(sql, values)
  #   result = stars.map {|stars| Star.new(stars)}
  #   return result
  # end

  def save()
    sql = "INSERT INTO stars (first_name, last_name) VALUES ($1, $2) RETURNING id"
    values = [@first_name, @last_name]
    movie = SqlRunner.run(sql, values).first
    @id = movie['id'].to_i
  end

  def update
    sql = "UPDATE stars SET (first_name,last_name) = ($1,$2) WHERE id = $3"
    values = [@first_name,@last_name,@id]
    SqlRunner.run(sql,values)
  end

  def self.all()
    sql = "SELECT * FROM stars"
    values = []
    stars = SqlRunner.run(sql, values)
    result = stars.map { |star| Star.new(star) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM stars"
    values = []
    SqlRunner.run(sql, values)
  end


end