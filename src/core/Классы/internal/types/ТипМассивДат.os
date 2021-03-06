
Перем ОписаниеОшибкиКласса;
Перем ФорматДаты;

Процедура ПриСозданииОбъекта(Знач ВходящийФорматДаты = "yyyy-MM-dd HH:mm:ss")
	
	ФорматДаты = ВходящийФорматДаты;

КонецПроцедуры

Функция ВСтроку(Знач Значение) Экспорт
	
	Возврат ПреобразоватьМассивВСтроку(Значение);
	
КонецФункции

Функция УстановитьЗначение(Знач ВходяшееЗначние, Значение) Экспорт

	Попытка
		ВходяшееЗначние = РаботаСДатой.СтрокаВДату(ВходяшееЗначние, ФорматДаты);
		Значение.Добавить(ВходяшееЗначние);
	Исключение
		Значение = Дата("20010101");
		ОписаниеОшибкиКласса = ОписаниеОшибки();
	КонецПопытки;
	
	Возврат Значение;

КонецФункции 

Функция Ошибка(ЕстьОшибка = Ложь) Экспорт

	Если НЕ ПустаяСтрока(ОписаниеОшибкиКласса) Тогда
		ЕстьОшибка = Истина;
	КонецЕсли;

	Возврат ОписаниеОшибкиКласса;
	
КонецФункции

Функция ПреобразоватьМассивВСтроку(Знач Значение)

	Если НЕ ТипЗнч(Значение) = Тип("Массив") Тогда
		Возврат "";
	КонецЕсли;

	Для каждого ЭлементМассива Из Значение Цикл
		
		ЭлементМассива = Формат(ЭлементМассива, ФорматДаты);

	КонецЦикла;

	Возврат СтрСоединить(Значение, ", ");

КонецФункции

ОписаниеОшибкиКласса = "";