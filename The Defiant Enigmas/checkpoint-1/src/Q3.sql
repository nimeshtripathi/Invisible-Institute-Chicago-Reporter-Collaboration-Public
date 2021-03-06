select year, count(officer_id)
from (select officer_id, extract(year from start_date) as year
      from data_officerallegation
      group by officer_id, extract(year from start_date)
      having count(officer_id) >= /*allegation threshold*/ 5) as q
group by year
order by count(officer_id) desc
limit 1;
