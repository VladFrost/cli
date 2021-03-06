#использовать "../src/core"
#Использовать asserts
#Использовать logos
#Использовать delegate

Перем юТест;
Перем Лог;

Функция ПолучитьСписокТестов(Знач Тестирование) Экспорт

	юТест = Тестирование;
	
	ИменаТестов = Новый Массив;
	
	// Скорость выполнения команды
	ИменаТестов.Добавить("ТестДолжен_ПроверитьСкоростьРаботуКомандыПриложения");
		
	// Работа с опциями и аргументами
	// ИменаТестов.Добавить("ТестДолжен_ПроверитьПолучениеЗначенияАргументаПоИмени");
	// ИменаТестов.Добавить("ТестДолжен_ПроверитьПолучениеЗначенияОпцииПоИмени");

	// ИменаТестов.Добавить("ТестДолжен_ПроверитьУстановкуЗначенийОпций");
	// ИменаТестов.Добавить("ТестДолжен_ПроверитьУстановкуМножественныхЗначенийОпций");
	// ИменаТестов.Добавить("ТестДолжен_ПроверитьУстановкуЗначенийАргументов");
	// ИменаТестов.Добавить("ТестДолжен_ПроверитьУстановкуМножественныхАргументовОпций");
	
	// ИменаТестов.Добавить("ТестДолжен_ПроверитьГруппировкуОпций");
	
	// ИменаТестов.Добавить("ТестДолжен_ПроверитьНеобязательностьОпций");
	// ИменаТестов.Добавить("ТестДолжен_ПроверитьНеобязательностьАргументов");

	// ИменаТестов.Добавить("ТестДолжен_ПроверитьВзаимоисключающиеОпции");
	// ИменаТестов.Добавить("ТестДолжен_ПроверитьПовторяемыеВзаимоисключающиеОпции");
	
	// ИменаТестов.Добавить("ТестДолжен_ПроверитьРаботуСОднимТиреВАргументах");
	// ИменаТестов.Добавить("ТестДолжен_ПроверитьСбросОпцийПередАргументами");
	// ИменаТестов.Добавить("ТестДолжен_ПроверитьСбросМножественныхОпций");
	
	// ИменаТестов.Добавить("ТестДолжен_СтандартнуюСтрокуИспользования");
	// ИменаТестов.Добавить("ТестДолжен_СложныеСлучаиФормированияСтрокиИспользования");

	// ИменаТестов.Добавить("ТестДолжен_ПроверитьВыводСправки");
	// ИменаТестов.Добавить("ТестДолжен_ПроверитьВыводВерсии");

	// ИменаТестов.Добавить("ТестДолжен_ПроверитьВыполнениеОбработчикаПередВыполнениемКоманды");
	// ИменаТестов.Добавить("ТестДолжен_ПроверитьВыполнениеОбработчикаПослеВыполненияКоманды");


	Возврат ИменаТестов;

КонецФункции

Процедура ВыполнитьКоманду(Знач ВыполняемаяКоманда) Экспорт
	Лог.Отладка("Полезная работа команды: %1", ВыполняемаяКоманда.ПолучитьИмяКоманды());	
КонецПроцедуры 

Процедура ТестДолжен_ПроверитьСкоростьРаботуКомандыПриложения() Экспорт
	
	Спек = "[--login] [--realm] [--note] [--no-copy] [--gen [--length] [--min-length] [--max-length] [--no-upper] [--no-lower] [--no-digit] [--no-symbol] [--no-similar] [--min-upper] [--max-upper] [--min-lower] [--max-lower] [--min-digit] [--max-digit] [--min-symbol] [--max-symbol] [--exclude]]";
	ИмяПроцедурыОбъекта = "КомандаСкоростьРаботуКомандыПриложения";

	ТестовыеСлучаи = Новый Массив;

	
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("", Спек, Истина));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("--gen", Спек, Истина));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("--gen --length 42", Спек, Истина));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("--length 42 --gen", Спек, Истина));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("--min-length 10 --length 42 --gen", Спек, Истина));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("--min-length 10 --no-symbol --no-lower --length 42 --gen", Спек, Истина));
	
	Для каждого Тест Из ТестовыеСлучаи Цикл
		
		РезультатВыполнения = ВыполненаКомандаПриложения(Тест.Спек, ИмяПроцедурыОбъекта, Тест.Аргументы);

		Утверждения.ПроверитьРавенство(РезультатВыполнения, Тест.Результат, "Команда должна выполниться успешно! Входящие аргументы" + СтрСоединить(Тест.Аргументы));

	КонецЦикла;



