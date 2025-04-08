# Generacja `3` empatycznych robotów

---

### Wymagania

0) robot jeździ prosto, najlepiej w trybach:
    - o x centrymetrów o dany kąt theta, po x cm stop
    - wolnym - jedzie w danym kierunku aż zmieni zdanie
1) robot nie przechyla się do przodu przy gwałtownym hamowaniu
2) robot może sam się ładować
    - przy wykorzystaniu stacji ładującej
3) robot posiada złącze usb-c
    - koniecznie do manualnego ładowania
    - idealnie do komunikacji z stm32
    - opcjonalnie do programowania
4) robot posiada diody sygnalizujące jego stan
    - jedna sygnalizująca obecność zasilania
    - jedna sygnalizująca dowolny błąd
    - jedna do debugowania
5) robot posiada złącze do programowania oraz debugowania (!), które nie wystaje poza obrys robota
6) opony robota nie wystają poza obrys
7) ogniwa umieszczone są w koszyku - są łatwo wyjmowalne
8) górna płytka z robotem jest przykręcona z dolną poprzez standoffy (lub podobne rozwiązanie)
9) wyłącznik zasilania nie wystaje poza obrys robota
10) robot wyposażony jest w zderzaki, również z tyłu (krańcówki? NC)
    - najlepiej 4, każda na jedną ćwiartkę robota
11) robot wyposażony jest w zbliżeniowy czujnik na podczerwień, po jednej ze stron (do wyjaśnienia)
12) robot wyposażony jest w dalmierz laserowy, ale inny niż wcześniej zastosowano (VL53L0X) i najlepiej nie z tej samej
    rodziny
13) robot NIE jest wyposażony w chińskie moduły, co do których jakość pozostawia wiele do życzenia
14) część obudowy, która będzie zakrywać górną płytkę, może być ścięta w taki sposób, aby minimalizować martwą strefę na
    wieżyczkę, gdy inny robot patrzy na innego robota z bliska
15) czujnik NTC przy bateriach
16) Rezystory, kondensatory -> 0603

---

### Ładowanie

1) 'wąsy'
2) 'dziubek'

| wąsy - zalety                                         | wąsy - wady                                                      | dziubek - zalety                    | dziubek - wady                         |
|-------------------------------------------------------|------------------------------------------------------------------|-------------------------------------|----------------------------------------|
| bardzo prosta ładowarka                               |                                                                  |                                     | bardziej złożona ładowarka             |
|                                                       | większa delikatność rozwiązania (ale można by zrobić to mocarne) | większa trwałość rozwiązania        |                                        |
| celowanie w ładowarkę będzie bardzo proste            |                                                                  |                                     | bardziej złożone celowanie w ładowarkę | 
| wiele robotów per stacja ładowania                    |                                                                  |                                     | jeden robot per ładowarka              |
| zapewnia dodatkową stabilizację przy nagłym hamowaniu |                                                                  | zapewnia dodatkową stabilizację     |                                        | 
|                                                       | delikatnie zwiększa stopień skomplikowania wieżyczki             | nie wpływa na konstrukcję wieżyczki |                                        |