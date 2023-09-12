## table

```sql
drop table board_table;
create table board_table
(
    id            bigint primary key auto_increment,
    boardWriter   varchar(50),
    boardPass     varchar(20),
    boardTitle    varchar(50),
    boardContents varchar(500),
    createdAt     datetime default now(),
    boardHits     int      default 0,
    fileAttached  int      default 0
);
```