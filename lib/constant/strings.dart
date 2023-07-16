class Strings{
  static const  sqlCreation= '''
  create table employee (
    id varchar2(14) primary key  ,
    managerId varchar2(14) references employee,
    name varchar2(50) not null ,
    salary number(8,2)
  );
  
  create table driver (
    id varchar2(14) primary key  ,
    name varchar2(50) not null
  );
  
  create table department (
    id varchar2(3) primary key  ,
    managerId varchar2(14) references employee,
    address varchar2(50) not null
  );
  
  create table product (
    id varchar2(5) primary key  ,
    name varchar2(50) not null,
    piece number(3,0),
    cartoon number(2,0),
    price number(7,2),
    weight number(5,0),
    costOfProduction number(7,5) 
  );
  
  create table produce(
    productId varchar2(5) references product,
    employeeId varchar2(14) references employee,
    history date not null,
    amount number(4,0),
    type number(1,0) ,
    primary key (productId, employeeId,history)
  );
  
  create table store(
    productId varchar2(5) references product,
    departmentId varchar2(3) references department,
    amount number(7,0),
    type number(1,0) ,
    primary key (productId, departmentId)

  );
  
  create table transfer(
    productId varchar2(5) references product,
    driverId varchar2(14) references driver,
    departmentId varchar2(3) references department,
    history date not null,
    amount number(5,0),
    type number(1,0) ,
    primary key (productId, driverId, departmentId,history)
  );
  
  ''';
}