

&НаКлиенте
Процедура РазделитьСтроку(Команда)
	
	СтрокаИсточник = Объект.СтрокаИсточник;
	Разделитель =  Объект.Разделитель; 
	
	ЧислоСтрок = Объект.ЧислоСтрокИтог;
	ЧислоКолонок = Объект.ЧислоКолонокИтог;
	
	Разместить = СтрокаВМассив(СтрокаИсточник, Разделитель);
	
	ЗаполнитьТабДок(Разместить);
	
	
КонецПроцедуры

Функция  СтрокаВМассив(СтрокаИсточник,Разделитель = ";");
	
	МассивСлов = Новый Массив;
	МассивРазделителей = Новый Массив;
	МассивРазделителей.Добавить(Символы.ВК);
	МассивРазделителей.Добавить(Символы.ВТаб);
	МассивРазделителей.Добавить(Символы.НПП);
	МассивРазделителей.Добавить(Символы.ПС);
	МассивРазделителей.Добавить(Символы.ПФ);
	МассивРазделителей.Добавить(Символы.Таб);
	МассивРазделителей.Добавить(Разделитель);
	
	
	Для каждого Символ  Из МассивРазделителей Цикл  
		
		РазделительИспользуется = СтрНайти(СтрокаИсточник,Символ);
		
		Если РазделительИспользуется <> 0 Тогда
			
			СтрокаИсточник = СтрЗаменить(СтрокаИсточник,Символ,Разделитель);
			
		КонецЕсли; 
		
	КонецЦикла;
	
	МассивСлов = СтрРазделить(СтрокаИсточник,Разделитель);
	
	Возврат МассивСлов;
	
	
КонецФункции

&НаСервере
Процедура ЗаполнитьТабДок(Разместить)	
	
	ТекущаяСтрока = 1;
	ТекущаяКолонка = 1; 
	
	ТабДок = Новый ТабличныйДокумент;
	
	Пока ТекущаяСтрока < Объект.ЧислоСтрокИтог Цикл		
		Пока ТекущаяКолонка < Объект.ЧислоКолонокИтог Цикл 
			Если Разместить.Количество()= 0 Тогда
				Прервать 
			КонецЕсли;
			ЗначениеЗаполнения = Строка(Разместить.Получить(0));
			ТекущийАдресОбласти = Строка("R"+(ТекущаяСтрока)+"C"+(ТекущаяКолонка)); 
			ТабДок.Область(""+ ТекущийАдресОбласти).Текст = ЗначениеЗаполнения; 
			Разместить.Удалить(0);
			ТекущаяКолонка = ТекущаяКолонка + 1;
		КонецЦикла; 
		// переходим на ПЕРВУЮ Колонку
		ТекущаяКолонка = 1;
		ТекущаяСтрока = ТекущаяСтрока + 1;	
	КонецЦикла;	
	
	
	ТабДок.ОтображатьСетку = Истина;
	ТабДок.Защита = Ложь;
	ТабДок.ТолькоПросмотр = Истина;
	
	Объект.ПредпросмотрФорма = ТабДок; 
	
КонецПроцедуры 






