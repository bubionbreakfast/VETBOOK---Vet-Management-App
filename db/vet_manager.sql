DROP TABLE pets;
DROP TABLE vets;



CREATE TABLE vets
(
  id SERIAL8 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE pets
(
  id SERIAL8 primary key,
  name VARCHAR(255),
  birth_date VARCHAR(255),
  sex VARCHAR(255),
  owner VARCHAR(255),
  type VARCHAR(255),
  notes TEXT,
  vet_id INT8 references vets(id)
);
