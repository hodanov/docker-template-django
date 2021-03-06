# Development environment for django project using Docker compose.

This is the simple tool. You can build development environment for Django using these dockerfiles.

A container of Python-image installed Django and a container of PostgreSQL are created.

## Requirements

The file requires the following to run:

- docker and docker-compose

## Usage

### git clone this repository

To use this, clone the repo.

### Structure

```
.
├── db/
│   └── docker-entrypoint-initdb.d/
├── db.dockerfile
├── docker-compose.yml
├── requirements.txt
├── web/
└── web.dockerfile
```

### Usage

Executing the following command in the repository, two container will be built.

```
docker-compose up -d
```

Next, make the Django project.

```
docker container exec -it {CONTAINER_NAME} django-admin startproject {PROJECT_NAME}
```

you can see the files like below:

```
.
├── db/
│   └── docker-entrypoint-initdb.d/
├── db.dockerfile
├── docker-compose.yml
├── requirements.txt
├── web/
│   └── project_name/
│       ├── manage.py*
│       └── project_name/
│           ├── __init__.py
│           ├── settings.py
│           ├── urls.py
│           └── wsgi.py
└── web.dockerfile
```

Then, change `DATABASES` in __settings.py__.

```
DATABASES = {
    'default': {
    'ENGINE': 'django.db.backends.postgresql',
    'NAME': 'postgres',
    'USER': 'postgres',
    'PASSWORD': 'postgres',
    'HOST': 'db',
    'PORT': 5432,
  }
}
```

And then, change `ALLOWED_HOSTS` in __settings.py__ like below.

```
ALLOWED_HOSTS = ['localhost', '192.168.33.15', '[::1]']
```

Finally, execute the following command.

```
docker container exec -it {CONTAINER_NAME} python {PROJECT_NAME}/manage.py runserver 0.0.0.0:8000
```

Thank you.

## Author
[Hoda](https://hodalog.com/)
