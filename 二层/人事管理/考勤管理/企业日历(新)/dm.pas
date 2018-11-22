unit dm;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tudm = class(TDataModule)
    adocon: TADOConnection;
    adoqry: TADOQuery;
    dsqry: TDataSource;
    dstbl: TDataSource;
    adotbl: TADOTable;

  private
    { Private declarations }
  public
    function  doqry(msgtype,rkey:Integer;typename,color,remark:string):Boolean;
    function  setdayqry(rkey,calid,year,month,day,restype,slr_ptr:Integer):Boolean;
    procedure getslrnames(var list:TStrings);
    procedure getspecday(y,m,satype:Integer;var days:TStrings);
    { Public declarations }
  end;

var
  udm: Tudm;

implementation

{$R *.dfm}

{ Tudm }

function Tudm.doqry(msgtype, rkey: Integer; typename, color, remark: string):Boolean;
begin
  with adoqry do
  begin
    Close;
    if msgtype=3 then
    begin
      SQL.Clear;
      SQL.Add(format('SELECT COUNT(Type) AS cnt FROM FactoryCalendar WHERE (Type = %d)',[rkey]));
      try
        Active;
      except
        Connection.Close;
        Connection.Open;
      end;
      Open;
      First;
      if Eof then
      begin
        Close;
        Result:=True;
      end
      else if FieldByName('cnt').AsInteger>0 then
        begin
          Result:=False;
          Exit;
        end;
    end;

    Close;
    SQL.Clear;
    case msgtype of
    1:  SQL.Text:=Format('INSERT INTO [Resttypemsg] '
                        +'([resttype_name],[color],[remark]) '+
                        ' VALUES '+
                        ' (''%s'',''%S'',''%s'')'
                         ,[typename,color,remark]);
    2:  SQL.Text:=Format('UPDATE [Resttypemsg] '+
                         'SET [resttype_name] = ''%s'' '+
                         ',[color] = ''%s'' '+
                         ',[remark] = ''%s'' '+
                         ' WHERE [rkey] = %d '
                         ,[typename,color,remark,rkey]);
    3:  SQL.Text:=Format('DELETE FROM [Resttypemsg] WHERE rkey=%d ',[rkey]);
    end;
    try
      Active;
    except
      Connection.Close;
      Connection.Open;
    end;
    Result:=ExecSQL>0;
    Close;
  end;
end;

procedure Tudm.getslrnames(var list: TStrings);
var
  i:Integer;
begin
  if list=nil then list:=TStringList.Create;
  with adoqry do
  begin
    Close;
    SQL.Clear;
    //=====================================
    SQL.Add('select rkey,accountname from dbo.salaryaccount');
    //修改日历和帐套关系的视乎这里要改  sign:f2w3rfs
    //=====================================

    try
      Active;
    except
      Connection.Close;
      Connection.Open;
    end;
    Open;
    First;
    while not Eof do
    begin
      i:=FieldValues['rkey'];
      list.AddObject(FieldValues['accountname'],TObject(i));
      Next;
    end;
    Close;
  end;
end;

procedure Tudm.getspecday(y, m, satype: Integer; var days: TStrings);
var
  str:string;
  i:Integer;
begin
  if days=nil then days:=TStringList.Create;
  with adoqry do
  begin
    Close;
    SQL.Clear;
    SQL.Add(Format('SELECT DATEPART(d, RestDate) AS d,color, dbo.FactoryCalendar.rkey ' +
      'FROM  dbo.FactoryCalendar INNER JOIN ' +
      'dbo.Resttypemsg ON dbo.FactoryCalendar.Type = dbo.Resttypemsg.rkey ' +
      'WHERE (CalendarID = %d) AND (CONVERT(char(7), RestDate, 120) = ''%d-%.2d'') ' +
      'ORDER BY d ',  [satype,y,m]));
    try
      Active;
    except
      Connection.Close;
      Connection.Open;
    end;
    Open;
    First;
    if not Eof then
    for i:=0 to 30 do
    begin
      if (i+1)=Integer(FieldValues['d']) then
      begin
        str:=string(FieldValues['rkey'])+'='+string(FieldValues['color']);
        if not Eof then Next;
      end
      else
        str:='';
      days.Add(str);
    end
    else
    for i:=0 to 30 do
      days.Add('');
      
    Close;
  end;
end;



function Tudm.setdayqry(rkey, calid, year, month, day, restype,
  slr_ptr: Integer): Boolean;
begin
  with adoqry do
  begin
    Close;
    SQL.Clear;
    if rkey>0 then
      case restype of
      0: SQL.Add(Format('DELETE FROM FactoryCalendar WHERE rkey=%d and Slr_ptr= %d ',[rkey,slr_ptr]));
      else
         SQL.Add(Format('UPDATE FactoryCalendar SET [Type] = %d WHERE rkey=%d and Slr_ptr= %d ',[restype, rkey,slr_ptr]));
      end
    else if  restype>0 then
    begin
      SQL.Add(Format('INSERT INTO [FactoryCalendar]([CalendarID] ,[RestDate],[Type],[Slr_ptr])'+
              'VALUES ( %d , ''%d-%d-%d 00:00:00'', %d , %d )',[calid,year, month, day,restype,slr_ptr]));
    end
    else
    begin
      Result:=True;
      Exit;
    end;

    try
      Active;
    except
      Connection.Close;
      Connection.Open;
    end;
    Result:=ExecSQL>0;
    Close;
  end;
end;

end.
