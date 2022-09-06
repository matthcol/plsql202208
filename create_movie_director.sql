-- create movie with director
-- NB: can be done with a MERGE
create or replace procedure create_movie_with_director(
    p_title in movies.title%type,
    p_year in movies.year%type,
    p_director_name in stars.name%type
) is
    v_id_director stars.id%type;
begin
    -- check parameters
    if p_title is null or p_year is null then
        DBMS_OUTPUT.PUT_LINE('Can''t insert movie with no title or year');
        return;
    end if;
    -- director exists ?
    begin 
        select id into v_id_director from stars where name = p_director_name;
    exception
        when NO_DATA_FOUND then
            DBMS_OUTPUT.PUT_LINE('No director with this name: ' || p_director_name);
            insert into stars (name) values (p_director_name);
            v_id_director := ISEQ$$_73701.currval;
    end;
    insert into movies (title, year, id_director) values
            (p_title, p_year, v_id_director);
exception
    when TOO_MANY_ROWS  then 
        DBMS_OUTPUT.PUT_LINE('Several director with this name: ' || p_director_name);
    when others then 
        DBMS_OUTPUT.PUT_LINE('Erreur inconnue, code: '
            || SQLCODE
            || ', message: '
            || SQLERRM);
end;
/

-- test director  found
declare
begin
    create_movie_with_director('Bullet Train', 2022, 'David Leitch');
end;
/

-- test director  not found
declare
begin
    create_movie_with_director('OSS 117: Le Caire, nid d''espions', 2006, 'Michel Hazanavicius');
end;
/

-- test director  homonymes
declare
begin
    create_movie_with_director('Blitz', 2030, 'Steve McQueen');
end;
/

-- test other errors (NULL constraint exception)
declare
begin
    create_movie_with_director(NULL, NULL, 'David Leitch');
end;
/