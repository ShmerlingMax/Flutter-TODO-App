# TODO

## Ссылка на загрузку apk
- [apk](https://github.com/ShmerlingMax/Flutter-TODO-App/tree/main/apk)
- также apk можно загрузить из "Artifacts"

## Перечень сделанного
- Свайп по айтему Выполнено/Удалить
- Показ выполненных дел
- Реализована работа с бэкендом, данные отправляются/получаются с сервера
- Организовано сохранение данных на диск при помощи Hive
- Реализована работа с Remote Configs, работает переключение цвета важности при перезапуске приложения
	- fetchTimeout и minimumFetchInterval имеют значение равное одной минуте (для удобства тестирования)
- К проекту подключён и настроен Firebase Crashlytics, репортинг ошибок работает
- Приложение интернационализировано
	- используется пакет intl
- Реализована поддержка темной темы
	- для перезапуска приложения с новой темой необходимо встряхнуть устройство
- Реализована обработка серверных и прочих ошибок там, где они могут часто стрелять
- Приложение адекватно работает без интернета, при последующем запуске дошлётся то, что не смогло уйти в предыдущей сессии из-за ошибок/отсутствия сети
- Реализована поддержка лендскейп-ориентации
- Реализована поддержка больших экранов (планшеты)
- Навигация инкапсулирована в отдельной сущности и реализована с помощью Navigator 2.0
- Работа с данными организована в отдельной сущности, репозитории, инкапсулируя в одном месте получение и обновление/добавление данных на диск
- State-management реализован с использованием Bloc
- Есть DI
- Unit-тестами покрыты сущности с бизнес-логикой
- Реализован интеграционный тест
- Поддержан диплинк, открывающий экран добавления нового дела
	- Диплинк открывается даже если приложение было убито
	- Команда для проверки: adb shell am start -a android.intent.action.VIEW -c android.intent.category.DEFAULT -d "todo://example/task"
- Поддержаны 2 флейвора: для сборки тестинг и прод окружения
- Настроен CI на GitHub
- Добавлен инструмент для аналитики: Firebase
- Для дата-моделей используется пакет freezed

## Скриншоты
![screenshot](https://github.com/ShmerlingMax/Flutter-TODO-App/blob/main/screenshots/photo_2022-08-07_19-50-08.jpg)
![screenshot](https://github.com/ShmerlingMax/Flutter-TODO-App/blob/main/screenshots/photo_2022-08-07_19-50-10.jpg)
![screenshot](https://github.com/ShmerlingMax/Flutter-TODO-App/blob/main/screenshots/photo_2022-08-07_19-50-14.jpg)
![screenshot](https://github.com/ShmerlingMax/Flutter-TODO-App/blob/main/screenshots/photo_2022-08-07_19-50-19.jpg)
![screenshot](https://github.com/ShmerlingMax/Flutter-TODO-App/blob/main/screenshots/photo_2022-08-07_19-52-45.jpg)
![screenshot](https://github.com/ShmerlingMax/Flutter-TODO-App/blob/main/screenshots/photo_2022-08-07_19-50-20.jpg)
![screenshot](https://github.com/ShmerlingMax/Flutter-TODO-App/blob/main/screenshots/photo_2022-08-07_19-50-13.jpg)
![screenshot](https://github.com/ShmerlingMax/Flutter-TODO-App/blob/main/screenshots/photo_2022-08-07_19-50-15.jpg)
![screenshot](https://github.com/ShmerlingMax/Flutter-TODO-App/blob/main/screenshots/photo_2022-08-07_19-50-11.jpg)
![screenshot](https://github.com/ShmerlingMax/Flutter-TODO-App/blob/main/screenshots/photo_2022-08-07_19-50-17.jpg)
