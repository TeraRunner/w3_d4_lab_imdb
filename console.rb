require_relative( 'models/casting' )
require_relative( 'models/movie' )
require_relative( 'models/star' )

require( 'pry-byebug' )

Movie.delete_all()
Star.delete_all()
Casting.delete_all()

movie1 = Movie.new({
  'title' => 'Star Wars',
  'genre' => 'Sci-fi'
})
movie1.save()

star1 = Star.new({
  'first_name' => 'Mark',
  'last_name' => 'Hammil'
})
star1.save()

star2 = Star.new({
  'first_name' => 'Carrie',
  'last_name' => 'Fisher'
})
star2.save()

movie1.title = 'Star Wars IV: A new Hope'
movie1.update()

casting1 = Casting.new({
  'movie_id' => movie1.id,
  'stars_id' => star1.id,
  'fee' => '1000'
  })
casting1.save

casting2 = Casting.new({
  'movie_id' => movie1.id,
  'stars_id' => star2.id,
  'fee' => '1250'
  })
casting2.save

Movie.all()
Star.all()
Casting.all()

binding.pry
nil
