create or replace FUNCTION COUNT_MOVIES RETURN NUMBER IS
    v_count number;
BEGIN
    select count(*) into v_count from movies;
    return v_count;
END COUNT_MOVIES;
/

create or replace function count_movies_of_year(p_year number) 
return number as
    v_count number;
begin
    select count(*) into v_count from movies where year = p_year;
    return v_count;
end count_movies_of_year;
/