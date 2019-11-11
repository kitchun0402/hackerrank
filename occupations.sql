/*Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

Note: Print NULL when there are no more names corresponding to an occupation.*/

SET @num_doctor = 0, @num_professor = 0, @num_singer = 0, @num_actor = 0;

SELECT MIN(Doctor), MIN(Professor), MIN(Singer), MIN(Actor)
FROM
(SELECT
 CASE
    WHEN Occupation = 'Doctor'
        THEN @num_doctor := @num_doctor + 1
    WHEN Occupation = 'Professor'
        THEN @num_professor := @num_professor + 1
    WHEN Occupation = 'Singer'
        THEN @num_singer := @num_singer + 1
    WHEN Occupation = 'Actor'
        THEN @num_actor := @num_actor + 1
END AS INDEX_,
CASE
    WHEN Occupation = 'Doctor'
        THEN Name
END AS 'Doctor',
CASE
    WHEN Occupation = 'Professor'
        THEN Name
END AS 'Professor',
CASE
    WHEN Occupation = 'Singer'
        THEN Name
END AS 'Singer',
CASE
    WHEN Occupation = 'Actor'
        THEN Name
END AS 'Actor'
FROM Occupations
ORDER BY Name) AS T
GROUP BY INDEX_;
