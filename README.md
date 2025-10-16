## Database System Assignment 1

### Part 1 Import Data
[Lego Database](https://www.kaggle.com/datasets/rtatman/lego-database)

### Part 2 SQL Queries
1. List all LEGO sets released in 2011. Show the set number, name, and number of parts. Order by number of parts descending.
2. Count how many different LEGO sets exist for each year between 2001 and 2005. Show the year and count.
3. Find all sets that include other sets (using inventory_sets). Display the parent set name and the included set name.
4. List all LEGO sets that belong to themes starting with "Star Wars". Include the set name, year, theme name, and parent theme name (if applicable — meaning, if a set has a parent theme name starting with "Star Wars", you should also include it).
5. For each part category, find the total quantity of parts across all inventories. Show category name and total quantity, only for categories with total quantity > 50000. (Hint: Use Aggregation and GROUP BY)
6. Find the theme with the most sets. Display the theme name and count of sets. (Hint: Subqueries are helpful in complex requirements)
7. Display all sets from the year that had the highest average number of parts per set.
8. Find all themes that have no sets associated with them. (Hint: Use EXISTS / NOT EXISTS or JOIN ).
9. Find the top 5 most used colors across all sets. Show the color name, RGB value, total quantity used (sum of all quantities in inventory_parts), and the number of different sets that use this color.
10. (Bonus 1.) Find all sets whose names contain both "Castle" AND "Dragon". Show the set name and year.
11. (Bonus 2.) Create a simple report showing the following four items. Display them as a single row with four columns:
    - Total number of sets in database
    - Total number of unique parts
    - Total number of themes
    - Average parts per set (rounded to whole number)