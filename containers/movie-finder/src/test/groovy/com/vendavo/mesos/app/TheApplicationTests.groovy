package com.vendavo.mesos.app

import com.vendavo.mesos.app.domain.Dvd
import com.vendavo.mesos.app.repository.DvdRepository
import org.junit.Test
import org.junit.runner.RunWith
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.SpringApplicationConfiguration
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner
import org.springframework.test.context.web.WebAppConfiguration

@RunWith(SpringJUnit4ClassRunner)
@SpringApplicationConfiguration(classes = TheApplication)
@WebAppConfiguration
class TheApplicationTests {

    @Autowired
    DvdRepository dvdRepository

    @Test
    void contextLoads() {

        List<Dvd> dvds = dvdRepository.findAllByTitleLike('%eli%')

        println "found."
    }

}
