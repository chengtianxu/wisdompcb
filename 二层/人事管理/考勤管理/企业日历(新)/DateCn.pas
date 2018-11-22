unit DateCn;

interface

uses Windows, SysUtils, Controls;

const
  //农历月份数据，每年4字节，从1901年开始，共150年
  //数据来源：UCDOS 6.0 UCT.COM
  //分析整理：Copyright (c) 1996-1998, Randolph
  //数据解析：
  //如果第一字节的bit7为1，则该年1月1日位于农历12月，否则位于11月
  //第一字节去除bit7为该年1月1日的农历日期
  //         第二字节                 第三字节
  //bit:     7  6  5  4  3  2  1  0   7  6  5  4  3  2  1  0
  //农历月份:16 15 14 13 12 11 10 9   8  7  6  5  4  3  2  1
  //农历月份指的是从该年1月1日的农历月份算起的顺序号
  //农历月份对应的bit为1则该月为30日，否则为29日
  //第四字节为闰月月份
//  BaseDate='2000/02/04';//2000立春
  BaseAnimalDate = '1972'; //1972年支为子(是鼠年)
  BaseSkyStemDate = '1974'; //1974年干为甲
  START_YEAR = 1901;
  END_YEAR = 2050;

  gLunarHolDay: array[0..1799] of Byte = (
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, //1901
    $96, $A4, $96, $96, $97, $87, $79, $79, $79, $69, $78, $78, //1902
    $96, $A5, $87, $96, $87, $87, $79, $69, $69, $69, $78, $78, //1903
    $86, $A5, $96, $A5, $96, $97, $88, $78, $78, $79, $78, $87, //1904
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, //1905
    $96, $A4, $96, $96, $97, $97, $79, $79, $79, $69, $78, $78, //1906
    $96, $A5, $87, $96, $87, $87, $79, $69, $69, $69, $78, $78, //1907
    $86, $A5, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, //1908
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, //1909
    $96, $A4, $96, $96, $97, $97, $79, $79, $79, $69, $78, $78, //1910
    $96, $A5, $87, $96, $87, $87, $79, $69, $69, $69, $78, $78, //1911
    $86, $A5, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, //1912
    $95, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, //1913
    $96, $B4, $96, $A6, $97, $97, $79, $79, $79, $69, $78, $78, //1914
    $96, $A5, $97, $96, $97, $87, $79, $79, $69, $69, $78, $78, //1915
    $96, $A5, $96, $A5, $96, $97, $88, $78, $78, $79, $77, $87, //1916
    $95, $B4, $96, $A6, $96, $97, $78, $79, $78, $69, $78, $87, //1917
    $96, $B4, $96, $A6, $97, $97, $79, $79, $79, $69, $78, $77, //1918
    $96, $A5, $97, $96, $97, $87, $79, $79, $69, $69, $78, $78, //1919
    $96, $A5, $96, $A5, $96, $97, $88, $78, $78, $79, $77, $87, //1920
    $95, $B4, $96, $A5, $96, $97, $78, $79, $78, $69, $78, $87, //1921
    $96, $B4, $96, $A6, $97, $97, $79, $79, $79, $69, $78, $77, //1922
    $96, $A4, $96, $96, $97, $87, $79, $79, $69, $69, $78, $78, //1923
    $96, $A5, $96, $A5, $96, $97, $88, $78, $78, $79, $77, $87, //1924
    $95, $B4, $96, $A5, $96, $97, $78, $79, $78, $69, $78, $87, //1925
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, //1926
    $96, $A4, $96, $96, $97, $87, $79, $79, $79, $69, $78, $78, //1927
    $96, $A5, $96, $A5, $96, $96, $88, $78, $78, $78, $87, $87, //1928
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $79, $77, $87, //1929
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, //1930
    $96, $A4, $96, $96, $97, $87, $79, $79, $79, $69, $78, $78, //1931
    $96, $A5, $96, $A5, $96, $96, $88, $78, $78, $78, $87, $87, //1932
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, //1933
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, //1934
    $96, $A4, $96, $96, $97, $97, $79, $79, $79, $69, $78, $78, //1935
    $96, $A5, $96, $A5, $96, $96, $88, $78, $78, $78, $87, $87, //1936
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, //1937
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, //1938
    $96, $A4, $96, $96, $97, $97, $79, $79, $79, $69, $78, $78, //1939
    $96, $A5, $96, $A5, $96, $96, $88, $78, $78, $78, $87, $87, //1940
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, //1941
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, //1942
    $96, $A4, $96, $96, $97, $97, $79, $79, $79, $69, $78, $78, //1943
    $96, $A5, $96, $A5, $A6, $96, $88, $78, $78, $78, $87, $87, //1944
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $79, $77, $87, //1945
    $95, $B4, $96, $A6, $97, $97, $78, $79, $78, $69, $78, $77, //1946
    $96, $B4, $96, $A6, $97, $97, $79, $79, $79, $69, $78, $78, //1947
    $96, $A5, $A6, $A5, $A6, $96, $88, $88, $78, $78, $87, $87, //1948
    $A5, $B4, $96, $A5, $96, $97, $88, $79, $78, $79, $77, $87, //1949
    $95, $B4, $96, $A5, $96, $97, $78, $79, $78, $69, $78, $77, //1950
    $96, $B4, $96, $A6, $97, $97, $79, $79, $79, $69, $78, $78, //1951
    $96, $A5, $A6, $A5, $A6, $96, $88, $88, $78, $78, $87, $87, //1952
    $A5, $B4, $96, $A5, $96, $97, $88, $78, $78, $79, $77, $87, //1953
    $95, $B4, $96, $A5, $96, $97, $78, $79, $78, $68, $78, $87, //1954
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, //1955
    $96, $A5, $A5, $A5, $A6, $96, $88, $88, $78, $78, $87, $87, //1956
    $A5, $B4, $96, $A5, $96, $97, $88, $78, $78, $79, $77, $87, //1957
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, //1958
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, //1959
    $96, $A4, $A5, $A5, $A6, $96, $88, $88, $88, $78, $87, $87, //1960
    $A5, $B4, $96, $A5, $96, $96, $88, $78, $78, $78, $87, $87, //1961
    $96, $B4, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, //1962
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, //1963
    $96, $A4, $A5, $A5, $A6, $96, $88, $88, $88, $78, $87, $87, //1964
    $A5, $B4, $96, $A5, $96, $96, $88, $78, $78, $78, $87, $87, //1965
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, //1966
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, //1967
    $96, $A4, $A5, $A5, $A6, $A6, $88, $88, $88, $78, $87, $87, //1968
    $A5, $B4, $96, $A5, $96, $96, $88, $78, $78, $78, $87, $87, //1969
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, //1970
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, //1971
    $96, $A4, $A5, $A5, $A6, $A6, $88, $88, $88, $78, $87, $87, //1972
    $A5, $B5, $96, $A5, $A6, $96, $88, $78, $78, $78, $87, $87, //1973
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, //1974
    $96, $B4, $96, $A6, $97, $97, $78, $79, $78, $69, $78, $77, //1975
    $96, $A4, $A5, $B5, $A6, $A6, $88, $89, $88, $78, $87, $87, //1976
    $A5, $B4, $96, $A5, $96, $96, $88, $88, $78, $78, $87, $87, //1977
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $79, $78, $87, //1978
    $96, $B4, $96, $A6, $96, $97, $78, $79, $78, $69, $78, $77, //1979
    $96, $A4, $A5, $B5, $A6, $A6, $88, $88, $88, $78, $87, $87, //1980
    $A5, $B4, $96, $A5, $A6, $96, $88, $88, $78, $78, $77, $87, //1981
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $79, $77, $87, //1982
    $95, $B4, $96, $A5, $96, $97, $78, $79, $78, $69, $78, $77, //1983
    $96, $B4, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $87, //1984
    $A5, $B4, $A6, $A5, $A6, $96, $88, $88, $78, $78, $87, $87, //1985
    $A5, $B4, $96, $A5, $96, $97, $88, $78, $78, $79, $77, $87, //1986
    $95, $B4, $96, $A5, $96, $97, $88, $79, $78, $69, $78, $87, //1987
    $96, $B4, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $86, //1988
    $A5, $B4, $A5, $A5, $A6, $96, $88, $88, $88, $78, $87, $87, //1989
    $A5, $B4, $96, $A5, $96, $96, $88, $78, $78, $79, $77, $87, //1990
    $95, $B4, $96, $A5, $86, $97, $88, $78, $78, $69, $78, $87, //1991
    $96, $B4, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $86, //1992
    $A5, $B3, $A5, $A5, $A6, $96, $88, $88, $88, $78, $87, $87, //1993
    $A5, $B4, $96, $A5, $96, $96, $88, $78, $78, $78, $87, $87, //1994
    $95, $B4, $96, $A5, $96, $97, $88, $76, $78, $69, $78, $87, //1995
    $96, $B4, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $86, //1996
    $A5, $B3, $A5, $A5, $A6, $A6, $88, $88, $88, $78, $87, $87, //1997
    $A5, $B4, $96, $A5, $96, $96, $88, $78, $78, $78, $87, $87, //1998
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, //1999
    $96, $B4, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $86, //2000
    $A5, $B3, $A5, $A5, $A6, $A6, $88, $88, $88, $78, $87, $87, //2001
    $A5, $B4, $96, $A5, $96, $96, $88, $78, $78, $78, $87, $87, //2002
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, //2003
    $96, $B4, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $86, //2004
    $A5, $B3, $A5, $A5, $A6, $A6, $88, $88, $88, $78, $87, $87, //2005
    $A5, $B4, $96, $A5, $A6, $96, $88, $88, $78, $78, $87, $87, //2006
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, //2007
    $96, $B4, $A5, $B5, $A6, $A6, $87, $88, $87, $78, $87, $86, //2008
    $A5, $B3, $A5, $B5, $A6, $A6, $88, $88, $88, $78, $87, $87, //2009
    $A5, $B4, $96, $A5, $A6, $96, $88, $88, $78, $78, $87, $87, //2010
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $79, $78, $87, //2011
    $96, $B4, $A5, $B5, $A5, $A6, $87, $88, $87, $78, $87, $86, //2012
    $A5, $B3, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $87, //2013
    $A5, $B4, $96, $A5, $A6, $96, $88, $88, $78, $78, $87, $87, //2014
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $79, $77, $87, //2015
    $95, $B4, $A5, $B4, $A5, $A6, $87, $88, $87, $78, $87, $86, //2016
    $A5, $C3, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $87, //2017
    $A5, $B4, $A6, $A5, $A6, $96, $88, $88, $78, $78, $87, $87, //2018
    $A5, $B4, $96, $A5, $96, $96, $88, $78, $78, $79, $77, $87, //2019
    $95, $B4, $A5, $B4, $A5, $A6, $97, $87, $87, $78, $87, $86, //2020
    $A5, $C3, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $86, //2021
    $A5, $B4, $A5, $A5, $A6, $96, $88, $88, $88, $78, $87, $87, //2022
    $A5, $B4, $96, $A5, $96, $96, $88, $78, $78, $79, $77, $87, //2023
    $95, $B4, $A5, $B4, $A5, $A6, $97, $87, $87, $78, $87, $96, //2024
    $A5, $C3, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $86, //2025
    $A5, $B3, $A5, $A5, $A6, $A6, $88, $88, $88, $78, $87, $87, //2026
    $A5, $B4, $96, $A5, $96, $96, $88, $78, $78, $78, $87, $87, //2027
    $95, $B4, $A5, $B4, $A5, $A6, $97, $87, $87, $78, $87, $96, //2028
    $A5, $C3, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $86, //2029
    $A5, $B3, $A5, $A5, $A6, $A6, $88, $88, $88, $78, $87, $87, //2030
    $A5, $B4, $96, $A5, $96, $96, $88, $78, $78, $78, $87, $87, //2031
    $95, $B4, $A5, $B4, $A5, $A6, $97, $87, $87, $78, $87, $96, //2032
    $A5, $C3, $A5, $B5, $A6, $A6, $88, $88, $88, $78, $87, $86, //2033
    $A5, $B3, $A5, $A5, $A6, $A6, $88, $78, $88, $78, $87, $87, //2034
    $A5, $B4, $96, $A5, $A6, $96, $88, $88, $78, $78, $87, $87, //2035
    $95, $B4, $A5, $B4, $A5, $A6, $97, $87, $87, $78, $87, $96, //2036
    $A5, $C3, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $86, //2037
    $A5, $B3, $A5, $A5, $A6, $A6, $88, $88, $88, $78, $87, $87, //2038
    $A5, $B4, $96, $A5, $A6, $96, $88, $88, $78, $78, $87, $87, //2039
    $95, $B4, $A5, $B4, $A5, $A6, $97, $87, $87, $78, $87, $96, //2040
    $A5, $C3, $A5, $B5, $A5, $A6, $87, $88, $87, $78, $87, $86, //2041
    $A5, $B3, $A5, $B5, $A6, $A6, $88, $88, $88, $78, $87, $87, //2042
    $A5, $B4, $96, $A5, $A6, $96, $88, $88, $78, $78, $87, $87, //2043
    $95, $B4, $A5, $B4, $A5, $A6, $97, $87, $87, $88, $87, $96, //2044
    $A5, $C3, $A5, $B4, $A5, $A6, $87, $88, $87, $78, $87, $86, //2045
    $A5, $B3, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $87, //2046
    $A5, $B4, $96, $A5, $A6, $96, $88, $88, $78, $78, $87, $87, //2047
    $95, $B4, $A5, $B4, $A5, $A5, $97, $87, $87, $88, $86, $96, //2048
    $A4, $C3, $A5, $A5, $A5, $A6, $97, $87, $87, $78, $87, $86, //2049
    $A5, $C3, $A5, $B5, $A6, $A6, $87, $88, $78, $78, $87, $87); //2050


  CnData: array[0..599] of Byte = (
    $0B, $52, $BA, $00, $16, $A9, $5D, $00, $83, $A9, $37, $05, $0E, $74, $9B,
    $00,
    $1A, $B6, $55, $00, $87, $B5, $55, $04, $11, $55, $AA, $00, $1C, $A6, $B5,
    $00,
    $8A, $A5, $75, $02, $14, $52, $BA, $00, $81, $52, $6E, $06, $0D, $E9, $37,
    $00,
    $18, $74, $97, $00, $86, $EA, $96, $05, $10, $6D, $55, $00, $1A, $35, $AA,
    $00,
    $88, $4B, $6A, $02, $13, $A5, $6D, $00, $1E, $D2, $6E, $07, $0B, $D2, $5E,
    $00,
    $17, $E9, $2E, $00, $84, $D9, $2D, $05, $0F, $DA, $95, $00, $19, $5B, $52,
    $00,
    $87, $56, $D4, $04, $11, $4A, $DA, $00, $1C, $A5, $5D, $00, $89, $A4, $BD,
    $02,
    $15, $D2, $5D, $00, $82, $B2, $5B, $06, $0D, $B5, $2B, $00, $18, $BA, $95,
    $00,
    $86, $B6, $A5, $05, $10, $56, $B4, $00, $1A, $4A, $DA, $00, $87, $49, $BA,
    $03,
    $13, $A4, $BB, $00, $1E, $B2, $5B, $07, $0B, $72, $57, $00, $16, $75, $2B,
    $00,
    $84, $6D, $2A, $06, $0F, $AD, $55, $00, $19, $55, $AA, $00, $86, $55, $6C,
    $04,
    $12, $C9, $76, $00, $1C, $64, $B7, $00, $8A, $E4, $AE, $02, $15, $EA, $56,
    $00,
    $83, $DA, $55, $07, $0D, $5B, $2A, $00, $18, $AD, $55, $00, $85, $AA, $D5,
    $05,
    $10, $53, $6A, $00, $1B, $A9, $6D, $00, $88, $A9, $5D, $03, $13, $D4, $AE,
    $00,
    $81, $D4, $AB, $08, $0C, $BA, $55, $00, $16, $5A, $AA, $00, $83, $56, $AA,
    $06,
    $0F, $AA, $D5, $00, $19, $52, $DA, $00, $86, $52, $BA, $04, $11, $A9, $5D,
    $00,
    $1D, $D4, $9B, $00, $8A, $74, $9B, $03, $15, $B6, $55, $00, $82, $AD, $55,
    $07,
    $0D, $55, $AA, $00, $18, $A5, $B5, $00, $85, $A5, $75, $05, $0F, $52, $B6,
    $00,
    $1B, $69, $37, $00, $89, $E9, $37, $04, $13, $74, $97, $00, $81, $EA, $96,
    $08,
    $0C, $6D, $52, $00, $16, $2D, $AA, $00, $83, $4B, $6A, $06, $0E, $A5, $6D,
    $00,
    $1A, $D2, $6E, $00, $87, $D2, $5E, $04, $12, $E9, $2E, $00, $1D, $EC, $96,
    $0A,
    $0B, $DA, $95, $00, $15, $5B, $52, $00, $82, $56, $D2, $06, $0C, $2A, $DA,
    $00,
    $18, $A4, $DD, $00, $85, $A4, $BD, $05, $10, $D2, $5D, $00, $1B, $D9, $2D,
    $00,
    $89, $B5, $2B, $03, $14, $BA, $95, $00, $81, $B5, $95, $08, $0B, $56, $B2,
    $00,
    $16, $2A, $DA, $00, $83, $49, $B6, $05, $0E, $64, $BB, $00, $19, $B2, $5B,
    $00,
    $87, $6A, $57, $04, $12, $75, $2B, $00, $1D, $B6, $95, $00, $8A, $AD, $55,
    $02,
    $15, $55, $AA, $00, $82, $55, $6C, $07, $0D, $C9, $76, $00, $17, $64, $B7,
    $00,
    $86, $E4, $AE, $05, $11, $EA, $56, $00, $1B, $6D, $2A, $00, $88, $5A, $AA,
    $04,
    $14, $AD, $55, $00, $81, $AA, $D5, $09, $0B, $52, $EA, $00, $16, $A9, $6D,
    $00,
    $84, $A9, $5D, $06, $0F, $D4, $AE, $00, $1A, $EA, $4D, $00, $87, $BA, $55,
    $04,
    $12, $5A, $AA, $00, $1D, $AB, $55, $00, $8A, $A6, $D5, $02, $14, $52, $DA,
    $00,
    $82, $52, $BA, $06, $0D, $A9, $3B, $00, $18, $B4, $9B, $00, $85, $74, $9B,
    $05,
    $11, $B5, $4D, $00, $1C, $D6, $A9, $00, $88, $35, $AA, $03, $13, $A5, $B5,
    $00,
    $81, $A5, $75, $0B, $0B, $52, $B6, $00, $16, $69, $37, $00, $84, $E9, $2F,
    $06,
    $10, $F4, $97, $00, $1A, $75, $4B, $00, $87, $6D, $52, $05, $11, $2D, $69,
    $00,
    $1D, $95, $B5, $00, $8A, $A5, $6D, $02, $15, $D2, $6E, $00, $82, $D2, $5E,
    $07,
    $0E, $E9, $2E, $00, $19, $EA, $96, $00, $86, $DA, $95, $05, $10, $5B, $4A,
    $00,
    $1C, $AB, $69, $00, $88, $2A, $D8, $03);

