# VetBook
Vet Management App
A veterinary practice has approached you to build a web application to help them manage their animals and vets.
A vet may look after many animals at a time. An animal is registered with only one vet.

The practice wants to be able to register / track animals. Important information for the vets to know is -
Name
Date Of Birth (use a VARCHAR initially)
Type of animal
Contact details for the owner
Treatment notes
Be able to assign animals to vets
CRUD actions for vets / animals
If an owner has multiple animals we don't want to keep updating contact details separately for each pet.
Extend your application to reflect that an owner can have many pets and to more sensibly keep track of
owners' details (avoiding repetition / inconsistencies)

In the future this app could be extended to include additional fuctionality such as:
--check in and check out for pets, with the ability to make appointments
--treatments with associated pricing, allowing the owner to be billed, and the practises finances recorded.
![Screenshot of Pets](/public/images/screenshot.png)

This App is built using an Object Orientated Model. It has Classes that define individual instances of each object.
This App is written in: 
  Ruby
  HTML
  CSS
  Uses RESTful Routes with Sinatra
