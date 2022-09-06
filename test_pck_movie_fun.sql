select pck_movie.COUNT_MOVIES from dual;

declare
    v_count number;
begin
    for v_year in 1990 .. 1999
    loop
        v_count := pck_movie.count_movies_of_year(v_year);
        dbms_output.put_line('Movies of year ' || v_year || ': ' || v_count);  
    end loop;
end;
/

