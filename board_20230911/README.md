```sql 
create table board_file_table(
id bigint primary key auto_increment,
originalFileName varchar(100),
storedFileName varchar(100),
boardId bigint,
constraint foreign key (boardId) references board_table(id) on delete cascade );
```
