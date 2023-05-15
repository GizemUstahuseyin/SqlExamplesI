--select * from KitapBilgileri --Tabloyu �a��rd�k
--select * from KitapOduncTablosu  --Tabloyu �a��rd�k
--select * from KitapTurleri --Tabloyu �a��rd�k
--select * from UyeBilgileri --Tabloyu �a��rd�k

--select KitapAdi,KitapTuru from KitapBilgileri -- Kitap ad� ve t�r�n� yanyana g�r�nt�ledik

----Kitap Ad�n� ve kitab� alan �yenin ad�n� soyad�n� g�steren sorguyu yapt�k.
--select UyeBilgileri.UyeAdi, UyeBilgileri.UyeSoyadi, KitapBilgileri.KitapAdi from KitapOduncTablosu 
--join UyeBilgileri on KitapOduncTablosu.UyeNumarasi =UyeBilgileri.UyeNumarasi
--join KitapBilgileri on KitapOduncTablosu.KitapNumarasi = KitapBilgileri.KitapNumarasi


--UPDATE KitapOduncTablosu set KitapNumarasi=(SELECT KitapNumarasi from UyeBilgileri
--WHERE KitapOduncTablosu.UyeNumarasi = UyeBilgileri.UyeNumarasi)

--UPDATE KitapOduncTablosu set KitapOduncTarihi=(SELECT KitapOduncTarihi from UyeBilgileri
--WHERE KitapOduncTablosu.UyeNumarasi = UyeBilgileri.UyeNumarasi)

--UPDATE UyeBilgileriDetay set UyeNumarasi=(SELECT UyeNumarasi from UyeBilgileri
--WHERE UyeBilgileriDetay.UyeAdi = UyeBilgileri.UyeAdi)

--UPDATE UyeBilgileriDetay set UyeAdi=(SELECT UyeAdi from UyeBilgileri
--WHERE UyeBilgileriDetay.UyeNumarasi = UyeBilgileri.UyeNumarasi)

CREATE TRIGGER [dbo].[trgUpdateKitapOduncTablosu] ON [dbo].[KitapBilgileri] AFTER DELETE
AS
BEGIN
--Kitap tablosundan bir kitap silindi�inde KitapOduncTablosu'ndanda ilgili kitab�n kay�tlar�n� silmek
--Delete from KitapBilgileri where KitaoNumarasi=45
DECLARE @KitapNumarasi smallint --Kitap no de�i�kenini tan�mlad�m
SELECT @KitapNumarasi=@KitapNumarasi from deleted -- o an olu�an deleted tablosu
delete from KitapOduncTablosu where KitapNumarasi=@KitapNumarasi
select * from KitapOduncTablosu
end;




