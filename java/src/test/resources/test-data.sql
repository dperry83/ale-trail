BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role, email, first_name, last_name, city, state, zip)
    VALUES ('user1','user1','ROLE_USER','user1@email.com', 'k.a.', 'ren', 'Austin', 'TX', '12345');
INSERT INTO users (username,password_hash,role, email, first_name, last_name, city, state, zip)
    VALUES ('user2','user2','ROLE_USER', 'user2@email.com', 'Chris P.', 'Bacon', 'Memphis', 'TN', '98765');
INSERT INTO users (username,password_hash,role, email, first_name, last_name, city, state, zip)
    VALUES ('user3','user3','ROLE_USER',' user3@email.com', 'Jane', 'Doe', 'San Diego', 'CA', '90210');

COMMIT TRANSACTION;
