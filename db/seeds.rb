require_relative( "../models/vet.rb" )
require_relative( "../models/pet.rb" )
require_relative( "../models/owner.rb" )

require("pry-byebug")


Pet.delete_all()
Vet.delete_all()
Owner.delete.all()

vet1 = Vet.new({
  'first_name' => 'Morag',
  'last_name' => 'Hasselhoff'
  })
  vet1.save()

  vet2 = Vet.new({
    'first_name' => 'Arabella',
    'last_name' => 'Towns'
    })
    vet2.save()

    owner1 = Owner.new({
      'first_name' => 'Davey',
      'last_name' => 'Jones',
      'telephone_number' => '55589765',
      'street_address' => '1 Hollywood Boulavard',
      'postcode' => '654321',
      'email' => 'google@gmail.com'
      })
      owner1.save()


      pet1 = Pet.new({
        'name' => 'Jojo',
        'birth_date' => '10/02/2015',
        'sex' => 'female',
        'owner' => 'Mrs Trumpington',
        'type' => 'Dog',
        'notes' => 'Quite an elderly fox terrier, treated for Parvo on 01/05/2016',
        'vet_id' => vet1.id,
        'owner_id' => owner1.id
        })
        pet1.save()


        pet2 = Pet.new({
          'name' => 'Fluffy',
          'birth_date' => '19/09/2016',
          'sex' => 'male',
          'owner' => 'Mrs Jobsworthy',
          'type' => 'Cat',
          'notes' => 'Quite an elderly long haired persian, treated for leptosporidium on 23/012/2018',
          'vet_id' => vet2.id,
          'owner_id' => owner1.id
          })
          pet2.save()






          binding.pry
          nil
