class profile::mongoserver {

file { '/data':
        ensure  => directory,
        mode    => 0755,
        owner   => 'root',
        group   => 'root',
}

mongodb_replset { DPP:
        ensure  => present,
        members => ['10.20.1.19:27017', '10.20.1.20:27017', '10.20.1.21:27017'],
        }

class { '::mongodb::server':
        port            => 27017,
        verbose         => true,
        replset         => 'DPP',
        dbpath          => '/data/db/',
        fork            => true,
        journal         => true,
        smallfiles      => false,
        logpath         => '/var/log/mongodb/mongodb.log',
        bind_ip         => ["0.0.0.0"]
}

mongodb_database { 'InsightDBQA':
        ensure   => present,
        tries    => 10,
        require  => Class['mongodb::server'],
}
}
