# Seyahat_Plani_Uygulamasi

 A travel app in flutter with Google Maps API
 
The video of the application is in the link: https://youtu.be/LFtXXIyajzY

The application's document is in the uygulamaraporu.docx file.

Trip-le Map

Ahmet Nusret ASMA, İsmetullah KAYIKÇI, Osman Hulisi YILMAZ

Yazılım Mühendisliği,

Özet

Teknoloji gün geçtikçe gelişmektedir ve günlük hayattaki bazı araçlara ulaşımı ve bu araçların kullanımını kolaylaştırmaktadır. Teknolojinin getirdiği güzelliklerden biri de mobil uygulamalar olmuştur. Haritalar istenilen bölge hakkında kullanıcıya bilgi veren önemli kaynaklardandır ve mobil uygulamalar ile kullanımı basitleşmiştir. Seyahat etmek her aşamasında kişiye öğretisi olan, zihnini açan, insanlara farklı açıdan bakmayı sağlayan bir süreçtir. Seyahat kavramı gün geçtikçe daha önemli bir hale gelmiştir. İlkokul döneminden itibaren süre gelmiş ev, araba hayali yerine artık seyahat kavramının ön plana çıktığı görülmektedir. Geliştirilen uygulamada kullanıcıların diledikleri iki yer arası en kısa mesafenin bulunması ve bulunan en kısa mesafe üzerindeki mekanlardan en yüksek puanlı olanının, kullanıcının rotasına ekleyebileceği bir uygulama hazırlanması amaçlanmıştır. 

Uygulama Dart programlama dilini kullanan Flutter araç takımı ile geliştirilmiştir. Kullanıcılardan bir hesap oluşturmaları veya misafir giriş yaparak uygulama ile etkileşime geçmeleri sağlanmıştır. Veri tabanı Firebase ile oluşturulmuştur. Kullanıcının rotaları kayıt ettiği ve sildiği bir sayfaya yönlendirilmiştir. Daha önceden kayıtlı bir rota seçerek uygulamayı kullanıma devam edebilmekte aynı zamanda yeni bir rota oluşturmak için harita sayfasını açabilmektedir. Google Haritalar API’si kullanılarak uygulamaya harita entegrasyonu yapılmıştır. Seçilen rota harita üzerinde gösterilmekte ve tavsiye edilen mekanlardan istediğini kullanıcı rotasına ekleme yapabilmektedir.

Hazırlanan uygulama harita uygulamalarına yeni bir tat katmıştır. Uygulama sayesinde kullanıcı gitmek istediği iki mekan arasındaki en kısa mesafe üzerinden yolculuk yapmıştır. Ayrıca rotası üzerindeki yüksek puanlı mekanları gezme şansı elde etmiştir.
 
Anahtar Kelimeler: Mobil, Flutter, Harita, Rota, Tavsiye mekanlar
 
1. GİRİŞ

	Teknoloji insan hayatını kolaylaştıran önemli unsurlardandır. Teknolojinin gelişmesi ile bazı araçlar günlük hayatımızın dışında kalırken bazı araçlarda teknolojiye ayak uydurarak kullanımını devam ettirmiştir. Harita bu araçlardan teknolojiye ayak uydurarak kendini gelişmiş teknolojik cihazlar içinde mobil uygulama olarak kullanabildiklerimizden olmuştur. Mobil uygulama, genellikle platforma özel uygulama mağazasından indirilen, akıllı telefon, tablet veya akıllı saat gibi mobil cihazlarda çalışması için hazırlanmış uygulama yazılımıdır[1].

Harita yeryüzünü belirli ölçeklerde kuşbakışı olarak bir düzlem üzerinde gösterimidir[2]. Temel işlevi bölge hakkında kullanıcıya bilgi vermesidir. Haritalar tarih boyunca istenilen yer hakkında faydalı olabilecek bilgiler almak için kullanılmıştır. Harita başlarda sadece yaşanan savaşlar ile gelişmiş ancak sonrasında ilmi ve siyasi meselelerde de kullanılmaya başlamasıyla gelişmesi hızlanmıştır. Günümüzde ise özellikle turistik gezilerde, mevcut konum paylaşılmak istendiğinde, araştırılan yer veya mekanlar hakkında bilgi almak istendiğindeki gibi durumlarda haritalardan yardım alınmaktadır.

Seyahat, kişinin uzak iki yer arasında gerçekleştirdiği harekettir. Eğlence, turizm ve tatilin yanı sıra dini kültürel ve eğitsel amaçlı seyahatler de yapılabilmektedir[3]. Tatiller, iş ve stresten uzak, rahatlatıcı zamanlar ve alışılmış ortamdan uzaklaşmak olarak değerlendirilmektedir ve yeni yerler keşfetmek deneyiminin insanların mutluluğunu arttırdığı sonucuna ulaşılmıştır[4].

