CREATE DATABASE IF NOT EXISTS user_database;
USE user_database;


CREATE TABLE IF NOT EXISTS tbl_user(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(64) NOT NULL,
    last_name VARCHAR(64) NOT NULL,
    email VARCHAR(128) UNIQUE NOT NULL, 
    password VARCHAR(32) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE IF NOT EXISTS tbl_images(
    id INT AUTO_INCREMENT PRIMARY KEY,
    place_id INT,
    image_url TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (place_id) REFERENCES tbl_place(id)
);


CREATE TABLE IF NOT EXISTS tbl_reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    place_id INT,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES tbl_user_detail(id),
    FOREIGN KEY (place_id) REFERENCES tbl_place(id)
);


CREATE TABLE IF NOT EXISTS tbl_place (
    place_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(64) NOT NULL,
    description TEXT,
    latitude DOUBLE NOT NULL,
    longitude DOUBLE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);




INSERT INTO tbl_user_detail (first_name, last_name, email, password) VALUES
('Darshan', 'Patel', 'darshan.patel@example.com', 'password123'),
('John', 'Doe', 'john.doe@example.com', 'johnpassword'),
('Alice', 'Smith', 'alice.smith@example.com', 'alicepassword');




INSERT INTO tbl_place (name, description, latitude, longitude) VALUES
('Eiffel Tower', 'A famous landmark in Paris, France', 48.8584, 2.2945),
('Great Wall of China', 'A series of fortifications in China', 40.4319, 116.5704),
('Statue of Liberty', 'A symbol of freedom in the United States', 40.6892, -74.0445);



INSERT INTO tbl_images (place_id, image_url) VALUES
(1, 'https://example.com/images/eiffel_tower_1.jpg'),
(1, 'https://example.com/images/eiffel_tower_2.jpg'),
(2, 'https://example.com/images/great_wall_1.jpg'),
(3, 'https://example.com/images/statue_liberty_1.jpg');



INSERT INTO tbl_reviews (user_id, place_id, rating, review_text) VALUES
(1, 1, 5, 'The Eiffel Tower is a breathtaking sight! A must-see when visiting Paris.'),
(2, 2, 4, 'The Great Wall is magnificent, but the climb can be tiring.'),
(3, 3, 5, 'The Statue of Liberty is an iconic landmark, truly inspiring.'),
(1, 2, 3, 'The Great Wall is amazing, but it gets crowded with tourists.');




DROP TABLE IF EXISTS tbl_place;
DROP TABLE IF EXISTS tbl_user_detail;
DROP TABLE IF EXISTS tbl_reviews;
DROP TABLE IF EXISTS reviews;

ALTER TABLE tbl_images DROP FOREIGN KEY tbl_place;
ALTER TABLE tbl_images DROP FOREIGN KEY tbl_place;