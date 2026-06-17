-- ============================================
-- KUAFÖR / GÜZELLİK SALONU TEMASI — Kurulum SQL
-- (tema-master Kurumsal/Hizmet arketipinden türetildi)
-- Kullanım: phpMyAdmin > Import  (veya: mysql -u root < kurulum.sql)
-- ============================================
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS `kuafor_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `kuafor_db`;

-- ============ AYARLAR ============
DROP TABLE IF EXISTS `ayarlar`;
CREATE TABLE `ayarlar` (
  `anahtar` VARCHAR(80) NOT NULL PRIMARY KEY,
  `deger` TEXT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ayarlar` (`anahtar`,`deger`) VALUES
('site_adi','İnci Güzellik & Kuaför'),
('site_baslik','İnci Güzellik & Kuaför — Saç, Cilt ve Güzellik Salonu'),
('site_aciklama','Uzman stilistlerimiz ve estetisyenlerimizle saç tasarımından cilt bakımına, gelin başından kalıcı makyaja kadar güzelliğinize dair her şey tek adreste.'),
('telefon','+90 555 000 00 00'),
('telefon2','+90 532 000 00 00'),
('mail','info@incikuafor.com'),
('adres','Moda Cad. Güzellik Apt. No:23, Kadıköy / İstanbul'),
('calisma_saati','Pzt - Cmt: 09:30 - 20:00'),
('hakkimizda_kisa','İnci Güzellik & Kuaför, alanında uzman stilist ve estetisyen kadrosuyla; saç, cilt, tırnak ve makyaj hizmetlerini hijyenik ve konforlu bir ortamda sunan profesyonel bir güzellik salonudur.'),
('hakkimizda_uzun','İnci Güzellik & Kuaför olarak, her misafirimizin kendine özel olduğuna inanıyoruz. Saç tasarımında yüz hatlarınıza ve tarzınıza uygun kesim ve renklendirme öneriyor; cilt bakımında cilt analizine dayalı kişiye özel programlar uyguluyoruz. Kullandığımız tüm ürünler uluslararası sertifikalı profesyonel markalardır. Gelin başı ve özel gün hazırlıklarında deneme (prova) seansıyla hayalinizdeki görünüme birlikte karar veriyoruz. Hijyen bizim için süslü bir kelime değil günlük rutindir: tüm ekipmanlar her kullanım sonrası sterilize edilir. Kendinizi şımartmak için bir randevu yeterli.'),
('misyon','Misafirlerimizin kendilerini en iyi hissettikleri halleriyle salondan ayrılmalarını sağlamak; güzelliği kişiye özel, hijyenik ve ulaşılabilir bir deneyime dönüştürmek.'),
('vizyon','Bölgesinde saç ve güzellik denince ilk akla gelen, trendleri takip eden değil belirleyen salon olmak.'),
('yil','10'),
('proje_sayi','40'),
('musteri_sayi','25000'),
('personel_sayi','12'),
('facebook','#'),('instagram','#'),('twitter','#'),('linkedin','#'),('youtube','#');

-- ============ HİZMETLER (SALON HİZMETLERİ) ============
DROP TABLE IF EXISTS `hizmetler`;
CREATE TABLE `hizmetler` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `baslik` VARCHAR(150) NOT NULL,
  `slug` VARCHAR(180),
  `ozet` TEXT,
  `icerik` LONGTEXT,
  `ikon` VARCHAR(60) DEFAULT 'bi-scissors',
  `gorsel` VARCHAR(255),
  `sira` INT DEFAULT 0,
  `durum` TINYINT DEFAULT 1,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `hizmetler` (`baslik`,`slug`,`ozet`,`icerik`,`ikon`,`gorsel`,`sira`) VALUES
