file_one = open("queries.txt","w")

with open("test.csv","r") as file:
    for line in file:
        data_read = line.split(',')
        data_input = "INSERT INTO OC_RECEIPT_DETAILS (RECEIPT_NO, PER_ID, VISIT_NO, PAT_ID, DOC_ID, MED_ID, QUANTITY, TOTAL_COST) VALUES ("+data_read[0]+", "+data_read[1]+", "+data_read[2]+", "+data_read[3]+", "+data_read[4]+", "+data_read[5]+", "+data_read[6]+", "+data_read[7]+")\n"
        ##print(data_input)
        ##print("\n")
        file_one.write(data_input)

file_one.close()
file.close()