function DaysNumberOfDate(Date: TDate): Integer;
//日期是该年的第几天，1月1日为第一天
function CnMonthOfDate(Date: TDate; Days: Integer): string; OverLoad;
function CnMonthOfDate(Date: TDate): string; OverLoad; //指定日期的农历月

function CnMonth(Date: TDate): Integer; //指定日期的农历月
function CnDay(Date: TDate): Integer; //指定日期的农历日包括节日
function CnDayOfDate(Date: TDate): string; overload; //指定日期的农历日包括节日
function CnDayOfDate(Year, Month, Day: integer): string; overload; //指定日期的农历日包括节日

function CnDayOfDate(Date: TDate; Days: integer; ShowDate: Boolean = false): string; overload; //指定日期的农历日包括节日

function CnDateOfDateStr(Date: TDate): string; //指定日期的农历日期
function CnDayOfDatePH(Date: TDate): string; //指定日期的农历月
function CnDateOfDateStrPH(Date: TDate): string; //指定日期的农历日期包括节日

function CnDayOfDateJr(Date: TDate): string; overload; //只有节日
function CnDayOfDateJr(Date: TDate; Days: Integer): string; overload; //只有节日

function CnanimalOfYear(Date: TDate): string; //返回十二生肖(地支)
function CnSkyStemOfYear(Date: TDate): string; //返回十大天干
function CnSolarTerm(Date: TDate): string; //返回十大天干