('Saç Kesim & Şekillendirme','sac-kesim','Yüz hatlarınıza ve tarzınıza özel kesim, fön ve şekillendirme.','Stilistlerimiz kesime başlamadan önce yüz şeklinizi, saç tipinizi ve günlük rutininizi değerlendirir; size en uygun modeli birlikte belirleriz. Katlı kesimden bob''a, perma ve fön çeşitlerinden topuz şekillendirmeye kadar tüm uygulamalar profesyonel ürünlerle yapılır.','bi-scissors','https://images.unsplash.com/photo-1560066984-138dadb4c035?w=800&q=80',1),
('Saç Boyama & Röfle','sac-boyama','Ombre, balyaj, röfle ve dip boyada uzman renklendirme hizmeti.','Renk uzmanlarımız cilt tonunuza ve göz renginize uygun tonu belirler. Amonyaksız boya seçenekleri, keratinli bakım destekli boyama, ombre, sombre, balyaj ve ışıltı röfleleriyle saçınıza zarar vermeden hayalinizdeki renge kavuşun. Boyama sonrası renk koruyucu bakım önerilerimizle renginiz uzun süre kalıcı olur.','bi-palette','https://images.unsplash.com/photo-1562322140-8baeececf3df?w=800&q=80',2),
('Cilt Bakımı','cilt-bakimi','Cilt analizine dayalı kişiye özel profesyonel bakım programları.','Seansa cilt analiziyle başlıyoruz; cildinizin ihtiyacına göre derin temizlik, nem dengeleme, leke karşıtı veya yaşlanma karşıtı protokoller uyguluyoruz. Hydrafacial, klasik cilt bakımı, enzim peeling ve maske uygulamalarımız estetisyenlerimiz tarafından steril koşullarda yapılır.','bi-droplet-half','https://images.unsplash.com/photo-1516975080664-ed2fc6a32937?w=800&q=80',3),
('Manikür & Pedikür','manikur-pedikur','Kalıcı oje, protez tırnak ve spa bakımıyla el-ayak güzelliği.','Manikür ve pedikür hizmetlerimizde tek kullanımlık törpü-tampon setleri kullanılır, metal aletler her misafir sonrası sterilize edilir. Kalıcı oje, jel tırnak, protez tırnak ve nail-art uygulamalarının yanı sıra bakım odaklı spa manikür-pedikür seçeneklerimiz de mevcuttur.','bi-stars','https://images.unsplash.com/photo-1604654894610-df63bc536371?w=800&q=80',4),
('Makyaj & Gelin Başı','makyaj-gelin','Özel günleriniz için profesyonel makyaj ve gelin başı tasarımı.','Düğün, nişan, mezuniyet ve özel davetleriniz için kalıcı ve ışıltılı makyaj uygulamaları yapıyoruz. Gelin paketimiz deneme (prova) seansı içerir: düğün gününden önce saç ve makyajınıza birlikte karar veririz. Düğün sabahı salonumuzda veya adresinizde hazırlanma imkânı sunuyoruz.','bi-gem','https://images.unsplash.com/photo-1487412947147-5cebf100ffc2?w=800&q=80',5),
('Kalıcı Makyaj & Kaş Tasarımı','kalici-makyaj-kas','Microblading, dudak renklendirme ve yüzünüze uygun kaş tasarımı.','Yüz hatlarınıza uygun kaş tasarımı (kaş alımı, şekillendirme), microblading, kıl tekniği, dudak renklendirme ve eyeliner uygulamaları sertifikalı uzmanlarımız tarafından, tek kullanımlık steril malzemelerle yapılır. Uygulama öncesi ücretsiz ön görüşme ve cilt testi yapıyoruz.','bi-brush','https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?w=800&q=80',6);

-- ============ PROJELER → GALERİ ============
DROP TABLE IF EXISTS `projeler`;
CREATE TABLE `projeler` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `baslik` VARCHAR(150) NOT NULL,
  `slug` VARCHAR(180),
  `kategori` VARCHAR(60),
  `gorsel` VARCHAR(255),
  `aciklama` TEXT,
  `tarih` VARCHAR(40),
  `sira` INT DEFAULT 0,
  `durum` TINYINT DEFAULT 1,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `projeler` (`baslik`,`slug`,`kategori`,`gorsel`,`aciklama`,`tarih`,`sira`) VALUES
