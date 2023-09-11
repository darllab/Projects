In this SQL project, I use the dataset from my company. I play along with it so I can practice.

--Employee who hasn't confirmed their attendance--

SELECT 
    name,
    sf_id,
    email_address,
    confirmation_of_attendance
FROM 
    STBTCARDINALRULESSAFETYFUNDAMENTALSAUGSEP2023
WHERE 
    confirmation_of_attendance = 'No'
group BY
    sf_id,
    name
order by 
    sf_id ASC
LIMIT 100


--Employee who confirmed their attendance--

SELECT 
    name, 
    sf_id,
    email_address,
    confirmation_of_attendance
FROM STBTCARDINALRULESSAFETYFUNDAMENTALSAUGSEP2023
WHERE confirmation_of_attendance = 'Yes'
order by name ASC
LIMIT 300

--We want to know the length of Employee ID, also I change SF_ID to Employee_ID
SELECT
	LENGTH(sf_id) as Employee_ID
FROM
	STBTCARDINALRULESSAFETYFUNDAMENTALSAUGSEP2023

