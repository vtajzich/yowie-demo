package com.vendavo.mesos.app.domain

import groovy.transform.CompileStatic

import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.Id

/**
 * Created by vtajzich
 */
@Entity
@CompileStatic
class Dvd {

    @Id
    int id
    String title
    String studio
    String released
    String status
    String sound
    String versions
    
    double price
    String rating
    String year
    String genre
    String aspect
    String upc
    String releasedDate
    Date timestamp
}
