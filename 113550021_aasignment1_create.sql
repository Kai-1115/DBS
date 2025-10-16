CREATE DATABASE lego;

CREATE TABLE colors(
	id int,
	name varchar(50),
	rgb varchar(6),
	is_trans boolean,
	primary key(id)
);

CREATE TABLE inventories(
	id int,
	version int,
	set_num varchar(50),
	primary key(id)
);

CREATE TABLE inventory_parts(
	inventory_id int,
	part_num varchar(50),
	color_id int,
	quantity int,
	is_spare boolean,
	primary key(inventory_id, part_num, color_id, quantity, is_spare)
);

CREATE TABLE inventory_sets(
	inventory_id int,
	set_num varchar(50),
	quantity int,
	primary key(inventory_id, set_num)
);

CREATE TABLE part_categories(
	id int,
	name varchar(255),
	primary key(id)
);

CREATE TABLE parts(
	part_num varchar(50),
	name varchar(255),
	part_cat_id int,
	primary key(part_num)
);

CREATE TABLE sets(
	set_num varchar(50),
	name varchar(255),
	year int,
	theme_id int,
	num_parts int,
	primary key(set_num)
);

CREATE TABLE themes(
	id int,
	name varchar(255),
	parent_id int,
	primary key(id)
);