function GetLunarHolDay(InDate: TDateTime): string; overload;
function GetLunarHolDay(InDate: TDateTime; Days: Integer): string; overload;

function l_GetLunarHolDay(iYear, iMonth, iDay: Word): Word;
function GetAnimal(Date: TDate): integer; //返回十二生肖

function GetCnDateToDate(dDate: TDateTime): TDateTime; overload;
function GetCnDateToDate(cYear, cMonth, cDay: word): TDateTime; overload;

function OtherHoliday(Month, Day: integer): string;
function Holiday(Date: TDateTime; Day: integer): string;
function GetDays(ADate: TDate): Extended;

function Constellation(Date: TDateTime; Day: integer): string; overload;
function Constellation(ADate: TDate): string; overload;
//procedure l_CalcLunarDate(var iYear,iMonth,iDay:Word;iSpanDays:Longword);
//function CalcDateDiff(iEndYear,iEndMonth,iEndDay:Word;iStartYear:Word;iStartMonth:Word;iStartDay:Word):Longword;

implementation

function Year(MyDate: TDateTime): Word;
begin
  result := StrToInt(FormatDateTime('yyyy', MyDate)); //SetDates(MyDate, 1);
end;

function Month(MyDate: TDateTime): Word;
begin
  result := StrToInt(FormatDateTime('mm', MyDate)); //SetDates(MyDate, 2);
