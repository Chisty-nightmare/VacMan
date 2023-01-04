	select * from vaccine
	select * from inventory
	select * from hospital
	select * from doctor
	select * from side_effects

	select * from accounts
	delete from inventory
	  
    select * from hospital 
	select * from customer
	select * from orders
	select * from inventory
	select vaccine.vaccine_id,batch_id,manufacturer_id,manufacture_name,importer_id,importer_name,vaccine_type,cost from vaccine inner join inventory on vaccine.vaccine_id=inventory.vaccine_id where inventory.hospital_id='CVDH101'
	select * from medical_history

	select top 5 vaccine_id from inventory

	create table vaccine(
		vaccine_id varchar(10) primary key,
		batch_id varchar(10),
		manufacturer_id varchar(5),
		manufacture_name varchar(25),
		importer_id varchar(10),
		importer_name varchar(25),
		vaccine_type varchar(25),
		cost float,

	);

	select * from vaccine  where vaccine_id not in(select vaccine_id from inventory union select vaccine_id from accounts ) and batch_id='B2'


	select * from vaccine  where vaccine_id not in(select vaccine_id from inventory union select vaccine_id from accounts )


	select hospital_name from orders inner join hospital on hospital.hospital_id=orders.hospital_id where customer_id='CVDC3'
	

	select count(*) from inventory
	delete from inventory where vaccine_id in('V102')

	insert into inventory values('H101','V101'),('H101','V102'),('H101','V101')
	insert into inventory values('CVDH101','V102')


	select * from inventory where hospital_id='CVDH101'

	insert into vaccine 
	values('V1017','B3','M221','WHO','I22','DGDA','VIRAL VECTOR',250)
	
	
	insert into orders values('CDVO5','CVDC5','CVDH101')


	insert into accounts values('T1','CVDC1','CVDH101','V101',250,15 ,getDate())


	create table hospital(
		hospital_id varchar(10) primary key,
		hospital_name varchar(25),
		hospital_adress varchar(80),
		hospital_mail varchar(80),
		hospital_username varchar(25),
		hospital_pass varchar(80),
	);

	insert into hospital(hospital_id, hospital_name, hospital_adress, hospital_mail, hospital_username, hospital_pass) 
	values ('CVDH102','Ibn Sina Hospital','Dhaka','ibnsina@gmail.com','ibnsina','457')




		create table customer(
		customer_id varchar(10) primary key,
		customer_name varchar(25),
		customer_adress varchar(30),
		customer_phn_no varchar(15),
		date_of_birth date,
		gender varchar(10),
		NID varchar(25),
		
		customer_mail varchar(80) unique,
		customer_username varchar(25) unique,
		customer_pass varchar(80),
	
	);

    select customer_name,datediff(year,date_of_birth,getdate()) as age,gender,customer_adress from customer inner join orders on customer.customer_id=orders.customer_id inner join hospital on orders.hospital_id=hospital.hospital_id where hospital.hospital_id='CVDH101'
	select* from inventory 
	select * from customer



	insert into customer(customer_id, customer_name, customer_adress, customer_phn_no, date_of_birth, gender, NID, customer_mail, customer_username, customer_pass)
	values ('CVDC5', 'nirob', 'badda', '018xxxxxxxx', '12-03-1998','male','018888888888888', 'nirob@gmail.com', 'nirob','123456')


	SELECT * from customer where customer_username='asdf' or customer_mail = 'asdf@gmail.com' and customer_pass='123456'

	SELECT COUNT(customer_id) FROM customer;
	SELECT COUNT (*) AS customercount FROM customer;
	SELECT MAX(customer_id) FROM customer;

	DELETE from customer where customer_username='asdff'

		SELECT customer_id from customer where customer_username='asdf' or customer_mail = 'asdf@gmail.com'




		create table orders(

		order_id varchar(10) primary key,
		customer_id varchar(10) unique,
		hospital_id varchar(10) ,
		foreign key (customer_id) references customer
		on delete cascade,
		foreign key (hospital_id) references hospital
		on delete cascade
		);
	
	





	create table inventory(
		hospital_id varchar(10),
		vaccine_id varchar(10) unique,
		foreign key (hospital_id) references hospital
		on delete cascade,
		foreign key (vaccine_id) references vaccine
		on delete cascade
	);



	create table doctor(
		doctor_id varchar(10) primary key,
		doctor_name varchar(25),
		hospital_id varchar(10),
		designation varchar(25),
		advising_hour varchar(40),
		doctor_phn_no varchar(15),
		doctor_mail varchar(80),
		doctor_username varchar(25),
		doctor_pass varchar(80),
		foreign key (hospital_id) references hospital
		on delete cascade
	);


	
	insert into doctor(doctor_id, doctor_name, designation ,doctor_phn_no, doctor_mail, doctor_username, doctor_pass)
	values ('CVDD1', 'asdf', 'Medical Student', '018xxxxxxxx', 'asdf@gmail.com', 'asdf','123')
	select * from doctor
	SELECT * from doctor where doctor_username='asdf' or doctor_mail = 'asdf@gmail.com' and doctor_pass='123'




	create table accounts(
		transaction_id varchar(10) primary key,
		customer_id varchar(10) unique,
		hospital_id varchar(10),
		vaccine_id varchar(10),
		sale float,
		vat float,
		dose_info date,
		foreign key (vaccine_id) references vaccine,
		foreign key (hospital_id) references hospital,
		foreign key (customer_id) references customer,

	);


	

	 
	select * from accounts
	drop table accounts


	insert into accounts values('transaction_id','customer_id','hospital_id','vaccine_id',sale,vat,'does_info')



	create table side_effects(
		effects_id varchar(10) primary key,
		customer_id varchar(10),
		effects varchar(80),
		foreign key (customer_id) references customer
		on delete cascade,
	);

	 
	 select * from accounts 
	  select * from side_effects
	   select * from customer  


	   select customer.customer_name, datediff(year,customer.date_of_birth,GETDATE()) as age, vaccine.vaccine_id, vaccine.vaccine_type, side_effects.effects, vaccine.manufacture_name, vaccine.batch_id from side_effects inner join customer on side_effects.customer_id=customer.customer_id inner join accounts on customer.customer_id=accounts.customer_id inner join vaccine on accounts.vaccine_id=vaccine.vaccine_id

	   select count(*) from accounts 
	   select count(*) from side_effects



	create table medical_history(
		corona_history varchar(10),
		other_diseases varchar(80),
		customer_id varchar(10),
		foreign key (customer_id) references customer
		on delete cascade,
	);

insert into hospital(hospital_id,hospital_name,hospital_adress) 
values ('H103','Labaid Hospital','Dhaka')

select hospital_name from hospital where hospital_adress = 'Dhaka'