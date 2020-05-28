# Read input file
# read csv file
car_data=read.csv(file="carsales.csv")
# print car data
car_data

#choose car make and model, sales for sales >300
TopSales =subset(car_data, Sales>300)
TopSales

# and list in Descending order
Sorted_TopSales <- TopSales[order(-TopSales$Sales),]
Sorted_TopSales

# write data ibn a file

