#Использовать logos

Перем Опции Экспорт;
Перем ОпцииИндекс Экспорт;

Перем Лог;

Процедура ПриСозданииОбъекта(ВходящиеОпции, Индекс)
	Опции = ВходящиеОпции;
	Лог.Отладка("Тип входящей опции: %1", ТипЗнч(ВходящиеОпции));
	
	ОпцииИндекс = Индекс;
КонецПроцедуры

Функция Поиск(Знач Аргументы, КонтекстПоиска) Экспорт

	Результат  = Новый Структура("РезультатПоиска, Аргументы", Ложь, Аргументы);

	РезультатПопыткиПоиска = ПопыткаПоиска(Аргументы, КонтекстПоиска);

	Если НЕ РезультатПопыткиПоиска.РезультатПоиска Тогда
		Возврат Результат;
	КонецЕсли;

	АргументыДляЦикла = РезультатПопыткиПоиска.Аргументы;
	Пока Истина Цикл

		РезультатПопыткиПоискаВЦикле = ПопыткаПоиска(АргументыДляЦикла, КонтекстПоиска);
		
		Если НЕ РезультатПопыткиПоискаВЦикле.РезультатПоиска Тогда
			Результат.РезультатПоиска = Истина;
			Результат.Аргументы = РезультатПопыткиПоискаВЦикле.Аргументы;
			Возврат Результат;
		КонецЕсли;
		
		АргументыДляЦикла = РезультатПопыткиПоискаВЦикле.Аргументы;

	КонецЦикла;
	
	Возврат Результат;

КонецФункции

Функция ПопыткаПоиска(Знач Аргументы, КонтекстПоиска)

	Результат = Новый Структура("РезультатПоиска, Аргументы", Ложь, Аргументы);
	
	Если Аргументы.Количество() = 0 
		ИЛИ КонтекстПоиска.СбросОпций Тогда
	
		Возврат Результат;

	КонецЕсли;

	Лог.Отладка("Тип опции: %1", ТипЗнч(Опции));

	Для каждого ОпцияПоиска Из Опции Цикл
		
		Если Не КонтекстПоиска.НеВключенныеОпции[ОпцияПоиска.Значение] = Неопределено Тогда
			Продолжить;
		КонецЕсли;

		Лог.Отладка("Ищу опцию %1", ОпцияПоиска.Ключ.Имя);
		Лог.Отладка("Ищу опцию тип %1", ОпцияПоиска.Значение);
		
		КлассПоиска = Новый ОпцияПарсера(ОпцияПоиска.Значение, ОпцииИндекс);
		РезультатПоиска = КлассПоиска.Поиск(Аргументы, КонтекстПоиска);
		
		Лог.Отладка("Длина аргументов <%1> ", Аргументы.Количество());
		Лог.Отладка("Результат поиска опции %1 = <%2>", ОпцияПоиска.Ключ.Имя, РезультатПоиска.РезультатПоиска);
		Лог.Отладка("Длина аргументов после поиска <%1> ", РезультатПоиска.Аргументы.Количество());
		
		Если РезультатПоиска.РезультатПоиска Тогда
			
			Если ОпцияПоиска.Значение.УстановленаИзПеременнойОкружения Тогда
				
				КонтекстПоиска.НеВключенныеОпции.Вставить(ОпцияПоиска.Значение, Истина);
	
			КонецЕсли;
			
			Возврат Новый Структура("РезультатПоиска, Аргументы", Истина, РезультатПоиска.Аргументы);
		КонецЕсли;

	КонецЦикла;


	Возврат Новый Структура("РезультатПоиска, Аргументы", Ложь, Аргументы);


КонецФункции



Функция Приоритет() Экспорт
	Возврат 2;
КонецФункции

Функция ВСтроку() Экспорт
	Представление = "-";

	Для каждого Опция Из Опции Цикл

		ИмяОпции = Опция.Ключ.Синонимы[0];
		Если СтрНачинаетсяС(ИмяОпции, "-") Тогда
			ИмяОпции = Сред(ИмяОпции,2);
		КонецЕсли;
			
		Представление = Представление + ИмяОпции;
			
	КонецЦикла;

	Возврат Представление;
КонецФункции

Лог = Логирование.ПолучитьЛог("oscript.lib.cli_class_options");
//Лог.УстановитьУровень(УровниЛога.Отладка);