end;

function day(MyDate: TDateTime): Word;
begin
  result := StrToInt(FormatDateTime('dd', MyDate)); //SetDates(MyDate, 3);
end;


//日期是该年的第几天，1月1日为第一天

function DaysNumberOfDate(Date: TDate): Integer;
var
  DaysNumber: Integer;
  I: Integer;
  yyyy, mm, dd: Word;
begin
  //  Date := StrToDate(FormatDateTime('yyyy/mm/dd', Date));
  DecodeDate(Date, yyyy, mm, dd);
  DaysNumber := 0;
  for I := 1 to mm - 1 do
    Inc(DaysNumber, MonthDays[IsLeapYear(yyyy), I]);
  Inc(DaysNumber, dd);
  Result := DaysNumber;
end;

//日期的农历日期，返回农历格式：月份*100 + 日，负数为闰月
//超出范围则返回0

function GetAnimal(Date: TDate): integer; //返回十二生肖
var
  Animal: string;
begin
  Animal := CnanimalOfYear(Date);
  if Animal = '子鼠' then
    result := 0;

  if Animal = '丑牛' then
    result := 1;

  if Animal = '寅虎' then
    result := 2;

  if Animal = '卯兔' then
    result := 3;

  if Animal = '辰龙' then
    result := 4;

  if Animal = '巳蛇' then
    result := 5;

  if Animal = '午马' then
    result := 6;

  if Animal = '未羊' then
    result := 7;

  if Animal = '申猴' then
    result := 8;

  if Animal = '酉鸡' then
    result := 9;

  if Animal = '戌狗' then
    result := 10;

  if Animal = '亥猪' then
    result := 11;


end;

function CnDateOfDate(Date: TDate): Integer;
var
  CnMonth, CnMonthDays: array[0..15] of Integer;
  CnBeginDay, LeapMonth: Integer;
  yyyy, mm, dd: Word;
  Bytes: array[0..3] of Byte;
  I: Integer;
  CnMonthData: Word;
  DaysCount, CnDaysCount, ResultMonth, ResultDay: Integer;
begin
  //  Date := StrToDate(FormatDateTime('yyyy/mm/dd', Date));
  DecodeDate(Date, yyyy, mm, dd);
  if (yyyy < 1901) or (yyyy > 2050) then
  begin
    Result := 0;
    Exit;
  end;
  Bytes[0] := CnData[(yyyy - 1901) * 4];
  Bytes[1] := CnData[(yyyy - 1901) * 4 + 1];
  Bytes[2] := CnData[(yyyy - 1901) * 4 + 2];
  Bytes[3] := CnData[(yyyy - 1901) * 4 + 3];
  if (Bytes[0] and $80) <> 0 then
    CnMonth[0] := 12
  else
    CnMonth[0] := 11;
  CnBeginDay := (Bytes[0] and $7F);
  CnMonthData := Bytes[1];
  CnMonthData := CnMonthData shl 8;
  CnMonthData := CnMonthData or Bytes[2];
  LeapMonth := Bytes[3];

  for I := 15 downto 0 do
  begin
    CnMonthDays[15 - I] := 29;
    if ((1 shl I) and CnMonthData) <> 0 then
      Inc(CnMonthDays[15 - I]);
    if CnMonth[15 - I] = LeapMonth then
      CnMonth[15 - I + 1] := -LeapMonth
    else
    begin
      if CnMonth[15 - I] < 0 then //上月为闰月
        CnMonth[15 - I + 1] := -CnMonth[15 - I] + 1
      else
        CnMonth[15 - I + 1] := CnMonth[15 - I] + 1;
      if CnMonth[15 - I + 1] > 12 then CnMonth[15 - I + 1] := 1;
    end;
  end;

  DaysCount := DaysNumberOfDate(Date) - 1;
  if DaysCount <= (CnMonthDays[0] - CnBeginDay) then
  begin
    if (yyyy > 1901) and
      (CnDateOfDate(EncodeDate(yyyy - 1, 12, 31)) < 0) then
      ResultMonth := -CnMonth[0]
    else
      ResultMonth := CnMonth[0];
    ResultDay := CnBeginDay + DaysCount;
  end
  else
  begin
    CnDaysCount := CnMonthDays[0] - CnBeginDay;
    I := 1;
    while (CnDaysCount < DaysCount) and
      (CnDaysCount + CnMonthDays[I] < DaysCount) do
    begin
      Inc(CnDaysCount, CnMonthDays[I]);
      Inc(I);
    end;
    ResultMonth := CnMonth[I];
    ResultDay := DaysCount - CnDaysCount;
  end;
  if ResultMonth > 0 then
    Result := ResultMonth * 100 + ResultDay
  else
    Result := ResultMonth * 100 - ResultDay
end;

function CnMonth(Date: TDate): Integer;
begin
  Result := Abs(CnDateOfDate(Date) div 100);
end;

function CnMonthOfDate(Date: TDate; Days: Integer): string;
var
  Year, Month, Day: word;
begin
  DecodeDate(Date, Year, Month, Day);
  Result := CnMonthOfDate(EncodeDate(Year, Month, Days));

end;

function CnMonthOfDate(Date: TDate): string;
const
  CnMonthStr: array[1..12] of string = (
    '正', '二', '三', '四', '五', '六', '七', '八', '九', '十',
    '冬', '腊');
var
  Month: Integer;
begin
  //  Date := StrToDate(FormatDateTime('yyyy/mm/dd', Date));
  Month := CnDateOfDate(Date) div 100;
  if Month < 0 then
    Result := '闰' + CnMonthStr[-Month]
  else
    Result := CnMonthStr[Month] + '月';
