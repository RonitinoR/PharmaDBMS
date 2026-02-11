use patient;

/*
setting up the primary and foreign keys for the below tables 
Also setting up the constraints to follow the referential integration like setting up
on delete cascade or on update cascade 
*/

alter table dimension_drug
add primary key (drug_ndc);

-- Modify the data type of drug_form_code
alter table dimension_drugadministration
modify column drug_form_code varchar(100);

alter table dimension_drugadministration
add primary key (drug_form_code);

alter table dimension_drugbrandgeneric
add primary key (drug_brand_generic_code);

alter table dimension_member
add primary key (member_id);

-- Add primary key
alter table fact_patientsprescription
modify column drug_form_code varchar(100);

alter table fact_patientsprescription
add primary key (member_id, drug_ndc, drug_form_code, drug_brand_generic_code);

-- Add foreign key constraints
alter table fact_patientsprescription
add constraint FK_member
foreign key (member_id) references dimension_member (member_id)
on delete cascade on update cascade;

alter table fact_patientsprescription
add constraint FK_drug
foreign key (drug_ndc) references dimension_drug (drug_ndc)
on delete cascade on update cascade;

alter table fact_patientsprescription
add constraint FK_drugadministration
foreign key (drug_form_code) references dimension_drugadministration (drug_form_code)
on delete cascade on update cascade;

alter table fact_patientsprescription
add constraint FK_drugbrandgeneric
foreign key (drug_brand_generic_code) references dimension_drugbrandgeneric (drug_brand_generic_code)
on delete cascade on update cascade;



#query no. 1
select d.drug_name, count(f.drug_ndc) as total_prescriptions
from fact_patientsprescription f
join dimension_drug d on f.drug_ndc = d.drug_ndc
group by d.drug_name
order by total_prescriptions desc;

#query no. 2
select 
case 
when m.member_age > 65 then "age 65+"
else "< 65"
end as age_group,
count(f.drug_ndc) total_prescription,
count(distinct f.member_id) total_members,
sum(f.copay) as sums_copay, sum(f.insurancepaid) as suminsurancepaid
from fact_patientsprescription f
join dimension_member m on f.member_id = m.member_id
group by age_group;

#query no. 3
select member_id, member_first_name, member_last_name, drug_name, fill_date as most_recent_fill_date,
insurancepaid as most_recent_insurance_paid
from (
select f.member_id, m.member_first_name, m.member_last_name, d.drug_name, f.fill_date, f.insurancepaid,
row_number() over (partition by f.member_id order by str_to_date(fill_date, '%m/%d/%Y') desc) as rn
from fact_patientsprescription f
inner join dimension_member m on f.member_id = m.member_id
inner join dimension_drug d on f.drug_ndc = d.drug_ndc
) as recent_entry
where rn =1;