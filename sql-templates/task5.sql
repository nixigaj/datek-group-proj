# Query 1:
SELECT welcome_text
FROM departments
WHERE parent_title IS NULL
LIMIT 1;

# Query 2:

SELECT title, root_url, description, logo, welcome_text
FROM departments
WHERE parent_title IS NULL;
