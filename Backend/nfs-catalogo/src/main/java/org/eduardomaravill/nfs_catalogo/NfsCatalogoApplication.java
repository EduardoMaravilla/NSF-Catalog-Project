package org.eduardomaravill.nfs_catalogo;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.License;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class NfsCatalogoApplication {

	public static void main(String[] args) {
		SpringApplication.run(NfsCatalogoApplication.class, args);
	}

	@Bean
	public OpenAPI customOpenAPI() {
		return new OpenAPI()
				.info(new Info()
						.title("API DOCUMENTATION (NFS-Catalog)")
						.version("1.003")
						.description("Project for catalog of NFS")
						.termsOfService("https://www.apache.org/licenses/LICENSE-2.0")
						.license(new License()
								.name("Apache 2.0")
								.url("https://github.com/EduardoMaravilla/Personal_Project/blob/master/LICENSE"))
						.contact(new Contact()
								.name("Eduardo Maravilla")
								.email("eduardomaravillag@gmail.com")));
	}

}
