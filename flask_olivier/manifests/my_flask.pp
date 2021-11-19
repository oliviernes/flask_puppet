exec { 'apt-update':

  command => '/usr/bin/apt-get update'

}

package { 'nginx':

  require => Exec['apt-update'],   
  ensure => installed,

}

service { 'nginx':

  ensure => running,

}

package { 'mysql-server':

  require => Exec['apt-update'],

  ensure => installed,

}


service { 'mysql':

  ensure => running,
}

package { 'python3':
  require => Exec['apt-update'], 

  ensure => installed,

}

package { 'python3-pip':
  require => Exec['apt-update'],                                                                               
                                                                                                              
  ensure => installed,                                                                                         
                                                                                                               
}

exec { 'flask':                                                                                                 command => '/usr/bin/pip install flask'                                            
}

exec { 'hello':                                                                                            
                                                                                                               
   command => '/usr/bin/python /home/Olivier-N/flask_hello/hello.py'                                           #  command => '/usr/bin/python /home/Olivier-N/Flask_site/Flask_site/my_flask_app.py'                                                                 
} 