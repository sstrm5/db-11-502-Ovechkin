CREATE TABLE Movie (
    movieID INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    director VARCHAR(255)
);

CREATE TABLE Hall (
    hallID INT PRIMARY KEY,
    address VARCHAR(255)
);

CREATE TABLE Place (
    placeID INT PRIMARY KEY,
    hallID INT,
    FOREIGN KEY (hallID) REFERENCES Hall (hallID)
);

CREATE TABLE Session (
    sessionID INT PRIMARY KEY,
    movieID INT,
    timeStart TIMESTAMP,
    hallID INT,
    FOREIGN KEY (movieID) REFERENCES Movie (movieID),
    FOREIGN KEY (hallID) REFERENCES Hall (hallID)
);

CREATE TABLE Ticket (
    ticketID INT PRIMARY KEY,
    status VARCHAR(50),
    sessionID INT,
    placeID INT,
    FOREIGN KEY (sessionID) REFERENCES Session (sessionID),
    FOREIGN KEY (placeID) REFERENCES Place (placeID)
);

ALTER TABLE Movie ADD COLUMN duration_minutes INT;

ALTER TABLE Session ADD COLUMN price DECIMAL(10, 2);

ALTER TABLE Place
ADD COLUMN seat_type VARCHAR(20) DEFAULT 'Standard';

ALTER TABLE Ticket ADD COLUMN customer_email VARCHAR(100);

INSERT INTO
    Movie (
        movieID,
        name,
        director,
        duration_minutes
    )
VALUES (
        1,
        'Начало',
        'Кристофер Нолан',
        148
    ),
    (
        2,
        'Матрица',
        'Лана Вачовски',
        136
    ),
    (
        3,
        'Интерстеллар',
        'Кристофер Нолан',
        169
    );

INSERT INTO
    Hall (hallID, address)
VALUES (1, 'ул. Ленина, д. 10'),
    (2, 'пр. Мира, д. 25');

INSERT INTO
    Place (placeID, hallID, seat_type)
VALUES (1, 1, 'Standard'),
    (2, 1, 'Standard'),
    (3, 1, 'VIP'),
    (4, 2, 'Standard'),
    (5, 2, 'VIP');

INSERT INTO
    Session (
        sessionID,
        movieID,
        timeStart,
        hallID,
        price
    )
VALUES (
        101,
        1,
        '2023-11-01 10:00:00',
        1,
        500.00
    ),
    (
        102,
        1,
        '2023-11-01 14:00:00',
        1,
        600.00
    ),
    (
        103,
        2,
        '2023-11-01 12:00:00',
        2,
        450.00
    ),
    (
        104,
        3,
        '2023-11-02 20:00:00',
        1,
        700.00
    );

INSERT INTO
    Ticket (
        ticketID,
        status,
        sessionID,
        placeID,
        customer_email
    )
VALUES (
        1001,
        'Sold',
        101,
        1,
        'ivan@mail.ru'
    ),
    (
        1002,
        'Sold',
        101,
        2,
        'petr@mail.ru'
    ),
    (
        1003,
        'Booked',
        102,
        3,
        'anna@mail.ru'
    ),
    (
        1004,
        'Sold',
        103,
        4,
        'test@mail.ru'
    ),
    (
        1005,
        'Returned',
        104,
        5,
        'guest@mail.ru'
    );

UPDATE Ticket SET status = 'Sold' WHERE ticketID = 1003;

UPDATE Session SET price = price * 1.10 WHERE movieID = 3;

UPDATE Hall SET address = 'ул. Пушкина, д. 5' WHERE hallID = 2;

UPDATE Place SET seat_type = 'VIP' WHERE placeID = 2;