İnsanlar bir konumdan başka bir konuma nasıl gideceklerini var olan harita uygulamaları üzerinde sorgulamakta ve öğrenmektedir. Ancak gidilecek rota etrafında görülmeye değer bir mekan olup olmadığından çoğu zaman haberleri olmamaktadır. Gidilecek rota üzerindeki yüksek puanlı konumların bilinmesi bu geziyi daha eğlenceli, daha güzel ve unutulmaz bir hale dönüştürebilmektedir. Uygulamamız yeni bir yere seyahat edenler, gittikleri yerde görülmeye değer yerleri öğrenmek isteyenler ve çevrelerinde bulunan yüksek puanlı önerilen mekanları öğrenmek isteyenler için geliştirilmiştir. Uygulama içerisinde kullanıcının kendine ait bir e-posta adresi ve şifre ile giriş yapabilmesi beklenmiştir. Giriş yapan kullanıcı harita üzerinde başlangıç konumu ile gitmek istediği yeri seçmesi istenilmektedir. Kullanıcı tarafından seçilen iki mekan arasındaki en kısa yolun uygulama tarafından çizilmesi beklenmiştir. Kullanıcının seçtiği rotayı uygulama üzerinden kayıt edebilmesi ve kayıt ettiği rotayı silebilmesi gerekmektedir. Çizilen rotaya yakın olan mekanların uygulama tarafından tespit edilmesi ve tespit edilen mekanlardan puanı en yüksek olan mekanın uygulama tarafından kullanıcıya önerilmesi istenmiştir. Kullanıcı isterse uygulama tarafından tavsiye edilen mekanı uygulama tarafından çizilen rotasına ekleyebilmelidir.

Belirtilen uygulama bir mobil uygulama olup Dart programlama dili ile yazılmıştır. Dart programlama dili, 2011 yılında Google tarafından geliştirilmiş olup nesne programlama dili olarak tanımlanmaktadır[5]. Flutter, Google tarafından geliştirilmiş olan bir araç takımıdır ve bu araç takımının kullanımında Dart programlama dili kullanılmaktadır[6]. Flutter araç takımı, geliştiricilere aynı uygulamayı hem IOS hem Android’e uyumlu şekilde geliştirmeyi, bu sayede geliştiricilerin zamanlarından büyük bir zaman tasarrufu kazanmalarını sağlamaktadır. Geliştirilen uygulamanın harita tarafı Google haritalar API’si ile oluşturulmuştur. Google Haritalar (Google Maps), Google tarafından 8 Şubat tarihinde ticari amaçla hizmete sunulmuş birçok dil desteği olan ücretsiz bir çevrimiçi haritalama servisidir[7]. Uygulamanın veri tabanı kısmı Firebase ile hazırlanmıştır. Firebase, 2011 yılında bağımsız olarak kurulmuştur. Google 2014 yılında platformu satın almıştır. Firebase, mobil ve web uygulamaları oluşturmak için geliştirilmiş bir platformdur.

2. KULLANILAN ARAÇLAR

2.1 Firebase

Firebase, mobil uygulamalar için düzenli veriler elde etmemizi sağlayan arka uç işletmesidir(backend bussines).Bunun yanında bulut hizmet sağlayıcı görevi de görmektedir. Günümüzde neredeyse tüm mobil uygulamaların kullanıcı doğrulaması ve güncellemelere ihtiyacı olduğundan bu durum bir hayli önemli bir husus olarak görülmektedir. Firebase’ın kullanımı kolaydır ve yeni başlayanlar için bile verilerin hızlı bir şekilde okunmasına ve yazılmasına olanak tanımaktadır.

Firebase, gerçek  zamanlı veri ve depolama ile IOS, Android ve hatta web tabanlı uygulamalar oluşturmak için kullanılabilir ve yazılım geliştiricilerin kullanabileceği çeşitli başka ürünler yapmaktadır.[8]
Firebase, gerçek zamanlı veri ve depolama ile IOS, Android ve hatta web tabanlı uygulamalar oluşturmak için kullanılabilir ve yazılım geliştiricilerin kullanabileceği çeşitli başka ürünler yapmaktadır.

Android uygulamaları için kullanılan sunucular Oracle SQL, Microsoft SQL Server ve MySQL'dir. Bu sunucular PHP dosyaları ile bağlanmaktadır. Sonra Android uygulamaları için Firebase ortaya çıktı ve verileri saklamak için JSON kullanmaya başlanmıştır. Diğer sunucular verileri saklamak için tablo (satır ve sütun) formatını kullanmaktadır. Firebase NoSQL tabanlıdır. Firebase benzeri bulut tabanlı az sayıda sunucu mevcuttur, örneğin: AWS Mobile Hub- Bu, mobil uygulamaları oluşturmak, inşa etmek, test etmek ve AWS hizmetlerini kullanarak izlemek için yardımcı olan bir konsol olarak kullanılmaktadır. CloudKit- Bu, Apple tarafından sadece iOS için veri ve varlıkları saklamak için yardımcı olmaktadır. Parse Server- Bu, Facebook tarafından Parse'ın işlevselliğini kopyalamak için yayınlanmıştır. Facebook bu projeyi kapattığı için artık mevcut olmadığından kullanılmamaktadır.

