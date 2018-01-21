## Title
Pharmeasy Assignment

### Summary
Build an application where the User’s data can be shared only if they approve it.
There are 3 types of users/roles:
1.    Patient/User
2.    Doctor
3.    Pharmacist


The Patient has medical records and prescriptions. If a doctor asks for a patient’s prescription, the patient has to approve it. Same goes with the Pharmacist, if the pharmacist wants to view the patient’s prescription, the patient has to approve it.


## Built With

* Django 1.11
* Python 3.4
* Linux 14.04.5
* MySQL database
* Bootstrap 3.3.7
* Jquery 2.2.3

### Running the service

To run the service make sure to have the above requriments. Clone the repository.
Create a virtual environment and install following modules using pip.
* widget_tweaks
* mysql client - To connect mysql with django.

Create database pharmeasydb and import file phareasydb.sql. Also change the user and password in file with location
```
pharmeasy/settings.py
```
Urls routing:
```
/login - to login user
/register - to register user
/upload - to upload prescription by patient
/share - to share the prescription with doctor or pharmacist of your choice.
/home - homepage for user
```

### test users
Password is "pharmeasy" for all the users.
* test_superuser                  |             Django-admin
* test_patient                 |             Patient 1
* test_patient2                |             Patient 2
* test_doctor                 |             Doctor 
* test_pharmacist                |             Pharmacist 

