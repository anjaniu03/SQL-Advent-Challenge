-- SQL Advent Calendar - Day 12
-- Title: North Pole Network Most Active Users
-- Difficulty: hard
--
-- Question:
-- The North Pole Network wants to see who's the most active in the holiday chat each day. Write a query to count how many messages each user sent, then find the most active user(s) each day. If multiple users tie for first place, return all of them.
--
-- The North Pole Network wants to see who's the most active in the holiday chat each day. Write a query to count how many messages each user sent, then find the most active user(s) each day. If multiple users tie for first place, return all of them.
--

-- Table Schema:
-- Table: npn_users
--   user_id: INT
--   user_name: VARCHAR
--
-- Table: npn_messages
--   message_id: INT
--   sender_id: INT
--   sent_at: TIMESTAMP
--

-- My Solution:

WITH ranked_messages AS(
  SELECT 
  U.user_name,
  DATE(M.sent_at) AS send_date,
  COUNT(M.message_id) AS messages_count,
  RANK() OVER(
  PARTITION BY DATE(M.sent_at)
  ORDER BY COUNT(M.message_id) DESC) AS activity_rank
  FROM npn_users U
  JOIN npn_messages M ON U.user_id = M.sender_id
  GROUP BY DATE(M.sent_at), U.user_name)

SELECT 
send_date,
user_name,
messages_count,
activity_rank
FROM ranked_messages
WHERE activity_rank=1;
