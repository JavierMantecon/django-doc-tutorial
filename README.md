# Django docs tutorial
Notes taken while following the Django docs tutorial.
### Automatic reloading of runserver.
> The development server automatically reloads Python code for each request as needed. You don’t need to restart the server for code changes to take effect. However, some actions like adding files don’t trigger a restart, so you’ll have to restart the server in these cases.
> 
### DB related commands
For the tutorial there are migrations files for initial setup. Need to migrate them to make them effective.
`python manage.py migrate`

For creating migration files for new models after setting them up on app "polls".
If it wasn't a creation, and it was an edition or deletion, it would capture the changes incrementally.
It's like a history of changes.
`python manage.py makemigrations polls`

For checking the SQL commands that would be executed after creating models, like a "dry run".
It takes the app name and the migration file name. 0001 was created previously with `makemigrations`.
`python manage.py sqlmigrate polls 0001`

Checking any problems in the project without making migrations or touching the database:
`python manage.py check`

For migrating previously created migrations, again:
`python manage.py migrate`

To summarize:
1. Change your models (in models.py).
2. Run `python manage.py makemigrations` to create migrations for those changes
3. Run `python manage.py migrate to apply` those changes to the database.

### Django admin

Create a superuser to access the admin site:
`python manage.py createsuperuser`

For making a model modifiable in the admin interface, it needs to be registered with `admin.site.register()`. Like this:
```
from django.contrib import admin
from .models import Question
admin.site.register(Question)
```