end;

function CnDayOfDatePH(Date: TDate): string;
const
  CnDayStr: array[1..30] of string = (
    '初一', '初二', '初三', '初四', '初五',
    '初六', '初七', '初八', '初九', '初十',
    '十一', '十二', '十三', '十四', '十五',
    '十六', '十七', '十八', '十九', '二十',
    '廿一', '廿二', '廿三', '廿四', '廿五',
    '廿六', '廿七', '廿八', '廿九', '三十');
var
  Day: Integer;
begin
  //  Date := StrToDate(FormatDateTime('yyyy/mm/dd', Date));
  Day := Abs(CnDateOfDate(Date)) mod 100;
  Result := CnDayStr[Day];
end;

function CnDateOfDateStr(Date: TDate): string;
begin
  Result := CnMonthOfDate(Date) + CnDayOfDatePH(Date);
end;

function CnDayOfDate(Date: TDate; Days: integer; ShowDate: Boolean = false): string; //指定日期的农历日包括节日
var
  Year, Month, Day: word;
begin
  DecodeDate(Date, Year, Month, Day);
  Result := CnDayOfDate(EncodeDate(Year, Month, Days));

end;

function CnDayOfDate(Year, Month, Day: integer): string; overload; //指定日期的农历日包括节日
begin
  Result := CnDayOfDate(EncodeDate(Year, Month, Day));
end;


function CnDay(Date: TDate): Integer;
begin
  Result := Abs(CnDateOfDate(Date)) mod 100;
end;

function CnDayOfDate(Date: TDate): string;
const
  CnDayStr: array[1..30] of string = (
    '初一', '初二', '初三', '初四', '初五',
    '初六', '初七', '初八', '初九', '初十',
    '十一', '十二', '十三', '十四', '十五',
    '十六', '十七', '十八', '十九', '二十',
    '廿一', '廿二', '廿三', '廿四', '廿五',
    '廿六', '廿七', '廿八', '廿九', '三十');
var
  Day: Integer;
begin
  //  Date := StrToDate(FormatDateTime('yyyy/mm/dd', Date));
  Day := Abs(CnDateOfDate(Date)) mod 100;
  Result := CnDayStr[Day];

end;

function CnDateOfDateStrPH(Date: TDate): string;
begin
  Result := CnMonthOfDate(Date) + CnDayOfDate(Date);
end;

function CnDayOfDateJr(Date: TDate; Days: Integer): string;
var
  Year, Month, Day: word;
begin
  DecodeDate(Date, Year, Month, Day);
  Result := CnDayOfDateJr(EncodeDate(Year, Month, Days));

end;

function CnDayOfDateJr(Date: TDate): string;
var
  Day: Integer;
begin
  Result := '';
  Day := Abs(CnDateOfDate(Date)) mod 100;
  case Day of
    1:
      if (CnMonthOfDate(Date) = '正月') then
        Result := '春节';
    5:
      if CnMonthOfDate(Date) = '五月' then
        Result := '端午节';
    7:
      if CnMonthOfDate(Date) = '七月' then
        Result := '七夕节';
    15:
      if CnMonthOfDate(Date) = '八月' then
        Result := '中秋节'
      else
        if (CnMonthOfDate(Date) = '正月') then
          Result := '元宵节';
    9:
      if CnMonthOfDate(Date) = '九月' then
        Result := '重阳节';
    8:
      if CnMonthOfDate(Date) = '腊月' then
        Result := '腊八节';
  else
    if (CnMonthOfDate(Date + 1) = '正月') and (CnMonthOfDate(Date) <> '正月') then
      Result := '除夕';
  end; {case}
end;

function CnanimalOfYear(Date: TDate): string; //返回十二生肖
var
  i: integer;
  DateStr: string;
begin
  DateStr := FormatDateTime('yyyy/mm/dd', Date);
  i := length(inttostr(month(date)));
  case (StrToInt(Copy(DateStr, 1, 4)) - StrToInt(BaseAnimalDate))
    mod 12 of
    0:
      if (StrToInt(Copy(DateStr, 6, i)) < 4) and ((Pos('腊',
        CnMonthOfDate(Date)) = 0) and (Pos('冬', CnMonthOfDate(Date)) = 0)) then
        Result := '子鼠'
      else
      begin
        if StrToInt(Copy(DateStr, 6, i)) < 4 then
          Result := '亥猪'
        else
          Result := '子鼠';
      end;
    1, -11:
      if (StrToInt(Copy(DateStr, 6, i)) < 4) and ((Pos('腊',
        CnMonthOfDate(Date)) = 0) and (Pos('冬', CnMonthOfDate(Date)) = 0)) then
        Result := '丑牛'
      else
      begin
        if StrToInt(Copy(DateStr, 6, i)) < 4 then
          Result := '子鼠'
        else
          Result := '丑牛';
      end;
    2, -10:
      if (StrToInt(Copy(DateStr, 6, i)) < 4) and ((Pos('腊',
        CnMonthOfDate(Date)) = 0) and (Pos('冬', CnMonthOfDate(Date)) = 0)) then
        Result := '寅虎'
      else
      begin
        if StrToInt(Copy(DateStr, 6, i)) < 4 then
          Result := '丑牛'
        else
          Result := '寅虎';
      end;
    3, -9:
      if (StrToInt(Copy(DateStr, 6, i)) < 4) and ((Pos('腊',
        CnMonthOfDate(Date)) = 0) and (Pos('冬', CnMonthOfDate(Date)) = 0)) then
        Result := '卯兔'
      else
      begin
        if StrToInt(Copy(DateStr, 6, i)) < 4 then
          Result := '寅虎'
        else
          Result := '卯兔';
      end;
    4, -8:
      if (StrToInt(Copy(DateStr, 6, i)) < 4) and ((Pos('腊',
        CnMonthOfDate(Date)) = 0) and (Pos('冬', CnMonthOfDate(Date)) = 0)) then
        Result := '辰龙'
      else
      begin
        if StrToInt(Copy(DateStr, 6, i)) < 4 then
          Result := '卯兔'
        else
          Result := '辰龙';
      end;
    5, -7:
      if (StrToInt(Copy(DateStr, 6, i)) < 4) and ((Pos('腊',
        CnMonthOfDate(Date)) = 0) and (Pos('冬', CnMonthOfDate(Date)) = 0)) then
        Result := '巳蛇'
      else
      begin
        if StrToInt(Copy(DateStr, 6, i)) < 4 then
          Result := '辰龙'
        else
          Result := '巳蛇';
      end;
    6, -6:
      if (StrToInt(Copy(DateStr, 6, i)) < 4) and ((Pos('腊',
        CnMonthOfDate(Date)) = 0) and (Pos('冬', CnMonthOfDate(Date)) = 0)) then
        Result := '午马'
      else
      begin
        if StrToInt(Copy(DateStr, 6, i)) < 4 then
          Result := '巳蛇'
        else
          Result := '午马';
      end;
    7, -5:
      if (StrToInt(Copy(DateStr, 6, i)) < 4) and ((Pos('腊',
        CnMonthOfDate(Date)) = 0) and (Pos('冬', CnMonthOfDate(Date)) = 0)) then
        Result := '未羊'
      else
      begin
        if StrToInt(Copy(DateStr, 6, i)) < 4 then
          Result := '午马'
        else
          Result := '未羊';
      end;
    8, -4:
      if (StrToInt(Copy(DateStr, 6, i)) < 4) and ((Pos('腊',
        CnMonthOfDate(Date)) = 0) and (Pos('冬', CnMonthOfDate(Date)) = 0)) then
        Result := '申猴'
      else
      begin
        if StrToInt(Copy(DateStr, 6, i)) < 4 then
          Result := '未羊'
        else
          Result := '申猴';
      end;
    9, -3:
      if (StrToInt(Copy(DateStr, 6, i)) < 4) and ((Pos('腊',
        CnMonthOfDate(Date)) = 0) and (Pos('冬', CnMonthOfDate(Date)) = 0)) then
        Result := '酉鸡'
      else
      begin
        if StrToInt(Copy(DateStr, 6, i)) < 4 then
          Result := '申猴'
        else
          Result := '酉鸡';
      end;
    10, -2:
      if (StrToInt(Copy(DateStr, 6, i)) < 4) and ((Pos('腊',
        CnMonthOfDate(Date)) = 0) and (Pos('冬', CnMonthOfDate(Date)) = 0)) then
        Result := '戌狗'
      else
      begin
        if StrToInt(Copy(DateStr, 6, i)) < 4 then
          Result := '酉鸡'
        else
          Result := '戌狗';
      end;
    11, -1:
      if (StrToInt(Copy(DateStr, 6, i)) < 4) and ((Pos('腊',
        CnMonthOfDate(Date)) = 0) and (Pos('冬', CnMonthOfDate(Date)) = 0)) then
        Result := '亥猪'
      else
      begin
        if StrToInt(Copy(DateStr, 6, i)) < 4 then
          Result := '戌狗'
        else
          Result := '亥猪';
      end;
  end; {case}
