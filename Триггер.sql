USE TravelAgency;
GO

CREATE TRIGGER Tour
ON Tours
AFTER INSERT, UPDATE
AS
UPDATE Tours
SET TourPrice = TourPrice + TourPrice * 0.38
WHERE TourID = (SELECT TourID FROM inserted)