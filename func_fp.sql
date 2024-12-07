drop function if exists year_diff;
delimiter //
create function year_diff(input_date int)
returns int
no sql
begin
    declare res int;
    set res = timestampdiff(year, makedate(input_date, 1), current_date());
    return res;
end //

select year, year_diff(year) as year_difference from details;