//  Result := CnSkyStemOfYear(Date) + Result;
end;

function CnSkyStemOfYear(Date: TDate): string; //返回十大天干
var
  i: integer;
  DateStr: string;
begin
  DateStr := FormatDateTime('yyyy/mm/dd', Date);
  i := length(inttostr(month(date)));
  case (StrToInt(Copy(DateStr, 1, 4)) - StrToInt(BaseSkyStemDate))
    mod 10 of
    0:
      if (StrToInt(Copy(DateStr, 6, i)) < 4) and ((Pos('腊',
        CnMonthOfDate(Date)) = 0) and (Pos('冬', CnMonthOfDate(Date)) = 0)) then
        Result := '甲'
      else
      begin
        if StrToInt(Copy(DateStr, 6, i)) < 4 then
          Result := '癸'
        else
          Result := '甲';
      end;
    1, -9:
      if (StrToInt(Copy(DateStr, 6, i)) < 4) and ((Pos('腊',
        CnMonthOfDate(Date)) = 0) and (Pos('冬', CnMonthOfDate(Date)) = 0)) then
        Result := '乙'
      else
      begin
        if StrToInt(Copy(DateStr, 6, i)) < 4 then
          Result := '甲'
        else
          Result := '乙';
      end;
    2, -8:
      if (StrToInt(Copy(DateStr, 6, i)) < 4) and ((Pos('腊',
        CnMonthOfDate(Date)) = 0) and (Pos('冬', CnMonthOfDate(Date)) = 0)) then
        Result := '丙'
      else
      begin
        if StrToInt(Copy(DateStr, 6, i)) < 4 then
          Result := '乙'
        else
          Result := '丙';
      end;
    3, -7:
      if (StrToInt(Copy(DateStr, 6, i)) < 4) and ((Pos('腊',
        CnMonthOfDate(Date)) = 0) and (Pos('冬', CnMonthOfDate(Date)) = 0)) then
        Result := '丁'
      else
      begin
        if StrToInt(Copy(DateStr, 6, i)) < 4 then
          Result := '丙'
        else
          Result := '丁';
      end;
    4, -6:
      if (StrToInt(Copy(DateStr, 6, i)) < 4) and ((Pos('腊',
        CnMonthOfDate(Date)) = 0) and (Pos('冬', CnMonthOfDate(Date)) = 0)) then
        Result := '戊'
      else
      begin
        if StrToInt(Copy(DateStr, 6, i)) < 4 then
          Result := '丁'
        else
          Result := '戊';
      end;
    5, -5:
      if (StrToInt(Copy(DateStr, 6, i)) < 4) and ((Pos('腊',
        CnMonthOfDate(Date)) = 0) and (Pos('冬', CnMonthOfDate(Date)) = 0)) then
        Result := '巳'
      else
      begin
        if StrToInt(Copy(DateStr, 6, i)) < 4 then
          Result := '戊'
        else
          Result := '巳';
      end;
    6, -4:
      if (StrToInt(Copy(DateStr, 6, i)) < 4) and ((Pos('腊',
        CnMonthOfDate(Date)) = 0) and (Pos('冬', CnMonthOfDate(Date)) = 0)) then
        Result := '庚'
      else
      begin
        if StrToInt(Copy(DateStr, 6, i)) < 4 then
          Result := '巳'
        else
          Result := '庚';
      end;
    7, -3:
      if (StrToInt(Copy(DateStr, 6, i)) < 4) and ((Pos('腊',
        CnMonthOfDate(Date)) = 0) and (Pos('冬', CnMonthOfDate(Date)) = 0)) then
        Result := '辛'
      else
      begin
        if StrToInt(Copy(DateStr, 6, i)) < 4 then
          Result := '庚'
        else
          Result := '辛';
      end;
    8, -2:
      if (StrToInt(Copy(DateStr, 6, i)) < 4) and ((Pos('腊',
        CnMonthOfDate(Date)) = 0) and (Pos('冬', CnMonthOfDate(Date)) = 0)) then
        Result := '壬'
      else
      begin
        if StrToInt(Copy(DateStr, 6, i)) < 4 then
          Result := '辛'
        else
          Result := '壬';
      end;
    9, -1:
      if (StrToInt(Copy(DateStr, 6, i)) < 4) and ((Pos('腊',
        CnMonthOfDate(Date)) = 0) and (Pos('冬', CnMonthOfDate(Date)) = 0)) then
        Result := '癸'
      else
      begin
        if StrToInt(Copy(DateStr, 6, i)) < 4 then
          Result := '壬'
        else
          Result := '癸';
      end;
  end;
  Result := Result + Copy(CnanimalOfYear(Date), 1, 3);
end;

function CnSolarTerm(Date: TDate): string; //返回十大天干
var
  Year, Month, Day, Hour: Word;
