#! /bin/bash
#  Перевіряє факт наявності передачі двох параметрів і тільки якщо обидва вказані - йде перехід  до перевірки наступної умови
if [ -n "$1" ] && [ -n "$2" ]
then
# Якщо користувач root - виподимо повідомлення про помилку, якщо будь який інший - виконується  основний  скрипт
case "$1" in
root ) 
echo "Finding “root” user data is not allowed!"
exit 52 ;;
# основний скрипт
*) 
# Приймаємо парметри - ім'я користувача та цільову директорію. Шукаємо файли, користувача в вказаній директорії
# та виводимо їх в термінал
usr="$1" 
dir="$2"
find_res=$(find $dir -user $usr)
echo "Files and directories  of user $usr in directory $dir:" 
for res in $find_res 
do 
echo "$res is found!"
done
echo "---------------------------------------------------------------------------------------------"
# Виводимо процеси заданого користувача в термінал
echo "Processes of user $usr:" 
ps -o pid,user,comm -u $usr ;;
esac
#  Якщо параметри введені не всі - видає помилку
else 
echo "No all parameters found."
exit 53
fi


