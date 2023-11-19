# HSA10   9. SQL Databases

# Homework 9

# 1. Run mysql in docker:
Download backup file by link: https://mega.nz/file/do93jKqY#aJhkdwXPXCzZztwaqO1Y3RwFHdmV3lsrw-wCYCEpCtE
or use init/init.sql to generate

gunzip backup.sql.gz && docker-compose up -d

# 2. Run mysql queries from queries.sql under mysql
docker exec -i mysql-local mysql -u hw8 -ppass hw8 < queries.sql

# Querying comparison

| Index          |     Type     |    Time |
|----------------|:------------:|--------:|
| Without index  |    Range     | 7800 ms |
| Without index  | Exact Match  | 7400 ms |
| BTREE          |    Range     |   10 ms |
| BTREE          | Exact Match  |    3 ms |
| HASH           |    Range     |   20 ms |
| HASH           | Exact Match  |    2 ms |

# innodb_flush_log_at_trx_commit

| innodb_flush_log_at_trx_commit value |  Time  |
|--------------------------------------|:------:|
| 0                                    | 60 sec |
| 1                                    | 90 sec |
| 2                                    | 50 sec |