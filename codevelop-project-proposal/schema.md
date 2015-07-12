# Schema Information

## users
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
username        | string    | not null, unique
email           | string    | not null, unique
zipcode         | string    | not null
password_digest | string    | not null
session_token   | string    | not null, unique

## conversations
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
user_one_id | integer   | not null, foreign key
user_two_id | integer   | not null, foreign key

## conversation_replies
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
conv_id     | integer   | not null, foreign key
user_id     | integer   | not null
body        | text      | not null
sent_time   | datetime  | not null

## questions
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
body        | string    | not null

## answers
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
quest_id    | integer   | not null, foreign key
body        | string    | not null

## question_answers
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
user_id     | integer   | not null, foreign key
quest_id    | integer   | not null
answer_id   | integer   | not null
weight      | integer   | not null