('Salonumuz','salonumuz','Salon','https://images.unsplash.com/photo-1521590832167-7bcbfaa6381f?w=800&q=80','Ferah, modern ve hijyenik salonumuzda kendinizi evinizde hissedeceksiniz.','2026',1),
('Saç Tasarım Köşesi','sac-tasarim-kosesi','Salon','https://images.unsplash.com/photo-1559599101-f09722fb4948?w=800&q=80','Profesyonel ekipmanlarla donatılmış saç kesim ve şekillendirme alanımız.','2026',2),
('Balyaj Çalışmamız','balyaj-calismasi','Çalışmalarımız','https://images.unsplash.com/photo-1580618672591-eb180b1a973f?w=800&q=80','Doğal geçişli balyaj uygulamalarımızdan bir kare.','2026',3),
('Gelin Başı','gelin-basi','Gelin','https://images.unsplash.com/photo-1519741497674-611481863552?w=800&q=80','Prova seanslı gelin başı ve makyaj çalışmalarımızdan.','2025',4),
('Nail Art Çalışmaları','nail-art','Çalışmalarımız','https://images.unsplash.com/photo-1610992015732-2449b76344bc?w=800&q=80','Kalıcı oje ve nail-art uygulamalarımızdan örnekler.','2025',5),
('Cilt Bakım Odası','cilt-bakim-odasi','Salon','https://images.unsplash.com/photo-1570172619644-dfd03ed5d881?w=800&q=80','Steril ve huzurlu cilt bakım odamızda kişiye özel bakım deneyimi.','2025',6);

-- ============ BLOG → GÜZELLİK REHBERİ ============
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `baslik` VARCHAR(200) NOT NULL,
  `slug` VARCHAR(200),
  `kategori` VARCHAR(60),
  `ozet` TEXT,
  `icerik` LONGTEXT,
  `gorsel` VARCHAR(255),
  `tarih` DATE,
  `durum` TINYINT DEFAULT 1,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `blog` (`baslik`,`slug`,`kategori`,`ozet`,`icerik`,`gorsel`,`tarih`) VALUES
('Boya Sonrası Saç Bakımı: Rengi Koruyan 5 Altın Kural','boya-sonrasi-sac-bakimi','Saç Bakımı','Saç renginizin salondan çıktığınız gibi kalması için evde uygulayabileceğiniz 5 basit kural.','1) İlk 48 saat saçınızı yıkamayın — renk pigmentlerinin oturması için zaman tanıyın. 2) Sülfatsız, renk koruyucu şampuan kullanın. 3) Saçınızı ılık suyla yıkayın; sıcak su rengi hızla soldurur. 4) Isıyla şekillendirme öncesi mutlaka ısı koruyucu sprey kullanın. 5) Haftada bir nemlendirici maske uygulayın. Bu rutinle boyanız 6-8 hafta ilk günkü canlılığını korur.','https://images.unsplash.com/photo-1522337660859-02fbefca4702?w=800&q=80','2026-05-12'),
('Gelin Hazırlığı Takvimi: Düğüne 3 Ay Kala','gelin-hazirligi-takvimi','Gelin','Düğün gününe stressiz girmenin sırrı doğru planlama. İşte ay ay gelin güzellik takvimi.','Düğüne 3 ay kala: cilt bakım programına başlayın, saç renginize karar verin. 2 ay kala: deneme (prova) seansınızı yaptırın — saç ve makyajı düğün konseptinizle birlikte değerlendirelim. 1 ay kala: son kesim ve renk rötuşu, kaş tasarımı. 1 hafta kala: manikür-pedikür ve son cilt bakımı. Düğün günü: sabah erken saatte salonumuzda veya adresinizde hazırlık. Gelin paketimiz tüm bu adımları içerir; erken rezervasyon öneririz.','https://images.unsplash.com/photo-1519741497674-611481863552?w=800&q=80','2026-04-08'),
('Evde Cilt Bakım Rutini: Sabah ve Akşam','evde-cilt-bakim-rutini','Cilt Bakımı','Salon bakımlarının etkisini artıran, 5 dakikalık evde bakım rutini.','Sabah: nazik bir temizleyici ile yüzünüzü yıkayın, nemlendiricinizi uygulayın ve mutlaka güneş koruyucu kullanın — leke ve yaşlanmanın bir numaralı sebebi korumasız güneş maruziyetidir. Akşam: makyajınızı çift aşamalı temizleyin (önce yağ bazlı, sonra su bazlı), haftada 2-3 kez cilt tipinize uygun serum ekleyin. Ayda bir profesyonel cilt bakımıyla bu rutini desteklerseniz cildiniz her mevsim ışıldar. Cilt analizinizi salonumuzda ücretsiz yaptırabilirsiniz.','https://images.unsplash.com/photo-1556228720-195a672e8a03?w=800&q=80','2026-03-14');

