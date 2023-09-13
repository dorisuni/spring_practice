```sql 
create table board_file_table(
id bigint primary key auto_increment,
originalFileName varchar(100),
storedFileName varchar(100),
boardId bigint,
constraint foreign key (boardId) references board_table(id) on delete cascade );
```

```sql
create table board_table
(
    id            bigint auto_increment
        primary key,
    boardWriter   varchar(50)                        ,
    boardPass     varchar(20)                        ,
    boardTitle    varchar(50)                        ,
    boardContents varchar(3000)                      ,
    createdAt     datetime default CURRENT_TIMESTAMP ,
    boardHits     int      default 0                 ,
    fileAttached  int      default 0                 
);
```

```sql
create table comment_table
(
    id             bigint auto_increment primary key,
    commentWriter  varchar(20)                        ,
    commentContents varchar(200)                       ,
    createdAt       datetime default CURRENT_TIMESTAMP,
    boardId        bigint                             ,
    constraint foreign key (boardId) references board_table(id) on delete cascade
);
```


