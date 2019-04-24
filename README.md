## INSTRUCTIONS 

Two CSV files of data are provided. One contains browser * deviceCategory * date with
sessions, transactions, and QTY; the other contains month with addsToCart.
Desired output is an XLSX workbook, containing two worksheets, reproducing the provided file.

The first sheet is a Month x Device aggregation of the data, with metrics Sessions,
Transactions, QTY, and ECR (=Transactions / Sessions); the second is a Month Summary
aggregation of the data, with columns Month, Device Category (=Overall), Sessions,
Transactions, QTY, Adds To Cart, and ECR.

The R code will be used to reproduce the provided desired output from only the CSV
files, as exactly as possible, along with the XLSX output. All manipulations should be
completed using only R (including Excel formatting).

Additional Requirements
* The Month x Device tab should be ordered by month and then device; the Month Summary file
should be ordered by month.
* Table headers should be wrapped, bold, with a bottom border and a gray90 color
* The data columns (only) should be set to width 11
* Gridlines should be off
