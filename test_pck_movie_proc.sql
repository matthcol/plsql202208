-- test director  found
declare
    v_id_movie movies.id%type;
begin
    pck_movie.create_movie_with_director(
        p_title => 'Bullet Train', 
        p_director_name =>  'David Leitch', 
        p_id_movie => v_id_movie);
    DBMS_OUTPUT.put_line('Movie id: ' || v_id_movie);
end;
/

-- test director  not found
declare
    v_id_movie movies.id%type;
begin
    pck_movie.create_movie_with_director(
        p_title => 'OSS 117: Le Caire, nid d''espions', 
        p_year => 2006, 
        p_director_name => 'Michel Hazanavicius', 
        p_id_movie => v_id_movie);
    DBMS_OUTPUT.put_line('Movie id: ' || v_id_movie);
end;
/

-- test director  homonymes
declare
    v_id_movie movies.id%type;
begin
    pck_movie.create_movie_with_director('Blitz', 2030, 'Steve McQueen', v_id_movie);
    DBMS_OUTPUT.put_line('Movie id: ' || v_id_movie);
end;
/

-- test NULL parameters (NULL constraint exception)
declare
    v_id_movie movies.id%type;
begin
    pck_movie.create_movie_with_director(NULL, NULL, 'David Leitch', v_id_movie);
    DBMS_OUTPUT.put_line('Movie id: ' || v_id_movie);
end;
/

-- test other errors (length title)
declare
    v_id_movie movies.id%type;
begin
    pck_movie.create_movie_with_director('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh',
         2022, 'David Leitch', v_id_movie);
    DBMS_OUTPUT.put_line('Movie id: ' || v_id_movie);
end;
/