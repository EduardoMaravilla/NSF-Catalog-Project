select id_auxiliar ,auxiliar , level from auxiliaries a inner join levels l on a.level_id = l.id_levels;
select id_cars, model, name from cars c inner join makers m on c.maker_id = m.id_makers order by name asc;
select id_engines, bhp, liters, model, level from engines e inner join levels l on e.level_id = l.id_levels;
select id_gears, gear_value, level from gears g inner join levels l on g.level_id = l.id_levels;
select gp.id_granted_permissions, r.name, o.name, o.http_method from granted_permissions gp inner join roles r on gp.role_id = r.id_roles inner join operations o on gp.operation_id = o.id_operations;
select o.id_operations, o.http_method, m.base_path, o.path  from operations o inner join modules m on o.module_id = m.id_modules;
select s.id_suspensions, st.street_type, l.level from suspensions s inner join street_types st on s.street_type_id = st.id_street_types inner join levels l on s.level_id = l.id_levels;
select t.id_tires, st.street_type, l.level from tires t inner join street_types st on t.street_type_id = st.id_street_types inner join levels l on t.level_id = l.id_levels order by t.id_tires asc;
select t.id_turbos, tt.type, l.level from turbos t inner join turbo_types tt on t.turbo_type_id = tt.id_turbo_types inner join levels l on t.level_id = l.id_levels order by t.id_turbos asc;
     