import xlrd

def read_xlsx_file(file):
    data = []
    data2 = []
    workbook = xlrd.open_workbook(file)
    sheet = workbook.sheet_by_index(0)
    for i in range(1, sheet.nrows):
        for j in range(sheet.ncols):
            if(j < 3):
                data2.append(sheet.cell_value(i, j))
    #data.append(data2)
    data3 = list(data2[0:3])
    data = data3
    data4 = list(data2[3:6])
    data = data.append(data4)
    print(data)
    return data2
    #print (data)


listoflist = read_xlsx_file('C:\\deveopment\\robot-scripts\\DDCSV\\Data\\data.xlsx')
print(listoflist)