begin
  DecodeDate(Date, Year, Month, Day);
  //  d:=( ( 31556925974.7*(Year-1900) + SolarTerm[Month]*60000) + Date(1900,0,6,2,5) );

end;

function GetLunarHolDay(InDate: TDateTime; Days: Integer): string;
var
  Year, Month, Day, Hour: Word;
begin
  DecodeDate(Date, Year, Month, Day);
  Result := GetLunarHolDay(EncodeDate(Year, Month, Days));

end;

function GetLunarHolDay(InDate: TDateTime): string;
var
  i, iYear, iMonth, iDay: Word;
begin
  //  InDate := StrToDate(FormatDateTime('yyyy/mm/dd', InDate));

  Result := '';
  DecodeDate(InDate, iYear, iMonth, iDay);

  i := l_GetLunarHolDay(iYear, iMonth, iDay);
  case i of
    1: Result := '小寒';
    2: Result := '大寒';
    3: Result := '立春';
    4: Result := '雨水';
    5: Result := '惊蛰';
    6: Result := '春分';
    7: Result := '清明';
    8: Result := '谷雨';
    9: Result := '立夏';
    10: Result := '小满';
    11: Result := '芒种';
    12: Result := '夏至';
    13: Result := '小暑';
    14: Result := '大暑';
    15: Result := '立秋';
    16: Result := '处暑';
    17: Result := '白露';
    18: Result := '秋分';
    19: Result := '寒露';
    20: Result := '霜降';
    21: Result := '立冬';
    22: Result := '小雪';
    23: Result := '大雪';
    24: Result := '冬至';
  end;
end;

function l_GetLunarHolDay(iYear, iMonth, iDay: Word): Word;
var
  Flag: Byte;
  Day: Word;
begin
  //  var offDate = new Date( ( 31556925974.7*(y-1900) + sTermInfo[n]*60000  ) + Date.UTC(1900,0,6,2,5) )
  Flag := gLunarHolDay[(iYear - START_YEAR) * 12 + iMonth - 1];
  if iDay < 15 then
    Day := 15 - ((Flag shr 4) and $0F)
  else
    Day := (Flag and $0F) + 15;
  if iDay = Day then
    if iDay > 15 then
      Result := (iMonth - 1) * 2 + 2
    else
      Result := (iMonth - 1) * 2 + 1
  else
    Result := 0;
end;


function OtherHoliday(Month, Day: integer): string;
begin
  //五月的第二个星期日庆祝母亲节
  //將每年6月的第3個星期天定為父親節      ?
  {

  新年元旦[01/01] 腊八节[农历十二月初八]


   世界湿地日[02/02] 国际气象节[02/10] 情人节[02/14]
  除夕[农历十二月三十] 春节[农历正月初一] 元宵节[农历正月十五]


   全国爱耳日[03/03] 妇女节[03/08] 植树节[03/12]
  国际警察日[03/14] 国际消费日[03/15] 世界森林日[03/21]
  世界水日[03/22] 世界气象日[03/23] 世界防治结核病日[03/24]


   愚人节[04/01] 清明[04/05] 世界卫生日[04/07]
  世界地球日[04/22]


   国际劳动节[05/01] 中国青年节[05/04] 全国碘缺乏病日[05/05]
  世界红十字日[05/08] 国际护士节[05/12] 国际家庭日[05/15]
  世界电信日[05/17] 国际博物馆日[05/18] 全国助残日[05/19]
  全国学生营养日[05/20] 国际生物多样性日[05/22] 国际牛奶日[05/23]
  世界无烟日[05/31] 端午节[农历五月初五] 母亲节[第二个星期日]


   国际儿童节[06/01] 世界环境日[06/05] 全国爱眼日[06/06]
  端午节[06/15] 父亲节[第三个星期日] 防治荒漠化和干旱日[06/17]
  国际奥林匹克日[06/23] 全国土地日[06/25] 国际反毒品日[06/26]


   香港回归日[07/01] 七夕情人节[农历七月初七] 建党日[07/01]　
  中国人民抗日战争纪念日[07/07] 世界人口日[07/11]　


   八一建军节[08/01]　　


   劳动节[09/02]　 国际扫盲日[09/08] 教师节[09/10]
  国际臭氧层保护日[09/16] 国际和平日[09/17] 国际爱牙日[09/20]
  中秋节[农历八月十五] 国际聋人节[09/22] 世界旅游日[09/27]
  重阳节[农历九月九日]


   国庆节[10/01]　 国际音乐节[10/01] 国际减轻自然灾害日[10/02]
  世界动物日[10/04] 国际住房日[10/07] 全国高血压日[10/08]
  世界视觉日[10/08] 世界邮政日[10/09] 世界精神卫生日[10/10]
  国际盲人节[10/15] 世界粮食节[10/16] 世界消除贫困日[10/17]
  世界传统医药日[10/22] 联合国日[10/24] 万圣节[10/31]



   中国记者日[11/08]　 消防宣传日[11/09] 世界糖尿病日[11/14]
  国际大学生节[11/17] 感恩节[11/28]


   冬至节[农历12月22日] 世界艾滋病日[12/01] 世界残疾人日[12/03]
  世界足球日[12/09] 圣诞节[12/25]





  }
  result := '';

  case Month of
    1:
      begin
      end;

    2:
      begin

        if day = 2 then
          result := '湿地日';

        if day = 10 then
          result := '气象节';

      end;
    3:
      begin
        if day = 3 then
          result := '爱耳日';


        if day = 12 then
          result := '植树节';

        if day = 14 then
          result := '警察日';

        if day = 15 then
          result := '消费节';

        if day = 21 then
          result := '森林日';

        if day = 22 then
          result := '水日';

        if day = 23 then
          result := '气象日';

      end;
    4:
      begin

        if day = 7 then
          result := '卫生日';

        if day = 22 then
          result := '地球日';

      end;
    5:
      begin
        if day = 8 then
          result := '红十字';

        if day = 12 then
          result := '护士节';

        if day = 15 then
          result := '家庭日';

        if day = 17 then
          result := '电信日';

        if day = 18 then
          result := '博物馆';

        if day = 19 then
          result := '助残日';

        if day = 23 then
          result := '牛奶日';

        if day = 31 then
          result := '无烟日';

        // 母亲节[第二个星期日]
      end;
    6:
      begin

        if day = 5 then
          result := '环境日';

        if day = 6 then
          result := '爱眼日';

        if day = 23 then
          result := '体育日';

        if day = 25 then
          result := '土地日';

        if day = 26 then
          result := '反毒品';

        // 父亲节[第三个星期日]
      end;
    7:
      begin

        if day = 11 then
          result := '人口日';

      end;
    8:
      begin
        if day = 1 then
          result := '建军节';
      end;
    9:
      begin
        if day = 8 then
          result := '扫盲日';


        if day = 17 then
          result := '和平日';

        if day = 20 then
          result := '爱牙日';

        if day = 22 then
          result := '聋人节';

        if day = 27 then
          result := '旅游日';

      end;
    10:
      begin

        if day = 6 then
          result := '老人节';

        if day = 4 then
          result := '动物日';

        if day = 7 then
          result := '住房日';

        if day = 9 then
          result := '邮政日';

        if day = 15 then
          result := '盲人节';

        if day = 16 then
          result := '粮食日';


      end;

    11:
      begin
        if day = 8 then
          result := '记者日';

        if day = 9 then
          result := '消防日';

        if day = 17 then
          result := '大学生';


      end;
    12:
      begin
        if day = 9 then
          result := '足球日';

        if day = 24 then
          result := '平安夜';
      end;

  end;
