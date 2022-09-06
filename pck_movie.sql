create or replace package pck_movie is

    procedure create_movie_with_director(
            p_title in movies.title%type,
            p_year in movies.year%type DEFAULT extract(year from sysdate),
            p_director_name in stars.name%type,
            p_id_movie out movies.id%type
        );
end pck_movie;
/

create or replace package body pck_movie is

    procedure create_movie_with_director(
        p_title in movies.title%type,
        p_year in movies.year%type DEFAULT extract(year from sysdate),
        p_director_name in stars.name%type,
        p_id_movie out movies.id%type
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
        p_id_movie := ISEQ$$_73704.currval;
    exception
        when TOO_MANY_ROWS  then 
            DBMS_OUTPUT.PUT_LINE('Several director with this name: ' || p_director_name);
        -- when others then 
        --    DBMS_OUTPUT.PUT_LINE('Erreur inconnue, code: '
        --        || SQLCODE
        --        || ', message: '
        --        || SQLERRM);
    end create_movie_with_director;


end pck_movie;
/

