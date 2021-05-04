**Wild API**
----
  This API generates random passwords, it recieves password minimum length, and minimum uppercase, lowercase and digits to generates a password with a max length of 100 characters.
  To start up the service the first time use "docker-compose up --build" 

* **URL**

      http://localhost:3000/generate-password.json


* **Method:**
  
  `GET`
  
*  **URL Params**

       http://localhost:3000/generate-password.json?length=50&digits=10&lowercase=10&uppercase=10 

   **Required:**
 
   `length=[integer,no default, lower than 100, greater than 20, greater than digits+lowercase+uppercase]`
   
   `digits=[integer,no default, equal or greater than 10]`
   
   `uppercase=[integer,no default, equal or greater than 10]`
   
   `lowercase=[integer,no default, equal or greater than 10]`


* **Success Response:**
  
  * **Code:** 200 <br />
    **Content:** `{"password":"qJgUA5aG]B\u003eZ015VRE1b:XcA15U9M8i]qtS7ggQO:h5bee4HVg"}`
 
* **Error Response:**

   * **Code:** 403 FORBIDDEN <br />
    **Content:** `{"error":"Length Error!","status":403}`

  OR

  * **Code:** 403 FORBIDDEN <br />
    **Content:** `{"error":"Invalid Parameter","status":403}`

* **Sample Call:**

  http://localhost:3000/generate-password.json?length=50&digits=10&lowercase=10&uppercase=10 

* **Notes:**

  The upper limit put in the password length servers the purpose of avoid DNS attacks for resourse consumption or buffer overflow.
  
  I tested a few parameters injections to check API security. 
  
  The API validates all entry values to be integers.
  
  Furthermore the API validates carrelations withing tha password length and the amount of requiered characters.
  
  