/*
 скрипт для создания таблиц
 */
 create table themes
(
    theme_id serial primary key ,
    title varchar(255) not null ,
    description text
 );

create table competencies
(
    competence_id serial primary key ,
    title varchar(255) not null ,
    description text
);

create table users
(
    user_id serial primary key ,
    first_name varchar(255) not null ,
    second_name varchar(255) ,
    third_name varchar(255),
    access_level integer not null default 0
);

create table owners
(
    owner_id serial primary key ,
    title varchar(255) not null ,
    description text ,
    contacts text
);

create table rules
(
    rule_id serial primary key ,
    title varchar(255) not null ,
    description text ,
    time_restriction integer default -1 ,
    weight numeric default 1.0
);

create table test_rules
(
    test_rule_id serial primary key ,
    title varchar(255) not null ,
    description text ,
    is_returnable bool default true ,
    time_restriction integer default -1 ,
    attempts integer default -1 ,
    access_level integer default 0
);

create table question_types
(
    question_type_id serial primary key ,
    title varchar(255) not null ,
    description text
);

create table answer_types
(
    answer_type_id serial primary key ,
    title varchar(255) not null ,
    description text
);

create table tests
(
    test_id serial primary key ,
    title varchar(255) not null ,
    owner_id integer references owners(owner_id) ,
    length integer not null default 1 ,
    test_rule_id integer not null  references test_rules(test_rule_id) ,
    content jsonb not null ,
    theme_id integer references themes(theme_id) ,
    competencies integer [] , /* {competence_id1, competence_id2, ...}*/
    date timestamp not null default now() ,
    description text
);

create table results
(
    results_id serial primary key ,
    user_id integer not null references users(user_id) ,
    test_id integer not null references tests(test_id) ,
    content jsonb ,
    date timestamp not null default now()
);

CREATE TABLE questions
(
    question_id serial primary key ,
    tittle varchar(255) not null ,
    description text ,
    question_type_id integer not null references question_types(question_type_id) ,
    default_answer_id integer not null ,
    owner_id integer references owners(owner_id) ,
    competencies integer [] ,
    theme_id integer references themes(theme_id) ,
    date timestamp not null default now()
);

CREATE TABLE answers
(
    answer_id serial primary key ,
    answer_type_id integer not null references answer_types(answer_type_id) ,
    question_id integer not null references questions(question_id) ,
    content jsonb not null ,
    right_variant text ,
    date timestamp not null default now()
);

CREATE TABLE reply
(
    reply_id serial primary key ,
    question_id integer not null references questions(question_id) ,
    description text ,
    is_right bool
);
