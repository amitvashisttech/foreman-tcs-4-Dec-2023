## Hammer CLI Utils for Foreman Command Line Access & Management 


### 1. List the avalible Users 
```
hammer user list 
```

### 2. Let update the Admin User Password 
```
hammer user update --password <New Password> --id <UserID>
```

Example: 
```
hammer user update --password redhat@123 --id 4
```
