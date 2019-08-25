require_relative( "../models/vet.rb" )
require_relative( "../models/pet.rb" )
require("pry-byebug")


Pet.delete_all()
Vet.delete_all()

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


    pet1 = Pet.new({
      'name' => 'Jojo',
      'birth_date' => '10/02/2015',
      'sex' => 'female',
      'owner' => 'Mrs Trumpington',
      'type' => 'Dog',
      'notes' => 'Quite an elderly fox terrier, treated for Parvo on 01/05/2016',
      'vet_id' => vet1.id
      })
      pet1.save()


      pet2 = Pet.new({
        'name' => 'Fluffy',
        'birth_date' => '19/09/2016',
        'sex' => 'male',
        'owner' => 'Mrs Jobsworthy',
        'type' => 'Cat',
        'notes' => 'Quite an elderly long haired persian, treated for leptosporidium on 23/012/2018',
        'vet_id' => vet2.id
        })
        pet2.save()


        binding.pry
        nil
