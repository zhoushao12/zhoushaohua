exec dbms_service.create_server(
    service_name => 'proddb_rw',
    network_name => 'proddb_rw',
    aq_ha_notifications => TRUE,
    failover_method => 'BASIC',
    failover_type => 'SELECT',
    failover_retries => 30,
    failover_delay => 5
);

TNSNAMES=
