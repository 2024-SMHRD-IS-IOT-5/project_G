create trigger comp
after insert on t_fan_power
for each row
begin

declare fan decimal(10, 2);
declare led decimal(10, 2);
declare comp decimal(10, 2);

select new.fan_power
into fan;

select led_power(value_column)
into led
from t_led_power
where led_power = led_power;

set comp = coalesce(led_power) + coalesce(fan_power);

insert into t_consimption (comp_power)
values (comp);
end;