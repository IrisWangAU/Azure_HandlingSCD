SELECT * from dbo.CustomerSink WHERE CustomerId = 4

UPDATE dbo.CustomerSource
SET LastName = 'Lopez'
WHERE CustomerId = 4