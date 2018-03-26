# Docker
How to build
docker build -t php-5634 .

How to run
docker run -d -v /var/www/html:/var/www/html -p 9000:9000 --name phpfpm php-5634:latest
