FROM python:3.9.0

WORKDIR /home/

RUN echo "sandbox new repo new repo"

RUN git clone https://github.com/matt700395/sandbox2.git

WORKDIR /home/sandbox2/

RUN python -m pip install --upgrade pip

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

EXPOSE 8000

CMD ["bash", "-c", "python manage.py collectstatic --noinput --settings=web.settings.deploy&& python manage.py makemigrations --settings=web.settings.deploy && python manage.py migrate --settings=web.settings.deploy && gunicorn web.wsgi --env DJANGO_SETTINGS_MODULE=web.settings.deploy --bind 0.0.0.0:8000"]


