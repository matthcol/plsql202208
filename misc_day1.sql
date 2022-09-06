set SERVEROUTPUT ON
alter session set NLS_DATE_FORMAT='YYYY-MM-DD';

select current_date from dual;
insert into stars (name, birthdate) values ('Morfydd Clark', '1990-03-17');
select * from stars where name like 'Morfydd%';

alter session set NLS_DATE_FORMAT='YYYY-MM-DD HH24:MI:SS';
select trunc(sysdate), sysdate, current_date, current_timestamp from dual;

-- sequence usage
select "MOVIE"."ISEQ$$_73704".nextval from dual;
select "MOVIE"."ISEQ$$_73704".currval from dual;

insert into movies (title, year) values ('Bullet Train', 2022);
select * from movies where year = 2022;
insert into movies (id, title, year) values (12771928, 'Bullet Train', 2022);

-- how to call a function 
-- test function count_movies
select count_movies from dual;

declare
    v_count number;
begin
    select count_movies into v_count from dual;
    dbms_output.put_line('Movie count: ' || v_count);
end;
/

-- test function count_movies_of_year
select count_movies_of_year(1984) from dual;

declare
    v_count number;
begin
    v_count := count_movies_of_year(2020);
    dbms_output.put_line('Movies of year 2020: ' || v_count);  
end;
/

declare
    v_count number;
begin
    for v_year in 1990 .. 1999
    loop
        v_count := count_movies_of_year(v_year);
        dbms_output.put_line('Movies of year ' || v_year || ': ' || v_count);  
    end loop;
end;
/

-- some variable declarations
declare
    type t_movie_simple is record (
        title movies.title%type,
        year movies.year%type,
        duration movies.duration%type
    );

    v_title movies.title%type;
    v_year movies.year%type;
    v_movie movies%rowtype; -- record with all columns of table movies (*)
    v_movie_simple t_movie_simple;
    v_movie_simple2 t_movie_simple;
    
begin
    select title, year into v_title, v_year from movies where id = 12771929;
    dbms_output.put_line('Title: ' || v_title || ', year: ' || v_year);
    select * into v_movie from movies where id = 22981;
    dbms_output.put_line('Title: ' || v_movie.title || ', year: ' || v_movie.year 
        || ', duration: ' || v_movie.duration);
    select title, year, duration into v_movie_simple from movies where id = 22981;
    dbms_output.put_line('Title: ' || v_movie_simple.title || ', year: ' || v_movie_simple.year 
        || ', duration: ' || v_movie_simple.duration);
    
    dbms_output.put_line('Title: ' || v_movie_simple2.title || ', year: ' || v_movie_simple2.year 
        || ', duration: ' || v_movie_simple2.duration);
end;
/

-- looking for missing/present directors
select * from stars where name = 'David Leitch';
select * from stars where name = 'Michel Hazanavicius';




















