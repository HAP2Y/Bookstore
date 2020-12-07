CREATE TABLE Account ( 
  `firstname` char(20) NOT NULL,
  `lastname` char(20) NOT NULL,
  `username` char(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `postal` varchar(7) DEFAULT NULL,
  `phone` int,
  `role` char(20),
  `loggedin` boolean,
  PRIMARY KEY (`username`),
  UNIQUE KEY `username` (`username`)
);

CREATE TABLE Book (
`bid` VARCHAR(20) NOT NULL,
`title` VARCHAR(60) NOT NULL,
`price` INT NOT NULL,
`category` ENUM('Science','Fiction','Engineering') NOT NULL,
`description` VARCHAR(1000),
PRIMARY KEY(bid)
);

CREATE TABLE po_items (
id VARCHAR(20) NOT NULL,
bid VARCHAR(20) NOT NULL,
qty INT NOT NULL,
price INT UNSIGNED NOT NULL,
total INT NOT NULL,
PRIMARY KEY(id,bid),
INDEX (id),
FOREIGN KEY(id) REFERENCES purchase_order(poid) ON DELETE CASCADE,
INDEX (bid),
FOREIGN KEY(bid) REFERENCES Book(bid) ON DELETE CASCADE
);

DROP TABLE IF EXISTS purchase_order;
CREATE TABLE testing.purchase_order (
`poid` VARCHAR(20) PRIMARY KEY,
`firstname` char(20) NOT NULL,
`lastname` char(20) NOT NULL,
`status` ENUM('ORDERED','PROCESSED','DENIED') NOT NULL,
`address` INT UNSIGNED NOT NULL,
`grandtotal` VARCHAR(20) NOT NULL
);

insert into bookstore.book(bid, title, price, category, description) values
('b001', 'Little Prince', '20', 'Fiction','The Little Prince is a novella by French aristocrat, writer, and aviator Antoine de Saint-Exupéry. It was first published in English and French in the US by Reynal & Hitchcock in April 1943, and posthumously in France following the liberation of France as Saint-Exupérys works had been banned by the Vichy Regime.'),
('b002', 'Physics', '201', 'Science', 'Physics is the natural science that studies matter, its motion and behavior through space and time, and the related entities of energy and force. Physics is one of the most fundamental scientific disciplines, and its main goal is to understand how the universe behaves.'),
('b003', 'Mechanics', '100', 'Engineering', 'Mechanics is the area of physics concerned with the motions of physical objects. Forces applied to objects result in displacements, or changes of an objects position relative to its environment. This branch of physics has its origins in Ancient Greece with the writings of Aristotle and Archimedes.'),
('b004', 'Chemistry', '150', 'Science', 'Chemistry is the scientific discipline involved with elements and compounds composed of atoms, molecules and ions: their composition, structure, properties, behavior and the changes they undergo during a reaction with other substances.'),
('b005', 'Biology', '180', 'Science','Biology is the natural science that studies life and living organisms, including their physical structure, chemical processes, molecular interactions, physiological mechanisms, development and evolution. Despite the complexity of the science, certain unifying concepts consolidate it into a single, coherent field.'),
('b006', 'Motion', '250', 'Engineering','In physics, motion is the phenomenon in which an object changes its position over time. Motion is mathematically described in terms of displacement, distance, velocity, acceleration, speed, and time.'),
('b007', 'Electrostatics', '300', 'Engineering', 'Electrostatics is a branch of physics that studies electric charges at rest. Since classical physics, it has been known that some materials, such as amber, attract lightweight particles after rubbing'),
('b008', 'Frankenstein', '140', 'Fiction','Frankenstein; or, The Modern Prometheus is an 1818 novel written by English author Mary Shelley that tells the story of Victor Frankenstein, a young scientist who creates a sapient creature in an unorthodox scientific experiment.'),
('b009', 'The Bell Jar', '80', 'Fiction','The Bell Jar is the only novel written by the American writer and poet Sylvia Plath. Originally published under the pseudonym "Victoria Lucas" in 1963, the novel is semi-autobiographical, with the names of places and people changed.'),
('b010', 'The Giver', '120', 'Fiction','The Giver is a 1993 American young adult dystopian novel by Lois Lowry. It is set in a society which at first appears to be utopian but is revealed to be dystopian as the story progresses. The novel follows a 12-year-old boy named Jonas.');
