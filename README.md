# UNIXlab
**lab1**   
Пример запуска из корневого католога ./bash.sh hello.c  
**lab2**     
Исходник main.cpp, уже скомпилированная out  
**lab4**      
Изначально были созданы configure.ac, Makefile.am и src/Makefile, далее следующие команды    
  
aclocal  
autoconf  
automake --add-missing  
./configure  
make  
  
**lab5**  
Билдим контейнер из корневого католога  
sudo docker build . -t new    
Запускаем  
sudo docker run -p 80:80 new python3 /code/manage.py runserver 0.0.0.0:80
