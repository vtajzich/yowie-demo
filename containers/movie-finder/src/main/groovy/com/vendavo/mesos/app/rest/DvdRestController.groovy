package com.vendavo.mesos.app.rest

import com.vendavo.mesos.app.domain.Dvd
import com.vendavo.mesos.app.repository.DvdRepository
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

/**
 * Created by vtajzich
 */
@RestController
@CompileStatic
class DvdRestController {
    
    @Autowired
    DvdRepository repository
    
    @RequestMapping('/dvd/title/like/{like}')
    List<Dvd> findAllDvdsLike(@PathVariable('like') String like) {
        return repository.findAllByTitleLike("%${like}%")
    }
}
