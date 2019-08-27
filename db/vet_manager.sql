DROP TABLE pets;
DROP TABLE owners;
DROP TABLE vets;



CREATE TABLE vets
(
  id SERIAL8 primary key NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL
);

CREATE TABLE owners
(
  id SERIAL8 primary key NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  telephone_number VARCHAR(255) NOT NULL,
  street_address VARCHAR(255) NOT NULL,
  postcode VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL
);

CREATE TABLE pets
(
  id SERIAL8 primary key NOT NULL,
  name VARCHAR(255) NOT NULL,
  birth_date VARCHAR(255) NOT NULL,
  sex VARCHAR(255) NOT NULL,
  owner VARCHAR(255) NOT NULL,
  type VARCHAR(255) NOT NULL,
  notes TEXT NOT NULL,
  vet_id INT8 references vets(id) on delete cascade NOT NULL,
  owner_id INT8 references owners(id) on delete cascade
);
