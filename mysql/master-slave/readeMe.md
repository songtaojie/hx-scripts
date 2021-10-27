
一： 进入主库

1. 创建复制用户
    CREATE USER master IDENTIFIED BY 'root';

2. 赋予该用户复制的权利
    grant replication slave on *.* to 'master'@'%'  identified by 'root';
    grant replication slave on *.* to 'master'@'%';

3. 查看master 的状态
     show master status;

二： 进入从库

1. 进行配置
     CHANGE MASTER TO 
MASTER_HOST = '192.168.6.66',  
MASTER_USER = 'master', 
MASTER_PASSWORD = 'root',
MASTER_PORT = 3307,
MASTER_LOG_FILE='mysql-bin.000005',
MASTER_LOG_POS=1346,
MASTER_RETRY_COUNT = 60,
MASTER_HEARTBEAT_PERIOD = 10000; 
# MASTER_LOG_FILE='mysql-bin.000005',#与主库File 保持一致
# MASTER_LOG_POS=120 , #与主库Position 保持一致

2. 启动slave
    start slave;

3. 查看slave状态
    show slave status;


三： 辅助命令

1. 查看节点信息
show variables like 'server_id'; 

2. 设置节点信息
set global server_id=2; #此处的数值和my.cnf里设置的一样就行 


3. 从库只读
set global read_only=1;