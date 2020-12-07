# Bookstore
EECS4413 - Final Project



Download .zip file of this git repository.
Or git clone it.

Import .war from the downloaded zip file to Eclipse.

Make sure you have Apache Tomcat 8.5 or 9.0 downloaded on Eclipse IDE.
And MySQL is installed on your computer.

Run Bookstore.sql file in MySQL Workbench.
Then GO TO Eclipse where you import the project, open Java resources/src/DAO/DataConnect.java
And change line ("jdbc:mysql://localhost:3306/bookstore", "root", "root") to your MySQL server's (url,username,pass) format.

And then run Start.java in Java resources/src/ctrl/Start.java using Tomcat server.

If you have followed the steps perfectly it should work.

THANKS!!!
