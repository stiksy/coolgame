# CoolGame

Solution proposed for the Build Engineer test:

1. Given the provided C++ project (named CoolGame/), create a CMake solution that is capable of building it and its tests.
2. Create a Jenkins job that takes this project and builds it and its tests (using the CMake solution from the first part). If the generation or compilation fails, the job should fail.

## How to get the party started

1. On a computer with Docker Desktop installed, run the following commands on a blank folder:

```
curl https://raw.githubusercontent.com/stiksy/coolgame/main/Dockerfile -o Dockerfile
docker build -t jenkins:local .
docker run -d --name jenkins --rm -p 8080:8080 jenkins:local
```

2. Navigate to http://localhost:8080 and login with `admin`/`password`
3. Trigger a new build for the CoolGame pipeline.
