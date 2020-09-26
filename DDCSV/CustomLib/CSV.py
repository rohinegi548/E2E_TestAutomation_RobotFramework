import csv

def read_csv_file(file):
    data = []
    with open(file,'r') as csv_file:
        reader = csv.reader(csv_file)
        next(reader)
        for row in reader:
            data.append(row)
    return data


print(read_csv_file('C:\\deveopment\\robot-scripts\\DDCSV\\Data\\userlogindata.csv'))