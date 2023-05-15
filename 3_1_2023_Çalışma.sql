--select * from KitapBilgileri --Tabloyu çaðýrdýk
--select * from KitapOduncTablosu  --Tabloyu çaðýrdýk
--select * from KitapTurleri --Tabloyu çaðýrdýk
--select * from UyeBilgileri --Tabloyu çaðýrdýk

--select KitapAdi,KitapTuru from KitapBilgileri -- Kitap adý ve türünü yanyana görüntüledik

----Kitap Adýný ve kitabý alan üyenin adýný soyadýný gösteren sorguyu yaptýk.
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
--Kitap tablosundan bir kitap silindiðinde KitapOduncTablosu'ndanda ilgili kitabýn kayýtlarýný silmek
--Delete from KitapBilgileri where KitaoNumarasi=45
DECLARE @KitapNumarasi smallint --Kitap no deðiþkenini tanýmladým
SELECT @KitapNumarasi=@KitapNumarasi from deleted -- o an oluþan deleted tablosu
delete from KitapOduncTablosu where KitapNumarasi=@KitapNumarasi
select * from KitapOduncTablosu
end;




