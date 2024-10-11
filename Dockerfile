# Uygulamanın çalışması için JDK(Java Developemnt Kit) lazım.

#javanın farklı firmalar tarafından oluşturulan jdk'ları da vardır. Önemli olan doğru sürümümüzü seçmektir.
#openjdk:17, amazoncorretto:17
FROM openjdk:17

#Projemizin Jar dosyasının konumunnu belirleyeceğiz. Jar file'mın nerede olduğunun adresi.
#target içerisinde "*" adı ne olursa olsun uzantısı .jar olacaktır
ARG JAR_FILE=target/*.jar

# Projenin Jar halini Docker'ın içine şu isimle kopyala. Image'mizin adı
# Jar docker da ki  image h+aline vermemiz gereken ismi biz veriyoruz. Hepsi küçük harflerle olmaladırr.
# Docker'da ki extension'ın ismine bakarak örnek alabiliriz.
COPY ${JAR_FILE} devops-001-hello-1.0.2.jar

# BU JAR'I BİR LİNUX'UN İÇNE KOYACAĞI İÇİN TERMİNAL KOMUTLARINI "CMD" ile O LİNUX'A BURADAN KOMUTLAR YAZABİLİRİZ.
# versiyonunu güncelleyebilirim
# /no/yes sorununa direkt oalrak devam etmek -y yazmamız gerekmektedir.
# web üzerinde linux komutlarına bakabiliriz.
CMD sudo apt-get update
CMD sudo apt-get upgrade -y


#İç port sabitlemek için kullanılan anahtar kelime
#SONSUZA KADAR 8080. Kimse uygulamanın iç portunu değiştiremez. Bir başkası değiştirebilir çalışmıyor der ve çalışmaz.
EXPOSE 8080


#Burada yaptığımızı cmd ile de yapabilriz.
#EntryPoint bir dizi [] halinde alıyor değerleri.
# Uygulamanın çalıaşcağı komut.
#Cmd ile .jar nasıl çalıştırılır. " java - jar devops-application-2024 "
ENTRYPOINT ["java", "-jar", "devops-001-hello-1.0.2.jar"]

# container adı değiştirme
# docker container rename my-app5 my-app1

#container push
#docker image push docker.io/emreeoozell/devops-application-001:v002

#docker build --build-arg JAR_FILE=target/devops-001-hello-1.0.1.jar  --tag  emreeoozell/devops-application-001:v001 .

#SÜRÜM YÜKLENMESİ VE TEKRAR GÜNCELLENMESİ
#docker build --build-arg JAR_FILE=target/devops-001-hello-1.0.2.jar  --tag  emreeoozell/devops-application-001:v002 .

#Son sürüm zorunlu olarak çıakrtmamız gereklii. Mutlaka son sürüm bu ya gözükemsi lazım
# docker build --build-arg JAR_FILE=target/devops-001-hello-1.0.2.jar  --tag  emreeoozell/devops-application-001:latest .