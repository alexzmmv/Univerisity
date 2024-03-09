from texttable import Texttable
from random import randint


class Minefield:
    def __init__(self, rows: int, columns: int, mines: int):
        self.__rows = rows
        self.__columns = columns
        self.__mines = mines
        """
         0 -> square is empty and unrevealed
        -1 -> square is mined
        """
        self.__data = [[0 for _ in range(self.__columns)] for _ in range(self.__rows)]
        self.__lay_mines(1, 1)

    def __lay_mines(self, no_mine_row: int, no_mine_col: int):
        """
        Lay the mines
        :param no_mine_row, no_mine_col: There is no mine placed here
        :return:
        """
        mines = self.__mines
        while mines > 0:
            row = randint(0, self.__rows - 1)
            col = randint(0, self.__columns - 1)
            if row == no_mine_row and col == no_mine_col:
                # TODO - don't place any mines in the neighbouring squares either
                continue
            coordinate=[-1,0,1]
            if self.__data[row][col] != -1:
                self.__data[row][col] = -1
                mines -= 1
                for i in coordinate:
                    for j in coordinate:
                        if (i!=0 and j!= 0) and row+i in range(self.__rows) and col+j in range(self.__columns) and self.__data[row+i][col+j] != -1:
                            self.__data[row+i][col+j] += 1
    def __str__(self):
        """
        Return the str representation of the field

        1. Use a Texttable instance (size is rows * columns)
        2. Have a '*' in all squares
        3. The first row and column should be headers
            - the first row is (A, B, C, ...) - variable number of columns
            - the first columns is (1, 2, 3, ...) - variable number of rows
        """
        table = Texttable()
        table.set_cols_align(["c"] * (self.__columns + 1))
        table.set_cols_valign(["m"] * (self.__columns + 1))
        table.set_cols_width([3] * (self.__columns + 1))
        table.add_row([" "] + [chr(i + 65) for i in range(self.__columns)])
        for i in range(self.__rows):
            # table.add_row([i + 1] + ["*"] * self.__columns)
            table.add_row([i + 1] + self.__data[i])
        return table.draw()


miefield = Minefield(8, 10, 10)
print(miefield)
