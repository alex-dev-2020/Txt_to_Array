

&НаКлиенте
Процедура ПоказатьТабдок(Команда)
	ПоказатьТабдокНаСервере();
КонецПроцедуры

&НаСервере
Процедура ПоказатьТабдокНаСервере()  
	
	ТабДок = Новый ТабличныйДокумент;
	Итог = 0;
	Для К=1 По 10 Цикл
		ТабДок.Область("R"+(К+1)+"C1").Текст = "Строка "+К;
		ТабДок.Область("R"+(К+1)+"C2").Текст = К*10;
		Итог = Итог+К*10;
	КонецЦикла;
	ТабДок.ВставитьОбласть(ТабДок.Область("R2"), ТабДок.Область("R3"), 
	ТипСмещенияТабличногоДокумента.ПоГоризонтали);
	ТабДок.Область("R2C1").Текст = "Итого:";
	ТабДок.Область("R2C2").Текст = Итог;
	Рамка = Новый Линия(ТипЛинииЯчейкиТабличногоДокумента.Сплошная, 1);
	ТабДок.Область("R2C1:R2C2").Обвести(,Рамка,,Рамка); 
	ТабДок.ОтображатьСетку = Ложь;
	ТабДок.Защита = Ложь;
	ТабДок.ТолькоПросмотр = Истина;
	ТабДок.Показать("Пример использования метода ВставитьОбласть()");   
	
	Сообщить("Сформирован!");
КонецПроцедуры
