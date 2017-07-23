-- --------------------------------------------------------------
-- 初始化数据
-- --------------------------------------------------------------

-- 插入书架表数据
INSERT  INTO `tb_shelf`(`shelfid`,`shelfname`) VALUES (1,'计算机类'),(2,'建筑类'),(3,'A架'),(4,'B架');


-- 插入图书类型表数据
INSERT  INTO `tb_booktype`(`typeid`,`typename`,`days`) VALUES (1,'计算机类',30),(3,'文学类',35),(4,'建筑类',20);


-- 插入出版信息表数据
INSERT  INTO `tb_publishing`(`isbn`,`pubname`) VALUES ('7-302','电子工业出版社'),('978-7','清华大学出版社');


-- 插入图书信息表数据
INSERT  INTO `tb_bookinfo`(`bookid`,`bookname`,`typeid`,`author`,`translator`,`isbn`,`price`,`page`,`shelfid`,`intime`,`operator`,`del`) 
VALUES ('4294967295','int最大数奥秘',1,'***','11','7-302',39.00,440,3,'2007-11-22','tsoft',0)
,('2147483648','Java学习指南',1,'***','11','7-302',39.00,440,3,'2007-11-22','tsoft',0)
,('2147483647','kjkj',1,'***','','7-302',12.00,0,1,'2007-11-22','tsoft',1)
,('2147483646','JSP啊',1,'***','','978-7',89.00,816,3,'2007-11-23','tsoft',0)
,('123','额',1,'11','11','7-302',11.00,11,1,'2007-12-18','tsoft',1)
,('001','建筑测试',4,'做做','的','7-302',11.00,11,4,'2013-05-03','java1234',0);


-- 插入读者类型表数据
INSERT  INTO `tb_readertype`(`rtypeid`,`rtypename`,`count`) VALUES (1,'学生',10),(2,'教师',20),(3,'其他',5);



-- 插入读者表数据
INSERT  INTO `tb_reader`(`rid`,`rname`,`gender`,`vocation`,`birthday`,`papertype`,`paperno`,`tel`,`email`,`createdate`,`remark`,`rtypeid`,`operator`) 
VALUES (1,'Bernard','男','的','1980-07-17','身份证','2201041980********','13634*******','wgh717@****.com','2007-11-22','的',1,'tsoft')
,(2,'苏菲','女','的','1983-02-22','身份证','220','','','2007-12-29','',2,'tsoft');


-- 插入图书借出表数据
INSERT  INTO `tb_borrow`(`swid`,`rid`,`bookid`,`borrowtime`,`limitbacktime`,`ifback`,`operator`) 
VALUES (1,1,1,'2007-11-22','2007-12-22',1,'tsoft'),(2,1,123,'2007-11-26','2007-12-26',0,'tsoft')
,(3,1,1,'2007-11-26','2007-12-26',0,'tsoft'),(4,2,123,'2007-12-29','2007-01-08',0,'Tsoft')
,(5,2,1,'2007-12-29','2008-01-28',0,'Tsoft'),(6,2,123,'2007-12-29','2008-01-28',1,'Tsoft')
,(7,1,123,'2013-05-03','2013-05-23',1,'java1234'),(8,1,123,'2013-05-03','2013-05-23',1,'java1234')
,(9,1,4294967295,'2013-05-03','2013-05-23',1,'java1234'),(10,1,1,'2013-05-03','2013-06-02',0,'java1234');

-- 插入图书归还表数据
INSERT  INTO `tb_return`(`swid`,`rid`,`bookid`,`backtime`,`operator`) 
VALUES (1,1,1,'2007-11-22','tsoft'),(6,2,123,'2007-01-03','Tsoft'),(7,1,123,'2013-05-03','java1234')
,(8,1,123,'2013-05-03','java1234'),(9,1,4294967295,'2013-05-03','java1234');

-- 插入管理员表数据
INSERT  INTO `tb_manager`(`mid`,`mname`,`mpwd`) VALUES (3,'java1234','1234'),(4,'tsoft','111');

-- 插入权限设置表数据
INSERT  INTO `tb_purview`(`mid`,`sysset`,`readerset`,`bookset`,`borrowback`,`sysquery`) VALUES (3,1,1,1,1,1),(4,1,1,1,1,1);

-- 插入办卡参数表数据
INSERT  INTO `tb_parameter`(`paraid`,`cost`,`validity`) VALUES (1,45,3);

-- 插入图书馆信息表数据
insert  into `tb_library`(`libraryid`,`libraryname`,`curator`,`tel`,`address`,`email`,`url`,`createdate`,`introduce`) 
values (1,'是','wgh','1363********','ccs','wgh717@****.com','http://','1999-05-06','是');