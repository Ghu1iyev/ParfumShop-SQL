create database ParfumShop

use ParfumShop

create table Category(
	Id int primary key identity,
	[Name] nvarchar(50)
)

create table Brand(
	Id int primary key identity,
	BrandName nvarchar(50),
	Category_Id int foreign key references Category(Id)
)

alter table Brand
add [Name] nvarchar(50)

create table Marka(
	Id int primary key identity,
	[Name] nvarchar(50),
	Brand_Id int foreign key references Brand(Id)
)

create table Product(
Id int primary key identity,
[Name] nvarchar(30),
Image nvarchar(50),
Price int,
Color nvarchar(20),
Volume integer,
[Count] integer,
Marka_Id int foreign key references Marka(Id)
)


select Marka.Name,Product.Name,Price,Color,Volume,[Count] from Product 
inner join Marka on  Product.Marka_Id=Marka.Id


select Brand.Name, Sum(Product.Price) 'Total Price' from Brand
inner join Marka on Brand.Id=Brand_Id
inner join Product on Marka.Id=Product.Id
GROUP BY Brand.Name