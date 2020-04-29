FROM python:3-alpine

WORKDIR /usr/src/app
RUN apk add gettext
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt && \
    find . -maxdepth 2 -type d -name 'LC_MESSAGES' -exec bash -c 'msgfmt {}/unobot.po -o {}/unobot.mo' \;

COPY . .

CMD ["python", "bot.py"]
