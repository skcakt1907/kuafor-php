<?php
$pageTitle = 'Hakkımızda — ' . (function_exists('ayar') ? '' : '');
require_once __DIR__ . '/inc/header.php';
?>
<section class="page-head">
  <div class="container">
    <h1>Hakkımızda</h1>
    <nav><ol class="breadcrumb"><li class="breadcrumb-item"><a href="<?= SITE_URL ?>/">Anasayfa</a></li><li class="breadcrumb-item active">Hakkımızda</li></ol></nav>
  </div>
</section>

<section>
  <div class="container">
    <div class="row align-items-center g-5">
      <div class="col-lg-6">
        <div class="about-img">
          <img src="https://images.unsplash.com/photo-1521590832167-7bcbfaa6381f?w=1000&q=80" alt="">
          <div class="about-exp"><h3><?= e(ayar('yil')) ?>+</h3><p>Yıllık Tecrübe</p></div>
        </div>
      </div>
      <div class="col-lg-6">
        <span class="badge-mini">Kurumsal</span>
        <h2><?= e(ayar('site_adi')) ?> <span style="color:var(--primary)">Kimdir?</span></h2>
        <p><?= e(ayar('hakkimizda_uzun')) ?></p>
        <ul class="about-list">
          <li><i class="bi bi-check-circle-fill"></i> Sertifikalı stilist ve estetisyen kadrosu</li>
          <li><i class="bi bi-check-circle-fill"></i> Uluslararası profesyonel salon ürünleri</li>
          <li><i class="bi bi-check-circle-fill"></i> Her kullanımda sterilizasyon, %100 hijyen</li>
          <li><i class="bi bi-check-circle-fill"></i> Gelin paketinde ücretsiz prova seansı</li>
        </ul>
      </div>
    </div>
  </div>
</section>

<section style="background:var(--light)">
  <div class="container">
    <div class="row g-4">
      <div class="col-md-6">
        <div class="service-card">
          <div class="service-icon"><i class="bi bi-bullseye"></i></div>
          <h4>Misyonumuz</h4>
          <p><?= e(ayar('misyon')) ?></p>
        </div>
      </div>
      <div class="col-md-6">
        <div class="service-card">
          <div class="service-icon"><i class="bi bi-eye-fill"></i></div>
          <h4>Vizyonumuz</h4>
          <p><?= e(ayar('vizyon')) ?></p>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="stats">
  <div class="container">
    <div class="row g-4">
      <div class="col-md-3 col-6"><div class="stat-item"><i class="bi bi-award-fill"></i><h3><?= e(ayar('yil')) ?>+</h3><p>Yıllık Tecrübe</p></div></div>
      <div class="col-md-3 col-6"><div class="stat-item"><i class="bi bi-scissors"></i><h3><?= e(ayar('proje_sayi')) ?>+</h3><p>Hizmet Çeşidi</p></div></div>
      <div class="col-md-3 col-6"><div class="stat-item"><i class="bi bi-people-fill"></i><h3><?= e(ayar('musteri_sayi')) ?>+</h3><p>Mutlu Müşteri</p></div></div>
      <div class="col-md-3 col-6"><div class="stat-item"><i class="bi bi-person-badge"></i><h3><?= e(ayar('personel_sayi')) ?>+</h3><p>Uzman Stilist</p></div></div>
    </div>
  </div>
</section>

<?php require_once __DIR__ . '/inc/footer.php'; ?>
