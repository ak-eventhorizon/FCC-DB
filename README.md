# FCC-DB
freeCodeCamp - Relational Databases Projects

Repo for submit the URLs to https://www.freecodecamp.org/learn/relational-database/



**universe.sql** - Celestial Bodies Database project

**StudentDB1** - Student Database: Part 1\
**StudentDB2** - Student Database: Part 2\
**WorldCupDB** - World Cup Database project\
**KittyIpsum** - Kitty Ipsum Translator\
**BikeRental** - Bike Rental Shop\
**SalonSched** - Salon Appointment Scheduler project\
**SQLRefObject** - Learn Git by Building an SQL Reference Object\
**PeriodTableDB** - Periodic Table Database project\
**NumGuessing** - Number Guessing Game project

# Cheat sheet
## bash-terminal
**psql --username=freecodecamp --dbname=postgres** - подключение к СУБД\
\
**pg_dump -cC --inserts -U freecodecamp base_name > base_name.sql** - выгрузка базы в файл для возможности переноса\
\
**psql -U postgres < base_name.sql** - восстановление в СУБД базы из файла

## psql
**\l** - список баз на сервере\
\
**\c base_name** - подключиться к базе base_name\
\
**\d** - информация по таблицам в текущей базе\
\
**\d table_name** - информация по таблице table_name с указанием типов колонок, ключами и отношениями\
\
**\du** - список ролей и пользователей СУБД\
\
**\h** - помощь по SQL командам (SELECT, UPDATE, DROP и т.д.)\
\
**\\?** - помощь по командам оболочки psql (\d, \c, \l и т.д.)

## git
***git init*** - создать репозиторий в текущем каталоге\
\
***git status*** - текущий статус репозитория\
\
***git checkout branch_name*** - переключиться на ветку branch_name\
\
***git checkout -b new_branch_name*** - создать ветку new_branch_name и переключиться на нее\
\
***git add file_name*** - добавить file_name в staging area (область подготовленных к коммиту изменений)\
\
***git commit -m "message"*** - коммит с сообщением "message"\
\
***git log*** - журнал коммитов\
\
***git log --oneline*** - журнал коммитов в одну строку на коммит\
\
***git diff*** - показать изменения относительно последнего коммита\
\
***git branch*** - показать список веток\
\
***git branch new_branch*** - создать ветку new_branch\
\
***git branch -m new_branch_name*** - переименовать текущую ветку в new_branch_name\
\
***git branch -d branch_name*** - удалить ветку branch_name\
\
***git merge branch_name*** - влить branch_name в текущую ветку\
\
***git rebase master_name*** - перестроить текущую ветку на основе master_name, получить новые изменения из нее\
\
***git rebase --interactive HEAD~5*** - интерактивное перестроение (в редакторе nano) последних 5 коммитов, слияние (squash) нескольких коммитов в один можно сделать тут\
\
***git rebase --interactive --root*** - - интерактивное перестроение (в редакторе nano) всех коммитов начиная с первого, слияние (squash) нескольких коммитов в один можно сделать тут\
\
***git stash*** - берет изменённые отслеживаемые файлы и проиндексированные изменения, и сохраняет их в хранилище незавершённых изменений\
\
***git stash list*** - показывает хранилище ранее взятых изменения\
\
***git stash pop*** - применить припрятанные изменения и тут же удалить их из хранилища\
\
***git revert*** - откат сделанного коммита\
\
***git show*** - просмотр подробных данных о коммитах
