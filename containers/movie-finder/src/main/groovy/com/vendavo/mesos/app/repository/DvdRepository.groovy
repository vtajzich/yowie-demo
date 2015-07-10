package com.vendavo.mesos.app.repository

import com.vendavo.mesos.app.domain.Dvd
import org.springframework.data.repository.CrudRepository
import org.springframework.stereotype.Repository

/**
 * Created by vtajzich
 */
@Repository
interface DvdRepository extends CrudRepository<Dvd, Integer> {

    List<Dvd> findAllByTitleLike(String title)
}
