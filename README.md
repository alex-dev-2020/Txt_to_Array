
#####  Постановка Задачи

- Выгрузить слова из текста c разделителями из поля вовда на форме в таблицу произвольной размерности построчно. Предполагается наличие в исходном тексте дефолтных разделителей (`Символы.`) 
    - На  форме дополнительно пользователем указывается
        - Размерность 
        - Разделитель *(помимо дефолтных)*


##### Реализация

- [Пример](https://github.com/alex-dev-2020/Txt_to_Array/commit/255ac486e2142a36bbd762026eb52d69f498162b) процедуры формирования и заполнения Табличного Документа из Синтакс-Помощника


- Создаем Обработку
    - Форма
        - [Модуль формы](https://github.com/alex-dev-2020/Txt_to_Array/commit/af6005cd30a826c0041c93cc7c55b3c9af10125e)
            - Клиент 
                - Обрабатываем нажатие
                    - Забираем с Формы Параметры
                    - Вызываем Функцию `СтрокаВМассив` 
                        - аргументы:
                            - `СтрокаИсточник`
                            -  `Разделитель`  - дефолтное значение `;`
                        - Формируем Массив дефолтных разделителей `Символы.`
                            - ~~tb  cntd → можно заполнить в цикле~~  обход в Цикле недоступен
                        - перебираем Строку-источник для каждого Элемента в Массиве разделителей
                            - ищем Элемент (`СтрНайти`)
                            - если нашли меняем на `;`/ введенный пользователеем *(случай  для нескольких Значений Разделителя)*
                        - После  Цикла разбираем Строку-источник в Массив, используя  `СтрРазделить`
                    - Возвращаем Массив слов
            - Сервер 
                - Вызываем процедуру формирования Табличного Документа
                        - аргумент Массив строк
                    - Инициализируем Итераторы Строки/Колонки
                        - [√]  можно с единицы считать 
                        - *не  забыть Итератор для  случая перехода на новую строку*
                    - Обходим слева направо  ячейки  Табличного Документа
                        - Вкладываем внутрь цикла по Строкам Цикл по Колонкам 
                            - проверям, что Элементы в Массиве Слов есть 
                            - Адрес Текущей Ячейки : R(Номер Строки)С(Номер Колонки)
                            - Записываем в Ячейку Элемент Массива Слов с нулевым индексом 
                            - Удалем из Массива Слов Элемент с нулевым индексом
                - Указываем Параметры Табличного Документа
                    - Отображение Сетки
                    - Защита 
                    - Возможность Редактирования
                - Табличный Документ Сформирован
                - отдаем Табличный Документ на форму




  