Firebase, web uygulama platformu olarak kabul edilmektedir. Geliştiricilerin yüksek kaliteli uygulamalar oluşturmasına yardımcı olmaktadır. Verileri JavaScript Nesne Notasyonu (JSON) formatında saklar ve veri eklemek, güncellemek, silmek veya eklemek için sorgu kullanmamaktadır. Bir sistemin arka ucu olarak kullanılan veri tabanıdır.


Firebase’in sağladığı hizmetler şunlardır:

2.1.1 Firebase Analytics 

Firebase Analytics, uygulama kullanımı hakkında bilgi sağlamaktadır. Ödemeli bir uygulama ölçüm çözümüdür ve kullanıcı etkileşimini de sağlamaktadır. Bu benzersiz özellik, uygulama geliştiricisinin kullanıcıların nasıl kullandıklarını anlamasına olanak tanımaktadır. SDK, kendi kendine olayları ve özellikleri yakalama özelliğine sahiptir ve ayrıca özel veri alma imkanı sunmaktadır.

2.1.2 Firebase Cloud Messaging(FCM)

Eski adı Google Clouds Messaging (GCM) olan FCM, Android, Web Uygulamaları ve iOS için mesajlar ve bildirimler için çapraz platform çözümü olan bir ücretli hizmet olarak kullanılmaktadır.

2.1.3 Firebase Auth

Firebase Auth, Facebook, Google, GitHub ve Twitter gibi sosyal giriş sağlayıcılarını desteklemektedir. Sadece istemci taraflı kod kullanarak kullanıcıları doğrulayan bir hizmettir ve ücretli bir hizmet olarak kullanılmaktadır. Aynı zamanda geliştiricilerin e-posta ve şifre girişi ile kullanıcı doğrulamasını Firebase'de saklanan kullanıcı yönetim sistemi de içermektedir. 

2.1.4 Real-time Database

Firebase gerçek zamanlı veri tabanı ve arka uç hizmetleri gibi hizmetler sunmaktadır. Uygulama geliştiricisine uygulama verilerinin Firebase'in bulutunda senkronize edilip saklandığı bir API sağlamaktadır. Şirket tarafından Android, IOS ve JavaScript uygulamaları ile entegrasyonu sağlamak için istemci kütüphaneleri sağlanmaktadır.

2.1.5 Firebase Storage

Firebase uygulamaları için ağ kalitesinden bağımsız olarak kolay ve güvenli dosya transferi sağlamaktadır. Google Cloud Storage tarafından desteklenir, bu maliyet etkili nesne depolama hizmeti olarak kullanılmaktadır. Geliştirici, resimleri, sesleri, videoları veya diğer kullanıcı oluşturduğu içerikleri saklamak için kullanabilmektedir.

2.1.6 Firebase Test Lab for Android

Android uygulamaları için bulut tabanlı bir altyapı sağlamaktadır. Bir işlem ile, geliştiriciler uygulamalarını çeşitli cihaz ve cihaz yapılandırmaları arasında test etmeye başlayabilmektedir. Ekran görüntüleri, videolar ve kayıtlar gibi çeşitli test sonuçları Firebase konsolunda mevcut olarak görülmektedir. Bir geliştirici uygulaması için herhangi bir test kodu yazmamış olsa bile, Test Lab otomatik olarak uygulamayı çalıştırabilir ve çökmelere bakabilmektedir.

2.1.7 Firebase Crash Reporting

Uygulamada hata raporları detaylı olarak oluşturulmaktadır. Hatalar benzer yığın izleri oluşan kümeler halinde gruplanır ve şiddetine göre değerlendirilmektedir. Diğer özellikler şunlardır: Geliştirici bir çökmenin neden olduğu adımları belirlemek için özel olayları kaydedebilmektedir.

2.1.8 Firebase Notifications

Mobil uygulama geliştiricileri için hedefli kullanıcı bildirimlerini etkinleştirir ve hizmetler ücretsiz olarak sunulmaktadır[9].






Şekil1’de Firebase veri tabanından bir örnek gösterilmiştir.