-- ============ REFERANSLAR (MÜŞTERİ YORUMLARI) ============
DROP TABLE IF EXISTS `referanslar`;
CREATE TABLE `referanslar` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `ad` VARCHAR(100) NOT NULL,
  `unvan` VARCHAR(120),
  `yorum` TEXT,
  `foto` VARCHAR(255),
  `yildiz` TINYINT DEFAULT 5,
  `durum` TINYINT DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `referanslar` (`ad`,`unvan`,`yorum`,`foto`,`yildiz`) VALUES
('Aslı K.','Müdavim','3 yıldır başka yere gitmiyorum. Balyajım her seferinde tam istediğim tonda oluyor, saçım hiç yıpranmadı. Hijyen konusundaki titizlikleri de takdire şayan.','https://i.pravatar.cc/100?img=45',5),
('Gizem T.','Gelin','Düğünüm için gelin paketini aldım, prova seansı sayesinde düğün günü sıfır stres yaşadım. Makyajım gece boyunca bozulmadı, herkes sordu. İyi ki sizi seçmişim!','https://i.pravatar.cc/100?img=26',5),
('Derya M.','Google Yorumu','Cilt bakımına düzenli gidiyorum, cildimdeki fark herkesin dikkatini çekiyor. Randevuya tam saatinde alınıyorsunuz, bekleme derdi yok. Fiyatlar da gayet makul.','https://i.pravatar.cc/100?img=38',5);

-- ============ MESAJLAR ============
DROP TABLE IF EXISTS `mesajlar`;
CREATE TABLE `mesajlar` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `ad` VARCHAR(100),
  `mail` VARCHAR(150),
  `tel` VARCHAR(40),
  `konu` VARCHAR(200),
  `mesaj` TEXT,
  `okundu` TINYINT DEFAULT 0,
  `tarih` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============ TEKLİFLER (RANDEVU TALEPLERİ) ============
DROP TABLE IF EXISTS `teklifler`;
CREATE TABLE `teklifler` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `ad` VARCHAR(100),
  `mail` VARCHAR(150),
  `tel` VARCHAR(40),
  `hizmet` VARCHAR(120),
  `il` VARCHAR(60),
  `adres` VARCHAR(255),
  `alan` VARCHAR(60),
  `butce` VARCHAR(60),
  `baslangic` VARCHAR(60),
  `detay` TEXT,
  `durum` ENUM('yeni','degerlendiriliyor','teklif_verildi','kazanildi','kaybedildi') DEFAULT 'yeni',
  `notlar` TEXT,
  `tarih` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============ ADMIN ============
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `kullanici` VARCHAR(60) NOT NULL UNIQUE,
  `sifre_hash` VARCHAR(255) NOT NULL,
  `ad_soyad` VARCHAR(120),
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Şifre: admin123  (password_hash bcrypt) — CANLIDA MUTLAKA DEĞİŞTİR
INSERT INTO `admin` (`kullanici`,`sifre_hash`,`ad_soyad`) VALUES
('admin','$2y$10$6gNrpOXRLof.Toy.Ugy.yu4DrKP23OcnJa7UBhKOH1iMxbtH8GK0.','Yönetici');

SET FOREIGN_KEY_CHECKS = 1;
