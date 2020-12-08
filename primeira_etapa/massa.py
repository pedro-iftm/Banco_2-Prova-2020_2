from datetime import date, datetime, timedelta

port random

cccc
jldate = date(2004, 5, 28)
between = end_date - start_date
between = between.days
for i in range(0, 70):
    random_days = random.randrange(between)
    a = str(start_date + timedelta(days=random_days))[0:10]
    b = str(start_date + timedelta(days=random_days))[0:10]
    while b <= a:
        new_start_date = start_date + timedelta(days=random_days)
        new_end_date = new_start_date + timedelta(days=7)
        between2 = new_end_date - new_start_date
        between2 = between2.days
        random_days2 = random.randrange(between2)
        b = str(new_start_date + timedelta(days=random_days2))[0:10]
    print(f'{a}, {b}')