![image](https://user-images.githubusercontent.com/76453513/213917594-7aa19989-7309-46a7-b4fe-14dc9f39d5a7.png)

Şekil1. Örnek Firebase veri tabanı modeli[10]. 


Firebase Avantajları

Başlaması ücretsizdir: Firebase, kullanıcıların Google hesaplarını kullanarak oturum açmasına olanak tanımaktadır. Spark Planı ücretsizdir ve geliştiricilerin başlamasına yardımcı olacak sayısız özellik sunmaktadır. Cömert bir veri tabanına sahiptir ve sayı limitlerini okur ve yazmaktadır. Blaze Planı, artan gereksinimlere göre seçilebilir ve orijinal serbest limitleri dikkate almaktadır. Örneğin, Blaze Planında 20 GB depolama alanı barındırıyorsanız, ücretsiz sınır 10 GB'ı kapsar ve yalnızca 10 GB'lık ek depolama alanı için ödeme yapmanız gerekmektedir.

Geliştirme Hızı: Firebase, geliştiricilerin uygulama geliştirmede zamandan tasarruf etmelerine yardımcı olur ve ayrıca uygulamaları pazarlama süresini azaltmaktadır. Ön uç geliştiriciler, Firebase ve Firestore'u kullanarak tüm işi yönetebilir ve tamamlanması için gereken süreyi azaltabilmektedir. Ayrıca Firebase, geliştiricilerin standart kodlar oluşturmasını veya sıfırdan bir arka uç başlatmasını engelleyen kullanıma hazır hizmetler sunmaktadır.

Sunucusuz – Firebase: kullanıcıların isteklere göre ödeme yapmasını gerektiren tamamen sunucusuz bir ortam sağlamaktadır. Bu, ölçeklendirme ve daha iyi verimlilikle ilgili daha az endişeye neden olmaktadır[11]. 

2.2 Android Studio

Android Studio ,Google'ın Android işletim sistemi için JetBrains'in IntelliJ IDEA yazılımı üzerine kurulu ve özellikle Android geliştirme için tasarlanmış resmi tümleşik geliştirme ortamı olarak tanımlanmaktadır (IDE ) . Windows , macOS ve Linux tabanlı işletim sistemlerinde indirilebilmektedir .Yerel Android uygulama geliştirme için birincil IDE olarak Eclipse Android Geliştirme Araçları'nın (E-ADT) yerini almıştır.

Android Studio, 16 Mayıs 2013'te Google I/O konferansında duyurulmuştur. Mayıs 2013'te sürüm 0.1'den itibaren erken erişim ön izleme aşamasındaydı, ardından Haziran 2014'te yayınlanan sürüm 0.8'den itibaren beta aşamasına girmiştir. İlk kararlı yapı, sürüm 1.0'dan başlayarak Aralık 2014'te yayınlanmıştır. 2015'in sonunda Google, Eclipse ADT desteğini bırakarak Android Studio'yu Android geliştirme için resmi olarak desteklenen tek IDE haline getirmiştir[9].

7 Mayıs 2019'da Kotlin , Google'ın Android uygulama geliştirme için tercih ettiği dil olarak Java'nın yerini almıştır .Java, C++ gibi hala desteklenmektedir.
Android Studio, Java, C++ gibi IntelliJ (ve CLion ) ile aynı programlama dillerinin tümünü ve Go gibi uzantılarla daha fazlasını desteklemektedir ve Android Studio 3.0 veya sonraki sürümleri, Kotlin ve "platform sürümüne göre değişen tüm Java 7 dil özelliklerini ve Java 8 dil özelliklerinin bir alt kümesini" desteklemektedir. Harici projeler bazı Java 9 özelliklerini desteklemektedir. IntelliJ, Android Studio'nun yayınlanan tüm Java sürümlerini ve Java 12'yi desteklediğini belirtirken, Android Studio'nun Java 12'ye kadar Java sürümlerini hangi düzeyde desteklediği açık değildir (belgelerde kısmi Java 8 desteğinden bahsedilmektedir). Java 12'ye kadar en azından bazı yeni dil özellikleri Android'de kullanılabilmektedir.

Bir uygulama Android Studio ile derlendikten sonra Google Play Store'da yayınlanabilmektedir. Uygulama, Google Play Store geliştirici içerik politikasına uygun olmalıdır ardından yayınlanabilmektedir[12].

3. VERİTABANI TASARIMI

Veri tabanı bilgisayar sistemlerinde elektronik olarak depolanan yapılandırılmış bilgilerden veya veriden oluşan düzenli bir koleksiyondur. Veri tabanı DBMS (Veri Tabanı Yönetim Sistemi) ile kontrol edilmektedir. Veri tabanı sistemi veri, DBMS ve bunlarla ilişkili uygulama yazılımlarının bir araya getirilmesine denmektedir. 

 Veri tabanları ilk olarak 1960’lı yılların başlarında ortaya çıkmıştır ve radikal bir evrim süreci geçirmiştir. Hiyerarşik veri tabanı gibi navigasyonel veri tabanları ve ağ veri tabanı, verileri depolamak ve değiştirmek üzere kullanılan orijinal sistemler olarak geliştirilmiştir. 1980'li yıllarda ilişkisel veri tabanları popüler olmuştur ve ardından 1990'lı yıllarda nesne odaklı veri tabanları ortaya çıkmıştır. Yakın zamanda ise, internetin büyümesi ve yapılandırılmamış verilerin hızlı bir şekilde işlenmesi gibi ihtiyaçları karşılamak için NoSQL veri tabanları kullanılmaya başlanılmıştır. Günümüzde kendi kendini yöneten veri tabanları ve bulut veri tabanları depolama, veri toplama, yönetme ve kullanma konusunda çığır açmıştır[13].

Veri tabanı tasarımı oluştururken dikkat etmemiz gereken başlıca kurallar bulunmaktadır. İyi bir veri tabanı tasarımı için öncelikle veri tabanı amacı belirlenmelidir. Amaç belirlendikten sonra ise veri tabanına girilecek olan bilgilen bulunmalı ve düzene sokulmalıdır. Elde edilen bu bilgiler tablolara dökülmelidir. Ardından tabloların sütunlara bölünerek tablolarda depolanmak istenen bilgiler sütunlarda görüntülenmelidir. Her tablonun satırlarını kendilerine özgü kılmak için birincil anahtar (primary key - PK) sütunu eklenmelidir. Sonrasında tablolar arası ilişkiler belirlenmeli ve tablolar arası bağlantılar kurulmalıdır. Tasarım analiz edilmeli ve hatalar giderilmelidir. Son olarak normalleştirme kuralları uygulanmalı ve tablolarda gereken düzenlemeler yapılmalıdır[14].

Şekil2.’de gösterildiği gibi öncelikle mekan tablosu oluşturulup içerisine mekan bilgileri girilmesi için birincil anahtar olarak mekan_id’si tanımlanmıştır. Ardından sırayla lat (enlem), lon (boylam), mekan_adi ve puan tanımlanarak mekan tablosu tamamlanmıştır. Sonrasında yeni bir tablo ile rota tablosu oluşturulup rota bilgileri girilmesi için birincil anahtar olarak rota_id tanımlanmıştır. Ardından başlangıç noktasının koordinatları lat1, lon1 şeklinde tanımlanmıştır. Sonra bitiş koordinatları lat2, lon2 olarak tanımlanmıştır. Son tablomuz olan kullanıcı tablosuna birincil anahtar olarak kullanıcı_id tanımlanmıştır. Ardından kullanıcının giriş türünü belirlemek için identifier eklenmiştir. Daha sonra created (hesap oluşturma tarihi) ve sign_in (son giriş tarihi) eklenip veri tabanı tamamlanmıştır.

Açıklanan veri tabanı modelinin tablo görünümü Şekil2’de gösterilmiştir.
 
 ![image](https://user-images.githubusercontent.com/76453513/213917554-dc8ab3ee-b841-49e1-8f39-56aec1413acf.png)

Şekil2. Uygulama veri tabanı tablosu


4. MODÜLLER

4.1.Modüller

4.1.1.google_maps_flutter (2.2.2):

 Bu paket Google Maps API, harita tabanlı farklı amaçlı çözümlerde kullanılan Google Maps Developer Console‘da bulunan hazır kodlardan oluşmaktadır.

Chicagocrime.org ve konutmaps.com gibi tersine mühendislik ürünü karmaların başarısından sonra, Google, geliştiricilerin Google Haritalar'ı web sitelerine entegre etmelerine olanak sağlamak için Haziran 2005'te Google Haritalar API'sini piyasaya sürmüştür. API anahtarı gerektirmeyen ücretsiz bir hizmetti ve Haziran 2018'de (değişiklikler 16 Temmuz'da yürürlüğe girdi), API'ye erişmek için faturalandırmanın etkinleştirildiği bir Google Cloud hesabına bağlı bir API anahtarının gerekli olacağı duyurulmuştu. API şu anda reklam içermiyor, ancak Google kullanım koşullarında gelecekte reklam gösterme hakkını saklı tuttuklarını belirtmektedir.

Google Haritalar API'sini kullanarak, Google Haritalar'ı, üzerine siteye özgü verilerin bindirilebileceği harici bir web sitesine gömmek mümkündür. Başlangıçta yalnızca bir JavaScript API olmasına rağmen, Maps API, Adobe Flash uygulamaları için bir API (ancak bu kullanımdan kaldırılmıştır), statik harita görüntülerini almak için bir hizmet ve coğrafi kodlama gerçekleştirmek , yol tarifleri oluşturmak için web hizmetleri içerecek şekilde genişletilmiştir. Ve yükseklik profillerinin elde edilmesi. 1.000.000'den fazla web sitesi Google Haritalar API'sini kullanıyor, bu da onu en yoğun kullanılan web uygulaması geliştirme API'si yapmaktadır. Eylül 2011'de Google, Flash için Google Haritalar API'sini kullanımdan kaldıracağını duyurmuştur. 

Google Maps API, kullanıldığı sitenin herkesin erişimine açık olması ve erişim için ücret almaması ve günde 25.000'den fazla harita erişimi sağlamaması koşuluyla ticari kullanım için ücretsiz olarak kullanıma açmıştır. Bu gereksinimleri karşılamayan siteler, İşletmeler için Google Haritalar API'sini satın alabilmektedir.

4.1.2.flutter_polyline_points(1.0.0): 

 Bu paket Flutter uygulamalarında Google Maps API kullanırken, kullanıcının belirli bir rotayı takip etmesini sağlamak için kullanılabilecek bir paket olarak kullanılmaktadır. Bu paket, kullanıcının belirli bir rotayı takip etmesine veya bir yol haritasına göstermesine olanak tanımaktadır.

Bu paket, Google Maps API tarafından sağlanan koordinatlar arasındaki bir çizgi oluşturmak için kullanılmaktadır. Bu çizgi, verilen koordinatlar arasındaki en kısa rotayı temsil etmektedir. Bu sayede, kullanıcının rotayı takip etmesi veya yol haritasına bakması kolaylaştırmaktadır.

Ayrıca, bu paket ile çizgi renkleri, genişlikleri ve stilleri de özelleştirilebilmektedir. Böylece, kullanıcıların daha iyi anlaması için rota görsel olarak daha anlaşılır hale getirilebilmektedir.

4.1.3.location_distance_calculator(0.0.2):

 Bu paket Flutter uygulamalarında kullanılmaktadır. Bu paket, iki koordinat arasındaki mesafeyi hesaplamak için kullanılmaktadır. Bu paket, Haversine Formülünü kullanarak iki koordinat arasındaki mesafeyi hesaplamaktadır. Bu formül, dünya yüzeyinin bir küresi olarak kabul edilmesiyle çalışır ve iki nokta arasındaki yörüngeler arasındaki açıyı kullanarak mesafeyi hesaplamaktadır.

Bu paket ayrıca, iki koordinat arasındaki yönü de hesaplamaktadır. Bu sayede, kullanıcının rotayı takip etmesi veya yol haritasına bakmasını kolaylaştırmaktadır. Ayrıca, bu paket ile hesaplanan mesafe ve yön birimi olarak mil veya km olarak seçilebilmektedir.

Bu paket, navigasyon uygulamaları, turlar, seyahat planlaması gibi uygulamalarda kullanılabilmektedir. Örneğin, bir kullanıcının seyahat planlaması yaparken, iki farklı konum arasındaki mesafeyi ve yönü öğrenmesi için kullanabilmektedir.

4.1.4.firebase_auth(4.2.0):

 Firebase Auth, Firebase'in bir parçası olarak kullanılan bir kimlik doğrulama hizmeti olarak kullanılmaktadır. Bu hizmet, mobil ve web uygulamaları için kullanıcı hesaplarının oluşturulmasını, kimlik doğrulamasını ve yönetilmesini kolaylaştırmaktadır. Firebase Auth, çeşitli kimlik sağlayıcılarını (örneğin: Google, Facebook, Twitter, vb.) kullanarak kullanıcıların giriş yapmasını ve hesaplarını oluşturmasını sağlamaktadır.

Firebase Auth, kullanıcıların kimliğini doğrulamak için e-posta ve şifre ile giriş yapmalarını veya hızlı bir şekilde giriş yapmalarını sağlamaktadır (örneğin: telefon numarası ile doğrulama veya sosyal medya hesapları ile giriş yapma). Ayrıca, Firebase Auth, kullanıcıların şifrelerini unutmaları durumunda şifre sıfırlama işlemlerini otomatik olarak gerçekleştirmektedir.

Firebase Auth, kullanıcıların kimliğini doğruladıktan sonra, uygulamaya erişim izinlerini veya özel verileri erişebilmelerini sağlamaktadır. Firebase Auth, izinleri yönetmek için Firebase Roles kullanılabilmektedir.

Firebase Auth, kullanıcıların kimliğini doğrulamak için yerel olarak saklamak yerine Firebase veri tabanında saklamaktadır. Bu, uygulamanın kullanıcıların kimliği hakkında daha az bilgi saklamasını ve daha iyi güvenliği sağlamaktadır.

4.1.5.firebase_core(2.4.0):

 Firebase Core paketi, Firebase'in bir parçası olarak kullanılmaktadır. Bu paket, Firebase hizmetlerini kullanmak için gerekli olan temel yapıları sağlamaktadır. Firebase Core, Firebase projesine bağlanmakta, Firebase hizmetlerinin yapılandırılması ve kullanılması için gerekli olan API anahtarlarının yönetilmesini sağlamaktadır.

Firebase Core, Firebase hizmetleri arasında veri tabanı, storage, auth, push notification gibi hizmetleri kullanmak için gerekli olan temel yapıları sağlamaktadır. Bu sayede, uygulama geliştiricileri Firebase hizmetlerini kullanabilirken, Firebase Core aracılığıyla Firebase hizmetleri arasında geçiş yapabilmektedir.

Firebase Core paketi, Firebase hizmetleri arasında bağlantı sağlamak için kullanılmaktadır. Bu sayede, uygulama geliştiricileri Firebase hizmetlerini tek bir noktadan yönetebilir ve kullanabilmektedir. Firebase Core paketi, uygulama geliştiricilerinin Firebase hizmetleri arasında daha kolay geçiş yapmasını ve Firebase hizmetlerini daha verimli kullanmasını sağlamaktadır.

4.1.5.cloud_firestore(4.2.0):

Cloud Firestore, Firebase'in bir veri tabanı hizmeti olarak kullanılmaktadır. Bu hizmet, mobil ve web uygulamaları için veri depolama ve yönetimi için kullanılmaktadır. Cloud Firestore, verileri NoSQL (Not Only SQL) formatında saklar ve böylece verilerin yapısının esnek olmasını sağlamaktadır.

Cloud Firestore, verileri koleksiyonlar ve belgeler olarak saklamaktadır. Koleksiyonlar, verilerin gruplandırılmasını sağlar ve belgeler ise koleksiyonlar içinde saklanan verileri temsil etmektedir. Bu yapı, verilerin hiyerarşik olarak saklanmasını ve yönetilmesini kolaylaştırmaktadır.

Cloud Firestore, verileri gerçek zamanlı olarak güncelleyebilir ve gerçek zamanlı olarak dinleyebilmektedir. Bu sayede, uygulamalar gerçek zamanlı veri değişimlerini algılayabilir ve güncelleyebilmektedir. Ayrıca, Cloud Firestore, verileri replike ederek yedekler ve verilerin kaybolmasını önlemektedir.

Cloud Firestore, kullanıcı yetkilendirmesini Firebase Auth ile birlikte kullanabilir ve kullanıcıların erişim haklarını kontrol edebilmektedir. Cloud Firestore, veri yönetimi için Firebase'in bir parçası olarak kullanılır ve Firebase hizmetleri arasında entegre bir şekilde çalışmaktadır.

4.2.Sayfalar

4.2.1.login_Page.dart:

Bu sayfada kullanıcının giriş yapma işlemi ve kayıt olması için giriş sayfası oluşturulmuştur. Kullanıcının girdiği e-posta ve şifre ile oturum açmasını sağlamaktadır. Eğer kullanıcının kullanıcı ve şifre bilgisi yoksa kullanıcı kayıt ol butonuyla kayıt olma sayfasına giderek kayıt olma işlemini gerçekleştirmektedir. Kullanıcı anonim giriş özelliğini kullanarak herhangi bir bilgi girmeden uygulamaya erişebilmektedir.

4.2.2.signUp.dart:

Kullanıcı bu sayfada e-mail ve şifre bilgilerini oluşturarak kayıt olma işlemini gerçekleştirmektedir.

4.2.3.simple_map.dart:

Kullanıcı bu sayfada Harita üzerinde işlemler yapabilmektedir. Harita üzerinde seçtiği 2 konumu işaretleyebilmektedir. İşaretlediği 2 konum arasında en kısa mesafeyi göstermektedir. Bu 2 konum arası uzaklığı km cinsinden görebilmektedir. Seçilen 2 konum arasında mekan puanlamasına göre önerilen mekanları görebilmektedir. Bu işlemi yapabilmesi için “mekan öner” butonuna tıklaması yeterlidir. Ayrıca kullanıcı bu ekranda işaretlediği rotayı “rotayı kaydet” butonuyla kaydedebilmektedir. Ayrıca mekan öner sayfasındaki mekanlar puanlaması yüksek olan mekanlara göre gelmektedir. Seçtiği mekana tıklayarak bulunduğu konum ile gitmek istediği mekan arası rotayı ve mesafeyi göstermektedir. Daha sonra “bir sonraki rotaya geç” butonuyla seçili mekandan gitmek istediği konuma gitmektedir.

4.2.4.ilkrotas1.dart:

 Seçilen ilk mekan için başlangıç ile gitmek istenen mekan arasındaki en kısa yol ve mesafe işlemlerini gerçekleştirmektedir.

4.2.5.ilkrotas2.dart:

Bu sayfa seçilen ilk mekan ile gitmek istenen konum arasındaki mesafe ve en kısa yol işlemlerini gerçekleştirmektedir.

4.2.6.ikincirotas2.dart:

Bu sayfa Seçilen 2.mekan için başlangıç ile gidilmek istenen mekan arasında en kısa yol ve mesafe işlemlerini gerçekleştirmektedir.

4.2.7.ikincirotas2.dart:

Bu sayfa seçilen ikinci mekan ile gitmek istenen konum arasındaki mesafe ve en kısa yol işlemlerini gerçekleştirmektedir.

4.2.8.mekan.dart:

Veri tabanında oluşturulmuş mekanları uygulamada kullanmak üzere uygulamaya çekme işlemini gerçekleştirmektedir.

4.2.9.kayitlirota.dart:

Bu sayfa oluşturulan rotaları kaydettikten sonra veri tabanına ekleyip kayıtlı rotalar sayfasında kayıtlı verileri yazdırma işlemini ve silme işlemini gerçekleştirmektedir.

4.2.10.mekan_model.dart:

Veri tabanında oluşturulan mekanlar tablosunun “adı”,”puanı”,”lat”,“lon” bilgilerinin modelidir.

4.2.11.konumkayit.dart:

Veri tabanında oluşturulan rotalar tablosunun “lat1”,”lat2”,”lat3”,”lat4” bilgilerinin modelidir.

4.2.12.custom_text_button.dart:

Sayfalardaki butonları özelleştirme işlemlerinde çağrılmak üzere kullanılmaktadır.

4.2.13.customColor.dart:

Bu sayfada "CustomColors" sınıfı, renk değerlerini Color nesneleri biçiminde depolayan statik değişken tanımlar. Bu değerlere, "CustomColors.darkColor" gibi değişken adına başvurarak uygulama genelinde erişilebilir ve kullanılabilmek üzere oluşturulmuştur. 

5. SONUÇ

Mobil cihazlarda pek çok harita uygulaması bulunmaktadır. Bu uygulamaların içerisinde konum seçme, iki konum arası rota oluşturma gibi özellikler bulunmaktadır. Hazırlanan uygulama, hali hazırda kullanılan harita uygulamalarına ek mekan tavsiyesi vermektedir. Bu uygulamada, Dart programlama dili ve Flutter araç takımı kullanılarak bir mobil harita uygulaması gerçekleştirilmiştir. Yapılan uygulamanın veri tabanı kısmı için Firebase kullanılmıştır.

Uygulama içerisinde kullanıcılardan bir hesap oluşturmaları veya misafir giriş yaparak uygulama ile etkileşime geçmeleri sağlanmıştır. Giriş yapan kullanıcı rotaları kayıt ettiği ve sildiği bir sayfaya yönlendirilmiştir. Kullanıcı daha önceden kayıtlı bir rota seçerek uygulamayı kullanıma devam edebilmekte aynı zamanda yeni bir rota oluşturmak için harita sayfasını açabilmektedir. Google Haritalar API’si kullanılarak uygulamaya harita entegrasyonu yapılmıştır. Kullanıcı harita üzerine uzun tıklayarak ilk konumu ardından da ikinci konumu seçebilmektedir. Seçilen iki konum arası en kısa mesafe uygulama tarafından çizilmektedir. Çizilen rota harita üzerinde gösterilmekte ve bu rota üzerinde bulunan veya rota yakınında bulunan puanı diğer mekanlardan yüksek iki mekan kullanıcıya önerilmektedir. Kullanıcı tavsiye edilen mekanlardan istediğini rotasına ekleyerek önce başlangıç konumundan mekana ve sonrasında mekandan bitiş noktasına yeni rota uygulama tarafından çizilmektedir. Kullanıcı isterse başlangıç ve bitiş konumlarını daha sonra tekrar kullanmak üzere kayıt edebilmektedir. 

KAYNAKÇA

[1] (8 Haziran 2022). Mobil uygulama. https://tr.wikipedia.org/wiki/Mobil_uygulama (Erişim Tarihi: 15 Ocak 2023)

[2] (31 Temmuz 2022). Harita. https://tr.wikipedia.org/wiki/Harita (Erişim Tarihi: 16 Ocak 2023)

[3] (3 Ekim 2022). Seyahat. https://tr.wikipedia.org/wiki/Seyahat (Erişim Tarihi: 16 Ocak 2023)

[4] Demirbulat, Ö. G., & AVCIKURT, C. (2015). Turizm ve mutluluk arasindaki ilişki üzerine kavramsal bir değerlendirme. Balıkesir Üniversitesi Sosyal Bilimler Enstitüsü Dergisi, 18(34), 79-97.

[5] (30 Temmuz 2022). Dart (programlama dili). https://tr.wikipedia.org/wiki/Dart_(programlama_dili) (Erişim Tarihi: 15 Ocak 2023)

[6] (19 Mart 2022). Firebase. https://tr.wikipedia.org/wiki/Firebase (Erişim Tarihi: 15 Ocak 2023)

[7] (19 Mart 2022). Google Haritalar. https://tr.wikipedia.org/wiki/Google_Haritalar (Erişim Tarihi: 16 Ocak 2023)

[8] 29 Haz 2016. Google Android Firebase: Learning the Basics  
https://books.google.com.tr/books?id=JeeODAAAQBAJ&printsec=frontcover&hl=tr#v=onepage&q&f=false (Erişim Tarihi: 20.01.2023)
[9] Khawas, C., & Shah, P. (2018). Application of firebase in android app development-a study. International Journal of Computer Applications, 179(46), 49-53.

[10]Firebase-Read Data 
https://www.tutorialspoint.com/firebase/firebase_read_data (Erişim Tarihi: 20.01.2023)

[11] Firebase Advantages. https://blog.back4app.com/firebase-database-vs-mysql/ (Erişim Tarihi: 21.01.2023)

[12]18 Haziran 2023. Android Studio https://en.wikipedia.org/wiki/Android_Studio 20.01.2022
(Erişim Tarihi: 21.01.2023)

[13] Veritabanı Nedir?. https://www.oracle.com/tr/database/what-is-database/ (Erişim Tarihi: 12.01.2023)

[14] Veritabanı tasarımı temel bilgileri. https://support.microsoft.com/tr-tr/office/veritaban%C4%B1-tasar%C4%B1m%C4%B1-temel-bilgileri-eb2159cf-1e30-401a-8084-bd4f9c9ca1f5 (Erişim Tarihi: 12.01.2023)



