#import "@preview/ilm:1.4.1": *

#set text(lang: "cs", font: "Arial")

#show: ilm.with(
  title: "Projekt SWI - E-shop",
  author: "Adam Cvikl",
  abstract: "Březen 2025",
  figure-index: (enabled: true, title: "Seznam Diagramů"),
  table-index: (enabled: true),
  listing-index: (enabled: true),
)


= Historie verzí
#table(
  columns: 4,
  "Jméno", "Datum", "Změny", "Verze",
  "Adam Cvikl", "15.3.2025", "", "1.0.0",
  "Adam Cvikl", "29.3.2025", "Přidání třídního diagramu", "1.1.0",
  "Adam Cvikl", "9.4.2025", "Přidání aktivního diagramu", "1.2.0",
  "Adam Cvikl", "4.5.2025", "Úprava use case diagramu", "1.2.1",
  "Adam Cvikl", "4.5.2025", "Úprava aktivního diagramu", "1.2.2",
)


= Počáteční Popis
== Motivace
Tento projekt se zaměřuje na vytvoření e-shopu pro prodej počítačových součástek. Cílem je poskytnout uživatelům snadný a efektivní způsob, jak nakupovat různé komponenty pro své počítače.

== Zadání
E-shop bude obsahovat širokou škálu produktů, včetně procesorů, pamětí, pevných disků, grafických karet a dalších periferií. Uživatelé budou mít možnost procházet produkty podle kategorií. Systém bude také podporovat různé platební metody.


= Systémové Požadavky
== Funkční Požadavky (funkcionality - F)
- Uživatelé musí být schopni procházet produkty podle kategorií.
- Systém musí podporovat různé platební metody.
- Uživatelé musí mít možnost přidávat produkty do košíku a dokončit nákup.
- Administrátoři musí být schopni přidávat, upravovat a odstraňovat produkty.

== Použitelnost (usability - U)
- Rozhraní musí být intuitivní a snadno použitelné.
- Systém musí být přístupný na různých zařízeních, včetně mobilních telefonů a tabletů.

== Spolehlivost (reliability - R)
- Systém musí být dostupný 99.9% času.
- Data uživatelů musí být pravidelně zálohována.

== Výkon (performance - P)
- Systém musí být schopen zpracovat až 1000 současných uživatelů.
- Odezva systému na uživatelské akce musí být do 2 sekund.
- Systém musí být funkční na zařízeních s minimem 2 GB RAM.

== Podpora (support - S)
- Systém musí být snadno rozšiřitelný pro budoucí funkce.
- Systém musí fungovat na operačních systémech, Windows, macOS, Linux, iOS a Android.


= Charakteristika aktérů
== Uživatelé
- Běžní uživatelé, kteří nakupují produkty pro své osobní nebo pracovní potřeby.
- Technicky zdatní uživatelé, kteří hledají specifické komponenty pro stavbu nebo upgrade počítačů.

== Administrátoři
- Osoby zodpovědné za správu obsahu e-shopu, včetně přidávání, úpravy a odstraňování produktů.
- Zajišťují, že všechny informace o produktech jsou aktuální a přesné.

== Vývojáři
- Tým zodpovědný za údržbu a rozvoj systému.
- Pracují na implementaci nových funkcí a zajišťují, že systém je bezpečný a efektivní.

== Zákaznická Podpora
- Tým, který pomáhá uživatelům s jejich dotazy a problémy.
- Zajišťují, že uživatelé mají pozitivní zkušenost s e-shopem.


= Podrobný náhled na stavbu produktu
== Use case diagram
Následující use case diagram znázorňuje interakce mezi uživateli a systémem. Diagram obsahuje následující případy užití:

#figure(image("use-case-diagram.png"), caption: "Use case diagram")


= UC 1 - Nákup
== Parametry
#table(
  columns: 2,
  "Parametr", "Popis",
  "Název", "Nákup",
  "Kontext", "Uživatel chce zakoupit produkt z e-shopu.",
  "Primární aktér", "Uživatel",
  "Předpoklad", "Uživatel je přihlášen a má přístup k internetu.",
  "Minimální záruka", "Systém zaznamená pokus o nákup.",
  "Úspěšná záruka", "Uživatel úspěšně dokončí nákup a obdrží potvrzení.",
  "Trigger", "Uživatel klikne na tlačítko 'Koupit'.",
)

== Hlavní Scénář
1. Uživatel prochází produkty a vybere požadovaný produkt.
2. Uživatel klikne na tlačítko 'Koupit'.
3. Systém zobrazí stránku s detaily objednávky.
4. Uživatel zkontroluje detaily objednávky a klikne na 'Potvrdit'.
5. Systém zobrazí možnosti platby.
6. Uživatel vybere preferovanou platební metodu a zadá potřebné údaje.
7. Uživatel klikne na 'Zaplatit'.
8. Systém zpracuje platbu a zobrazí potvrzení o úspěšném nákupu.

== Alternativní Scénář
1a. Pokud uživatel není přihlášen:
- 1. Systém zobrazí přihlašovací stránku.
- 2. Uživatel zadá své přihlašovací údaje a klikne na 'Přihlásit se'.
- 3. Systém ověří přihlašovací údaje a přihlásí uživatele.
- 4. Uživatel pokračuje krokem 1.

5a. Pokud uživatel zjistí chybu v objednávce:
- 1. Uživatel klikne na tlačítko 'Zpět' a opraví detaily objednávky.
- 2. Uživatel pokračuje krokem 4.

7a. Pokud platba selže:
- 1. Systém zobrazí chybovou zprávu a nabídne možnost zkusit platbu znovu nebo vybrat jinou platební metodu.
- 2. Uživatel vybere jinou platební metodu nebo opraví údaje a klikne na 'Zaplatit'.
- 3. Systém zpracuje platbu a zobrazí potvrzení o úspěšném nákupu.


= Třídní diagram
Tento třídní diagram znázorňuje strukturu celého systému. Aktéři a další komponenty zapojené do správy záznamů o produktech jsou zde reprezentovány jako třídy, které mají své atributy a prostřednictvím metod vykonávají specifické činnosti v rámci systému.

#figure(image("class-diagram.png"), caption: "Class diagram")


= Aktivní diagram - Používání e-shopu
Tento aktivní diagram znázorňuje interakce mezi uživateli a systémem při používání e-shopu. Diagram ukazuje, jak uživatelé procházejí produkty a přidávají je do košíku.

#figure(image("active-diagram.png"), caption: "Active diagram")
