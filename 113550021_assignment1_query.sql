-- Question 1:
SELECT set_num, name, num_parts
FROM sets
WHERE year = 2011
ORDER BY num_parts DESC;

-- Question 2:
SELECT year, COUNT(*)
FROM sets
WHERE year BETWEEN 2001 AND 2005 
GROUP BY year
ORDER BY year;

-- Question 3: 
SELECT s1.name AS parent_set_name, s2.name AS included_set_name
FROM inventory_sets AS i_s
JOIN inventories AS i
	ON  i_s.inventory_id = i.id
JOIN sets AS s1
	ON i.set_num = s1.set_num -- parent
JOIN sets AS s2
	ON i_s.set_num = s2.set_num -- included
ORDER BY s1.name, s2.name;

-- Question 4:
SELECT s.name AS set_name, s.year AS year, t1.name AS theme_name, t2.name AS parent_theme_name
FROM sets AS s
JOIN themes AS t1
	ON s.theme_id = t1.id -- theme
LEFT JOIN themes AS t2
	ON t1.parent_id = t2.id -- parent theme
WHERE t1.name LIKE 'Star Wars%' OR t2.name LIKE 'Star Wars%'
ORDER BY s.year, s.name;

-- Question 5:
SELECT p_c.name AS category_name, SUM(i_p.quantity) AS total_quantity
FROM part_categories AS p_c
JOIN parts AS p
	ON p_c.id = p.part_cat_id
JOIN inventory_parts AS i_p
	ON p.part_num = i_p.part_num
GROUP BY p_c.name
HAVING SUM(i_p.quantity) > 50000
ORDER BY p_c.name;

-- Question 6:
SELECT t.name AS theme_name, COUNT(s.set_num) AS count_of_sets
FROM themes AS t
JOIN sets AS s
	ON t.id = s.theme_id
GROUP BY t.id
HAVING COUNT(s.set_num) = 
(
	SELECT MAX(c_s_n)
	FROM -- count the quantity of sets for each theme
	(
		SELECT COUNT(set_num) AS c_s_n 
		FROM sets
		GROUP BY theme_id
	) find_max
);

-- Question 7:
SELECT set_num, name, year, theme_id, num_parts
FROM sets
WHERE year = (
    SELECT year
    FROM sets
    GROUP BY year
    ORDER BY AVG(num_parts) DESC
    LIMIT 1 -- LIMIT can limit how many data to be output
);

-- Question 8:
SELECT t.id, t.name, t.parent_id
FROM themes AS t 
LEFT JOIN sets AS s
	ON t.id = s.theme_id
WHERE s.theme_id IS NULL -- not matched
ORDER BY t.id;

-- Question 9:
SELECT c.name AS color_name, c.rgb AS RGB_value,
	SUM(i_p.quantity) AS total_quantity,
	COUNT(DISTINCT i.set_num) AS set_number
FROM inventory_parts AS i_p
JOIN colors AS c
	ON i_p.color_id = c.id
JOIN inventories AS i
	ON i_p.inventory_id = i.id
GROUP BY c.id
ORDER BY total_quantity DESC
LIMIT 5;

-- Bonus 1:
SELECT name, year
FROM sets
WHERE name LIKE '%Castle%' AND name LIKE '%Dragon%'

-- Bonus 2:
SELECT 
	(SELECT COUNT(*) FROM sets) AS set_number,
	(SELECT COUNT(*) FROM parts) AS unique_part_number,
	(SELECT COUNT(*) FROM themes) AS theme_number,
	ROUND((SELECT AVG(num_parts) FROM sets)) AS average_parts_per_set;