FROM gradle:8.6-jdk17

WORKDIR /app
COPY . .

CMD ["gradle", "--version"]