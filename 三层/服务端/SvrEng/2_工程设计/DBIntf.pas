{*******************************************************}
{                                                       }
{       Chengtx                                         }
{                                                       }
{       ∞Ê»®À˘”– (C) 2016 5.17                          }
{                                                       }
{*******************************************************}


unit DBIntf;

interface

type
  IData = interface
  ['{53C0BDB1-9058-4DD8-BAA4-0580648FC19B}']
    function GetDataBySql(ASql: string; out AData: OleVariant; out ErrMsg: string): Boolean;
    function PostDataBySql(ASql: string;AData: OleVariant; out ErrMsg: string): Boolean;
    function GetDataBySqlArr(ArrSql: OleVariant; out ADataArr: OleVariant; out ErrMsg: string): Boolean;
    function PostDataBySqlArr(ArrSql: OleVariant; ADataArr: OleVariant; out ErrMsg: string): Boolean;
  end;

implementation

end.
