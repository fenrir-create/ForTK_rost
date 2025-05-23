# Этап сборки (build stage)
FROM eclipse-temurin:24-jdk AS builder
WORKDIR /app

COPY .mvn .mvn
COPY mvnw pom.xml ./
RUN chmod +x mvnw && ./mvnw dependency:go-offline

COPY . .
RUN ./mvnw clean package -DskipTests

# Этап запуска (runtime stage)
FROM eclipse-temurin:24-jre
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