КонецПроцедуры

Функция АргументыИзСтроки(СтрокаАргументов)

	Возврат СтрРазделить(СтрокаАргументов, " ");
	
КонецФункции


Функция ТестовыйСлучай(Знач Аргументы, Знач Спек, Знач Результат)
	
	Тест = Новый Структура;
	Тест.Вставить("Аргументы", СтрРазделить(Аргументы," "));
	Тест.Вставить("Спек", Спек);
	Тест.Вставить("Результат", Результат);

	Возврат Тест;
КонецФункции


Функция ВыполненаКомандаПриложения(Спек, ИмяПроцедурыОбъекта, Аргументы)
	
	Команда = Новый КомандаПриложения("test", "Тестовая команда", ЭтотОбъект);
	
	ПараметрыВыполнения = Новый Массив;
	ПараметрыВыполнения.Добавить(Команда);

	ОписаниеКоманды = Делегаты.Создать(ЭтотОбъект, ИмяПроцедурыОбъекта);
	ОписаниеКоманды.Исполнить(ПараметрыВыполнения);

	Команда.Спек = Спек;

	Команда.НачалоЗапуска();
	Попытка
		Команда.Запуск(Аргументы);
	Исключение
		Сообщить(ОписаниеОшибки());
		Возврат Ложь;
	КонецПопытки;
	
	Возврат Истина;

КонецФункции

Процедура КомандаСкоростьРаботуКомандыПриложения(Знач ВыполняемаяКоманда) Экспорт
	
	login = ВыполняемаяКоманда.Опция("login", "", "Login for credential, e.g. username or email.").ТСтрока();
	realm = ВыполняемаяКоманда.Опция("realm", "", "Realm for credential, e.g. website or WiFi AP name.").ТСтрока();
	note = ВыполняемаяКоманда.Опция("note", "", "Note for credential.").ТСтрока();
	noCopy = ВыполняемаяКоманда.Опция("no-copy", false, "Do not copy generated password to the clipboard.").Флаг();
	gen = ВыполняемаяКоманда.Опция("gen", false, "Generate a password.").Флаг();
	length = ВыполняемаяКоманда.Опция("length", 0, "Password length.").Тчисло();
	minLength = ВыполняемаяКоманда.Опция("min-length", 30, "Minimum length password.").Тчисло();
	maxL = ВыполняемаяКоманда.Опция("max-length", 40, "Maximum length password.").Тчисло();
	noUpper = ВыполняемаяКоманда.Опция("no-upper", false, "Exclude uppercase characters in password.").Флаг();
	noLow = ВыполняемаяКоманда.Опция("no-lower", false, "Exclude lowercase characters in password.").Флаг();
	noDigit = ВыполняемаяКоманда.Опция("no-digit", false, "Exclude digit characters in password.").Флаг();
	noSymbol = ВыполняемаяКоманда.Опция("no-symbol", false, "Exclude symbol characters in password.").Флаг();
	noSimilar = ВыполняемаяКоманда.Опция("no-similar", false, "Exclude similar characters in password.").Флаг();
	minUpper = ВыполняемаяКоманда.Опция("min-upper", 0, "Minimum number of uppercase characters in password.").Тчисло();
	maxUpper = ВыполняемаяКоманда.Опция("max-upper", -1, "Maximum number of uppercase characters in password.").Тчисло();
	minLow = ВыполняемаяКоманда.Опция("min-lower", 0, "Minimum number of lowercase characters in password.").Тчисло();
	maxLow = ВыполняемаяКоманда.Опция("max-lower", -1, "Maximum number of lowercase characters in password.").Тчисло();
	minDigit = ВыполняемаяКоманда.Опция("min-digit", 0, "Minimum number of digit characters in password.").Тчисло();
	maxDigit = ВыполняемаяКоманда.Опция("max-digit", -1, "Maximum number of digit characters in password.").Тчисло();
	minSym = ВыполняемаяКоманда.Опция("min-symbol", 0, "Minimum number of symbol characters in password.").Тчисло();
	maxSym = ВыполняемаяКоманда.Опция("max-symbol", -1, "Maximum number of symbol characters in password.").Тчисло();
	ex = ВыполняемаяКоманда.Опция("exclude", "", "Exclude specific characters from password.").ТСтрока();

КонецПроцедуры



Лог = Логирование.ПолучитьЛог("oscript.lib.cli_command");
//Лог.УстановитьУровень(УровниЛога.Отладка);