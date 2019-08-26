DROP TABLE pets;
DROP TABLE vets;



CREATE TABLE vets
(
  id SERIAL8 primary key NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL
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
  vet_id INT8 references vets(id) on delete cascade NOT NULL
);
