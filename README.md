# Fyle Backend Challenge Submission
By 
Name : Aditya Vijay Kalambkar
Email : kalambkar26@gmail.com

This is a submission for the Fyle Backend Challenge. I managed to complete all tasks and objectives assigned to me in this challenge. Lets look at them one by one.

1. To add missing APIs.
    -> I added all the missing APIs and are displayed below.

    GET /principal/assignments  and  POST /principal/assignments/grade
    ![Missing API 1 and 3](<images/Missing API 1 and 3.png>)

    GET /principal/teachers
    ![Missing API 2](<images/Missing API 2.png>)


2. To add tests for grading API.
    -> I added 2 APIs
        - First is where teacher wants to **grade** an assignment in 'SUBMITTED' state.
        - Second is where a **student** wants to **grade** an assignment which is forbidden.
        ![Grade API tests](<images/Grade API tests.png>)


    -> I also added 4 more tests to handle edge cases which also increased coverage results.
        - Below screenshot contains the First, where student tries to **edit his assignmen**t with state 'SUBMITTED' or 'GRADED'
        ![Extra tests 1](<images/Extra tests 1.png>)
        - Below screenshot contains Second, Third and Fourth, which are to **list all teachers** by principal, to list all teachers by principal with **empty/invalid headers(auth errors)** and to list all teachers by principal through **unknown API** endpoint respectively.
        ![Extra tests 2,3,4](<images/Extra tests 2,3,4.png>)
    So in total, there are **24** tests.


3. All intentional bugs in the application, which lead to test failures, are being addressed and rectified. Please see the test Results and Coverage reports below.


4. To make sure all the tests are passed.
    -> All the tests are passed and are displayed below.
    ![Test Results upper part](<images/Test Results 0.png>)
    ![Test Results lower part](<images/Test Results 1.png>)


5. To get test coverage to 94% or above.
    -> I managed to get test coverage to **97%**. Below is the screenshot of the Coverage reports.
    ![Coverage Reports upper part](<images/Coverage Reports 0.png>)
    ![Coverage reports lower part](<images/Coverage Reports 1.png>)


6. To write SQL in the count_grade_A_assignments_by_teacher_with_max_grading.sql and number_of_graded_assignments_for_each_student.sql.
    -> I wrote SQL queries for both the files and are displayed below.
    ![SQL test 1](<images/SQL test 1.png>)
    count_grade_A_assignments_by_teacher_with_max_grading.sql
    ![SQL test 2](<images/SQL test 2.png>)
    number_of_graded_assignments_for_each_student.sql


7. Optional task was to Dockerize the application by creating a Dockerfile and a docker-compose.yml file
    -> Geven below are the screenshots of Dockerfile and docker-compose.yml
    ![Dockerfile](<images/Dockerfile.png>)
    ![docker-compose](<images/docker-compose.png>)


    Follow these steps to building and running application using Docker
    1. Clone this repository and navigate to the cloned directory using below command 
    ```console
    git clone https://github.com/WitcherAdi26/fyle-interview-intern-backend.git
    cd fyle-interview-intern-backend
    ```
    2. You need to [Install](https://www.docker.com/products/docker-desktop/) Docker Dekstop. If you already have it then run docker desktop.
    3. Run below command to build the image and start the containers
    ```console
    docker-compose up --build
    ```

    After following these steps your application will be listening on http://0.0.0.0:7755 and you would get these logs.
    ![Docker App Startup](<images/Docker App Startup.png>)




<!-- # Fyle Backend Challenge

## Who is this for?

This challenge is meant for candidates who wish to intern at Fyle and work with our engineering team. You should be able to commit to at least 6 months of dedicated time for internship.

## Why work at Fyle?

Fyle is a fast-growing Expense Management SaaS product. We are ~40 strong engineering team at the moment. 

We are an extremely transparent organization. Check out our [careers page](https://careers.fylehq.com) that will give you a glimpse of what it is like to work at Fyle. Also, check out our Glassdoor reviews [here](https://www.glassdoor.co.in/Reviews/Fyle-Reviews-E1723235.htm). You can read stories from our teammates [here](https://stories.fylehq.com).


## Challenge outline

**You are allowed to use any online/AI tool such as ChatGPT, Gemini, etc. to complete the challenge. However, we expect you to fully understand the code and logic involved.**

This challenge involves writing a backend service for a classroom. The challenge is described in detail [here](./Application.md)


## What happens next?

You will hear back within 48 hours from us via email. 


## Installation

1. Fork this repository to your github account
2. Clone the forked repository and proceed with steps mentioned below

### Install requirements

```
virtualenv env --python=python3.8
source env/bin/activate
pip install -r requirements.txt
```
### Reset DB

```
export FLASK_APP=core/server.py
rm core/store.sqlite3
flask db upgrade -d core/migrations/
```
### Start Server

```
bash run.sh
```
### Run Tests

```
pytest -vvv -s tests/

# for test coverage report
# pytest --cov
# open htmlcov/index.html
``` -->
