package com.vendavo.mesos.app

import com.vendavo.mesos.app.repository.DvdRepository
import org.springframework.beans.factory.annotation.Value
import org.springframework.boot.SpringApplication
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.context.ApplicationContext
import org.springframework.data.jpa.repository.config.EnableJpaRepositories
import org.springframework.web.client.RestTemplate

@EnableJpaRepositories("com.vendavo.mesos.app.repository")
@SpringBootApplication
class TheApplication {

    @Value('${YOWIE_STATUS_UPDATE_URL:}')
    String yowieUpdateUrl
    
    static void main(String[] args) {
        
        ApplicationContext context = SpringApplication.run(TheApplication, args)

        DvdRepository repository = context.getBean(DvdRepository)
        repository.findAllByTitleLike('eliz')
        
        TheApplication application = context.getBean(TheApplication)

        if (application.yowieUpdateUrl) {

            RestTemplate restTemplate = new RestTemplate()
            restTemplate.put("${application.yowieUpdateUrl}READY", [:])
        }
    }
}
