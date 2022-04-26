/*
 Заполнение таблиц тестовыми данными
 */
INSERT INTO themes (title, description)
VALUES
    ('Профориентация', 'тестирование на профориентацию'),
    ('Профессиональное', 'определение навыков');

INSERT INTO competencies (title, description)
VALUES
    ('C++', ''),
    ('java', 'for web');

INSERT INTO users (first_name, second_name, third_name, access_level)
VALUES
    ('Иван', 'Иванов', 'Иванович', DEFAULT),
    ('Петр', 'Петров', 'Петрович', 1);

INSERT INTO owners (title, description, contacts)
VALUES
    ('hh', 'Head Haunter company', 'hh.ru');

INSERT INTO rules (title, description, time_restriction, weight)
VALUES
    ('default'
    , 'правило по умолчанию: нет ограничений по времени, вес вопроса = 1'
    , DEFAULT
    , DEFAULT),
    ('30 sec on question'
    , 'правило с ограничением по времени: 30 секунд на этот вопрос, вес вопроса = 1'
    , 30
    , DEFAULT);

INSERT INTO test_rules (title, description, is_returnable, time_restriction, attempts, access_level)
VALUES
    ('default'
    , 'правило по умолчанию: можно возвращаться к вопросам, нет ограничений по времени, число попыток не ограничено, доступен всем'
    , DEFAULT
    , DEFAULT
    , DEFAULT
    , DEFAULT),
    ('time restricted, 1 attempt, for vip users'
    , 'правило по умолчанию: можно возвращаться к вопросам, нет ограничений по времени, число попыток не ограничено, доступен всем'
    , DEFAULT
    , 600
    , 1
    , 1);

INSERT INTO question_types (title, description)
VALUES
    ('text', 'простой текстовый вопрос'),
    ('picture', 'вопрос по картинке');

INSERT INTO answer_types (title, description)
VALUES
    ('open', 'без вариантов, только поле для ввода ответа'),
    ('bool', 'ответ типа да/нет'),
    ('single variant', 'классический тест с выбором одного правильного ответа'),
    ('multi variant', 'выбрать все правильные ответы или утверждения'),
    ('bipolar', 'биполярная шкала');

INSERT INTO tests (title, owner_id, length, test_rule_id, content, theme_id, competencies, date, description)
VALUES
    ('test for test', 1, 1, 1
    , '{"qw1_id":1, "ans1_id":1, "rul1_id":1}'::jsonb
    , 1, '{1, 2}', DEFAULT, 'Тестовый тест с одним вопросом'),
    ('test for test2', 1, 2, 1
    , '{"qw1_id":1, "ans1_id":1, "rul1_id":1, "qw2_id":1, "ans2_id":1, "rul2_id":1}'::jsonb
    , 1, '{1, 2}', DEFAULT, 'Тестовый тест с одним вопросом');

INSERT INTO results (user_id, test_id, content, date)
VALUES
    (1, 1, '{"q1":1}'::jsonb, DEFAULT),
    (2, 2, '{"q1":0, "q2":1}'::jsonb, DEFAULT);

INSERT INTO questions (tittle, description, question_type_id, default_answer_id, owner_id, competencies, theme_id)
VALUES
    ('Сколько будет 2+2?', 'Выполните сложение и введите правильный ответ'
    , 1, 1, 1, Null, 2),
    ('Что изображено на картинке', 'https://decorel.by/wp-content/uploads/2015/03/thumb_01644.jpg'
    , 2, 2, 1, '{1}', 2);

INSERT INTO answers (answer_type_id, question_id, content, right_variant, date)
VALUES
    (1, 1, '{"val1": 0}'::jsonb, '4', DEFAULT),
    (3, 2
    , '{"val1": "птичка", "val2": "рыбка", "val3": "кошка", "val4": "неведома зверюшка"}'::jsonb
    , 'птичка', DEFAULT);

INSERT INTO reply (question_id, description, is_right)
VALUES
    (1, '4', true),
    (2, 'неведома зверюшка', false);