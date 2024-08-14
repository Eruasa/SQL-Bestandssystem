DROP DATABASE IF EXISTS inventory_system;

CREATE DATABASE inventory_system;

USE inventory_system;

DROP TABLE IF EXISTS category, publisher, article, creator, creator_article;

CREATE TABLE categories(
    category_id                             INT(5)              UNSIGNED        UNIQUE  NOT NULL,
    category_name                           VARCHAR(25),
    PRIMARY KEY (category_id)
);

CREATE TABLE publishers(
    publisher_id                             INT(5)             UNSIGNED        UNIQUE  NOT NULL    AUTO_INCREMENT,
    publisher_name                           VARCHAR(25)                        UNIQUE,
    PRIMARY KEY (publisher_id)
);

CREATE TABLE articles(
    article_id                              INT(5)              UNSIGNED        UNIQUE  NOT NULL    AUTO_INCREMENT,
    category_id                             INT(5)              UNSIGNED                NOT NULL,
    publisher_id                            INT(5)              UNSIGNED,
    article_number                          VARCHAR(9)                          UNIQUE  NOT NULL,
    article_name                            VARCHAR(125),
    ISBN_EAN                                VARCHAR(13)                         UNIQUE  NOT NULL,
    PRIMARY KEY (article_id),
    FOREIGN KEY (category_id)               REFERENCES  categories  (category_id),
    FOREIGN KEY (publisher_id)              REFERENCES  publishers  (publisher_id)
);

CREATE TABLE creators(
    creator_id                              INT(5)              UNSIGNED        UNIQUE  NOT NULL    AUTO_INCREMENT,
    creator_name                            VARCHAR(50)                         UNIQUE,
    PRIMARY KEY (creator_id)
);

CREATE TABLE articles_creators(
    creator_id                              INT(5)              UNSIGNED                NOT NULL,
    article_id                              INT(5)              UNSIGNED                NOT NULL,
    PRIMARY KEY (creator_id, article_id),
    FOREIGN KEY (creator_id)                REFERENCES  creators    (creator_id),
    FOREIGN KEY (article_id)                REFERENCES  articles    (article_id)
);

CREATE TABLE stores(
    article_id                              INT(5)              UNSIGNED                NOT NULL,
    date_of_change                          TIMESTAMP,
    quantity_difference                     INT                                         NOT NULL,
    quantity                                INT                                         NOT NULL,
    PRIMARY KEY(article_id),
    FOREIGN KEY(article_id)                 REFERENCES  articles    (article_id)
);

CREATE TABLE prices(
    article_id                              INT(5)              UNSIGNED                NOT NULL,
    date_of_change                          TIMESTAMP,
    purchase_price                          BIGINT(15),
    sell_price                              BIGINT(15),
    PRIMARY KEY(article_id),
    FOREIGN KEY(article_id)                 REFERENCES  articles    (article_id)
);
