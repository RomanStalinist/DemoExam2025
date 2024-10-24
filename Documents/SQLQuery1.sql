create table MaterialTypes
(
	Id int primary key identity,
	[Name] nvarchar(50) not null,
	ScrapRate dec(5, 2) not null
)
go

create table Partners
(
	Id int primary key identity,
	[Type] nchar(3) not null
		check (Type in (N'ÎÎÎ', N'ÎÀÎ', N'ÇÀÎ', N'ÏÀÎ')),
	[Name] nvarchar(50) not null,
	Ceo nvarchar(100) not null,
	Email nvarchar(200) not null,
	PhoneNumber char(13) not null,
	[Address] nvarchar(255) not null,
	Tin char(10) not null,
	Rating tinyint null
		check (Rating is null or (Rating > 0 and Rating < 11)),
	Logo nvarchar(255) null
)
go

create table ProductTypes
(
	Id int primary key identity,
	[Name] nvarchar(50) not null,
	Ratio dec(5,2) not null
)
go

create table Products
(
	Id int primary key identity,
	TypeId int not null foreign key
		references ProductTypes(Id),
	[Name] nvarchar(200) not null,
	Article nchar(7) unique not null,
	MinCostForAgent dec(11, 2) not null
)
go

create table PartnerProducts
(
	ProductId int not null foreign key
		references Products(Id),
	PartnerId int not null foreign key
		references Partners(Id),
	[Count] bigint not null,
	SoldAt date not null,

	primary key(ProductId, PartnerId)
)
go