end;

function Holiday(Date: TDateTime; Day: integer): string;
var
  dDate: TDate;
begin
  result := '';
  case Month(Date) of
    1:
      begin
        if day = 1 then
          result := '元旦节';
      end;

    2:
      begin
        if day = 14 then
          result := '情人节';
      end;
    3:
      begin
        if day = 8 then
          result := '妇女节';
      end;
    4:
      begin
        if day = 1 then
          result := '愚人节';
      end;
    5:
      begin
        if day = 1 then
          result := '劳动节';

        if day = 4 then
          result := '青年节';

        // 母亲节[第二个星期日]
        dDate := EnCodeDate(Year(Date), Month(Date), Day);
        if (DayOfWeek(dDate) = 1) then
          if (Trunc((Day - 1) / 7) = 1) then
            result := '母亲节';

      end;
    6:
      begin
        if day = 1 then
          result := '儿童节';

        // 父亲节[第三个星期日]
        dDate := EnCodeDate(Year(Date), Month(Date), Day);
        if (DayOfWeek(dDate) = 1) then
          if (Trunc((Day - 1) / 7) = 2) then
            result := '父亲节';
      end;
    7:
      begin
        if day = 1 then
          result := '建党节';
      end;
    8:
      begin
        if day = 1 then
          result := '建军节';

      end;
    9:
      begin
        if day = 10 then
          result := '教师节';
      end;
    10:
      begin
        if day = 1 then
          result := '国庆节';

        if day = 6 then
          result := '老人节';

        if day = 31 then
          result := '万圣节';

      end;

    11:
      begin
        if day = 8 then
          result := '记者日';

        // 感恩节(11月的第四个星期四 )
        dDate := EnCodeDate(Year(Date), Month(Date), Day);
        if (DayOfWeek(dDate) = 5) then
          if (Trunc((Day - 1) / 7) = 3) then
            result := '感恩节';

      end;
    12:
      begin
        if day = 25 then
          result := '圣诞节';
      end;

  end;
end;

function GetCnDateToDate(dDate: TDateTime): TDateTime;
begin
  Result := GetCnDateToDate(Year(Now), CnMonth(dDate), CnDay(dDate));
end;

function GetCnDateToDate(cYear, cMonth, cDay: word): TDateTime;
var
  tempDate: TDateTime;
  tempDay, tempMonth: Integer;

begin
  if cMonth > 11 then
    tempDate := EnCodeDate(cYear - 1, cMonth, cDay)
  else
    tempDate := EnCodeDate(cYear, cMonth, cDay);

  Result := 0;
  tempMonth := 0;
  tempDay := 0;
  while Result = 0 do
  begin
    tempDate := tempDate + 1;

    if CnMonth(tempDate) = cMonth then
      if CnDay(tempDate) = cDay then
      begin
        Result := tempDate;
        exit;
      end
      else
        if (cDay = 30) and (CnDay(tempDate) = 29)
          and (CnDay(tempDate + 1) <> 30) then
        begin
            //如果是没有30(闰月)，就提前一天
          Result := tempDate;
          exit;
        end;

  end;
end;

function GetDays(ADate: TDate): Extended;
var
  FirstOfYear: TDateTime;
begin
  FirstOfYear := EncodeDate(StrToInt(FormatDateTime('yyyy', now)) - 1, 12, 31);
  Result := ADate - FirstOfYear;
end;

function Constellation(Date: TDateTime; Day: integer): string; overload;
var
  Year, Month, Days, Hour: Word;
begin
  DecodeDate(Date, Year, Month, Days);
  Result := Constellation(EncodeDate(Year, Month, Day));
end;

function Constellation(ADate: TDate): string;
begin
  case Month(ADate) of
    1:
      begin
        if day(ADate) <= 19 then
          result := '摩羯座';

        if day(ADate) >= 20 then
          result := '水瓶座';
      end;

    2:
      begin
        if day(ADate) <= 18 then
          result := '水瓶座';

        if day(ADate) >= 19 then
          result := '双鱼座';
      end;

    3:
      begin
        if day(ADate) <= 20 then
          result := '双鱼座';

        if day(ADate) >= 21 then
          result := '白羊座';
      end;

    4:
      begin
        if day(ADate) <= 19 then
          result := '白羊座';

        if day(ADate) >= 20 then
          result := '金牛座';
      end;

    5:
      begin
        if day(ADate) <= 20 then
          result := '金牛座';

        if day(ADate) >= 21 then
          result := '双子座';
      end;

    6:
      begin
        if day(ADate) <= 21 then
          result := '双子座';

        if day(ADate) >= 22 then
          result := '巨蟹座';
      end;

    7:
      begin
        if day(ADate) <= 22 then
          result := '巨蟹座';

        if day(ADate) >= 23 then
          result := '狮子座';
      end;

    8:
      begin
        if day(ADate) <= 22 then
          result := '狮子座';

        if day(ADate) >= 23 then
          result := '处女座';
      end;

    9:
      begin
        if day(ADate) <= 22 then
          result := '处女座';

        if day(ADate) >= 23 then
          result := '天秤座';
      end;

    10:
      begin
        if day(ADate) <= 23 then
          result := '天秤座';

        if day(ADate) >= 24 then
          result := '天蝎座';
      end;

    11:
      begin
        if day(ADate) <= 21 then
          result := '天蝎座';

        if day(ADate) >= 22 then
          result := '射手座';
      end;

    12:
      begin
        if day(ADate) <= 21 then
          result := '射手座';

        if day(ADate) >= 22 then
          result := '摩羯座';
      end;
  end;
end;
{
//存储星座配信息
1白羊座： 03月21日-------04月19日  Aries
2金牛座： 04月20日-------05月20日  Taurus
3双子座： 05月21日-------06月21日  Gemini
4巨蟹座： 06月22日-------07月22日  Cancer
5狮子座： 07月23日-------08月22日  Leo
6处女座： 08月23日-------09月22日  Virgo
7天秤座： 09月23日-------10月23日  Libra
8天蝎座： 10月24日-------11月21日  Scorpio
9射手座： 11月22日-------12月21日  Sagittarius
10摩羯座： 12月22日-------01月19日  Capricorn
11水瓶座： 01月20日-------02月18日  Aquarius
12双鱼座： 02月19日-------03月20日  Pisces
}
end.

