use Northwind

-- 1) Adının ilk iki harfi LA, LN, AA veya AN olanlar
SELECT FirstName, LastName FROM Employees WHERE 
FirstName LIKE 'LA%' 
OR FIRSTNAME LIKE 'LN%'
OR FIRSTNAME LIKE 'AA%'
OR FIRSTNAME LIKE 'AN%'

-- 2) Adının içerisinde _ geçen isimleri listeleyiniz ( içeride kayıt yok diye yazmamazlık yapmayınız, bi zahmet 2 satır datayı güncelleyin :))
SELECT FirstName, LastName FROM Employees WHERE FirstName LIKE '%[_]%' 

-- 3) Customers tablosundan CustomerID'sinin 2. harfi A, 4. harfi T olanların %10'luk kısmını getiren sorguyu yazınız.
SELECT TOP 10 PERCENT CustomerID FROM Customers WHERE CustomerID LIKE '_A_T%'

-- 4) Adının 2. harfi A veya T olmayanlar
SELECT FirstName, LastName FROM Employees WHERE FirstName NOT LIKE '_[AT]%' 

--5) Adının ilk harfi A ile I aralığında bulunmayanlar
SELECT FirstName, LastName FROM Employees WHERE FirstName NOT LIKE '[A_I]%'

-- 6) Adı T ile bitmeyenler
SELECT FirstName, LastName FROM Employees WHERE FirstName NOT LIKE '%T'

-- Function Odev :) -> Yaş hesaplama :) verdiğiniz tarihe göre, kişinin parametrede gönderdiğiniz yaşı doldurup doldurmadığı geriye dönünüz

DECLARE @MyBirthDate nvarchar(100) = '2000-12-26 00:00:00.000'

SELECT DATEDIFF(YY, @MyBirthDate,  GETDATE()) AS [Il],
       DATEDIFF(MM, @MyBirthDate,  GETDATE()) AS [Ay],
       DATEDIFF(D,  @MyBirthDate , GETDATE()) AS [Gun],
       DATEDIFF(HH, @MyBirthDate , GETDATE()) AS [Saat],
       DATEDIFF(MI, @MyBirthDate,  GETDATE()) AS [Deqiqe]