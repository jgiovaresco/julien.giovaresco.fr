default: build-image run

build-image: 
	@echo "--------> Build docker image"
	@docker build -t php-5.5-with-ssl .

run: 
	@echo "--------> Run apache server"
	@docker run -i --rm=true -p 4080:80 --name my-apache-php-app -v ~/DEV/perso/julien.giovaresco.fr:/var/www/html --name julien.giovaresco.fr php-5.5-with-ssl