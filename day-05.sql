-- SQL Advent Calendar - Day 5
-- Title: Elf Vacation Status
-- Difficulty: medium
--
-- Question:
-- Some elves took time off after the holiday rush, but not everyone has returned to work. List all elves by name, showing their return date. If they have not returned from vacation, list their return date as "Still resting".
--
-- Some elves took time off after the holiday rush, but not everyone has returned to work. List all elves by name, showing their return date. If they have not returned from vacation, list their return date as "Still resting".
--

-- Table Schema:
-- Table: elves
--   elf_id: INT
--   elf_name: VARCHAR
--
-- Table: vacations
--   elf_id: INT
--   start_date: DATE
--   return_date: DATE
--

-- My Solution:

SELECT E.elf_name, COALESCE(V.return_date, 'Still resting') AS return_status
FROM elves as E
LEFT JOIN vacations as V
ON E.elf_id = V.elf_id;
