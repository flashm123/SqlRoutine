create table dbo.Product
(
	ProductId int primary key,
	ProductName nvarchar(64) not null,
)

-- Fill Product table.
insert into dbo.Product(ProductId, ProductName) values (1, N'Potato')
insert into dbo.Product(ProductId, ProductName) values (2, N'Milk')
insert into dbo.Product(ProductId, ProductName) values (3, N'Trouses')
insert into dbo.Product(ProductId, ProductName) values (4, N'Laptop')

create table dbo.Category
(
	CategoryId int primary key,
	CategoryName nvarchar(64) not null
)

-- Fill Category table.
insert into dbo.Category(CategoryId, CategoryName) values(1, N'Food')
insert into dbo.Category(CategoryId, CategoryName) values(2, N'Cloth')
insert into dbo.Category(CategoryId, CategoryName) values(3, N'Vegetable')

-- Fill ProductCategory - the intermediate table to archieve many-to-many relationship
create table dbo.ProductCategory
(
	CategoryId int foreign key references dbo.Category(CategoryId),
	ProductId int foreign key references dbo.Product(ProductId),
	primary key(CategoryId, ProductId)
)

insert into dbo.ProductCategory(ProductId, CategoryId) values (1, 1)
insert into dbo.ProductCategory(ProductId, CategoryId) values (1, 3)
insert into dbo.ProductCategory(ProductId, CategoryId) values (2, 1)
insert into dbo.ProductCategory(ProductId, CategoryId) values (3, 2)


SELECT p.ProductName, c.CategoryName FROM Product p
LEFT JOIN ProductCategory pc
ON p.ProductId = pc.ProductId
LEFT JOIN Category c
ON c.CategoryId = pc.CategoryId