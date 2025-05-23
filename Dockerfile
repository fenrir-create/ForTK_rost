FROM eclipse-temurin:24-jdk AS builder
WORKDIR /app

COPY .mvn .mvn
COPY mvnw pom.xml ./

RUN ./mvnw dependency:go-offline

COPY . .

# Собираем приложение
RUN ./mvnw clean package -DskipTests

# Новый слой с только нужным .jar
FROM eclipse-temurin:24-jre
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
