unit RptDMOut;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, frxClass, frxDBSet,
  Datasnap.DBClient;

type
  TdmRptOut = class(TDataModule)
    cdsBP06: TClientDataSet;
    cdsBP10: TClientDataSet;
    strngfldBP10PARAMETER_DESC: TStringField;
    strngfldBP10Param_Value: TStringField;
    cdsOther: TClientDataSet;
    strngfldOtherShipTo: TStringField;
    strngfldBP10unit_code: TStringField;
    strngfldBP10PARAMETER_Name: TStringField;
    cdsBP09: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    function StrToSQL(const AStr:string):string;
  public
    { Public declarations }
    function GetData(AIDKey06: string): Boolean;
    function PrintExcelRpt(AIDKeyBp06: string;AExcelFile: string): Boolean;
  end;

var
  dmRptOut: TdmRptOut;

implementation

uses
  DBImpl,DataIntf, System.Win.ComObj, System.Variants, Vcl.Dialogs, System.StrUtils;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmRptOut }

procedure TdmRptOut.DataModuleCreate(Sender: TObject);
begin
  cdsOther.CreateDataSet;
end;

function TdmRptOut.GetData(AIDKey06: string): Boolean;
var
  LTmp: ITMP;
  LCds: TClientDataSet;
  LSql: string;
begin
  LTmp := ttmp.Create;
  LCds := TClientDataSet.Create(Self);
  try
    //bp06
    LSql := ' select bp06.*,d05.PHONE AS salemanphone,d05.EMPLOYEE_NAME as salemanname,d01.CURR_NAME,d01.curr_code,d01.BASE_TO_OTHER from BOMPrice06 bp06 ' +
            //' LEFT JOIN Data0010 d10 ON bp06.D10_Ptr = d10.RKEY ' +
            ' LEFT join Data0005 d05 ON d05.RKEY = bp06.SaleMan ' +
            ' LEFT JOIN Data0001 d01 ON bp06.D01_Ptr = d01.RKEY ' +
            ' where bp06.idkey = ' + QuotedStr(AIDKey06);
    cdsBP06.Data := LTmp.SqlOpen(LSql);

    //bp10
    LSql := ' SELECT d02.unit_code, d278.PARAMETER_DESC,d278.PARAMETER_Name,bp10.Param_Value FROM BOMPrice10 bp10 INNER JOIN Data0278 d278 ON bp10.D278_ptr = d278.RKEY ' +
            ' inner join data0002 d02 on d02.rkey = d278.UNIT_PTR ' +
            ' WHERE bp10.BP06_ptr = ' + QuotedStr(AIDKey06) +
            ' and isnull(bp10.Param_Value,''0'') <> ''0''';
    cdsBP10.Data := LTmp.SqlOpen(LSql);


    //BP09
    LSql := ' select BP09.*,d278.PARAMETER_Name from BomPrice09 BP09 ' +
            ' inner join data0278 d278 on d278.rkey = bp09.d278_ptr ' +
            ' where BP09.BP06_Ptr = ' + QuotedStr(AIDKey06);
    cdsBP09.Data := LTmp.SqlOpen(LSql);


    //other
    cdsOther.Append;
    LSql := ' SELECT d278.PARAMETER_DESC,bp10.Param_Value FROM BOMPrice10 bp10 INNER JOIN Data0278 d278 ON bp10.D278_ptr = d278.RKEY ' +
            ' WHERE bp10.BP06_ptr = ' + QuotedStr(AIDKey06) +
            ' and d278.parameter_name = ''bArea''';
    LCds.Data := LTmp.SqlOpen(LSql);
    cdsOther.FieldByName('shipto').AsString := LCds.FieldByName('Param_Value').AsString;
    cdsOther.Post;
  finally
    LCds.Free;
  end;
  Result := True;
end;

function TdmRptOut.PrintExcelRpt(AIDKeyBp06: string;AExcelFile: string): Boolean;
var
  excel,WorkBook,Sheet: Variant;
  i,j,iRow,iColumn:integer;
  vstr:string;
begin
  Result := False;
  try
    GetData(AIDKeyBp06);

    try
      excel := CreateOleObject('Excel.Application');
//      WorkBook := excel.Workbooks.Add('D:\SJSYS\NIERP\Report\报价单.xls');

        WorkBook := excel.Workbooks.Add(AExcelFile) ;
      Sheet := WorkBook.Worksheets[1];
    except
      excel := NULL;
      showmessage('请先安装Excel97/2000');
      EXIT;
    end;
    excel.Visible:=true;

    //取行数，列数
//    iRow := excel.ActiveCell.Row;
//    iColumn := excel.ActiveCell.Column;
    iRow:=excel.activeSheet.Usedrange.Rows.count;
    iColumn:= excel.activeSheet.Usedrange.Columns.count;
    for i:=1 to iRow do//最大取值200
    begin
      for j:=1 to iColumn do
      begin
        if TVarData(WorkBook.activesheet.Cells[i,j].value).VType <> VarError then
            vstr:= VarToStr(WorkBook.activesheet.Cells[i,j].value)
        else
           vstr:='';
     //   vstr:= WorkBook.activesheet.Cells[i,j].value;
        if vstr<>'' then
         if copy(vstr,1,3)='ASC' then
         begin
           vstr:=StrToSQL(vstr);
           WorkBook.activesheet.Cells[i,j]:=vstr;
         end;
      end;
    end;
    Result := True;
  finally

  end;
end;

function TdmRptOut.StrToSQL(const AStr: string): string;
var
  vStr,tmp:string;
  i:integer;
  a:array of string;

  function GetStrCounts(ASubStr, AStr: string): Integer;
  var
    i: Integer;
  begin
    Result := 0;
    i := 1;
    while PosEx(ASubStr, AStr, i) <> 0 do
    begin
      Inc(Result);
      i := PosEx(ASubStr, AStr, i) + 1;
    end;
  end;
begin
  vStr:=ANSIUPPERCASE(AStr);
  tmp:=copy(vStr,1,pos('")',vStr)-1);
  tmp:=copy(tmp,pos('ASC("',vStr)+length('ASC("'),length(tmp)-pos('ASC("',vStr)-length('ASC("')+1);
  Setlength(a,GetStrCounts(',',tmp)+1);
  for i:=0 to Length(a)-1 do
  begin
    if pos(',',tmp)>0 then
      a[i]:= copy(tmp,1,pos(',',tmp)-1)
    else
      a[i]:= tmp;
    tmp:= copy(tmp,pos(',',tmp)+1,length(tmp)-pos(',',tmp)+1);
  end;

  if a[0]='BP06' then
  begin
    Result:=cdsBP06.FieldByName(a[1]).AsString;
  end
  else if a[0]='BP10' then
  begin
    if cdsBP10.Locate('PARAMETER_Name',a[1],[loCaseInsensitive]) then
      Result:=cdsBP10.FieldByName('Param_Value').AsString
    else
      Result := '';
  end
  else if a[0]='BP09' then
  begin
    if cdsBP09.Locate('PARAMETER_Name',a[1],[loCaseInsensitive]) then
      Result:=cdsBP09.FieldByName('Param_Value').AsString
    else
      Result := '';
  end
  else
    Result:='';
end;

end.
