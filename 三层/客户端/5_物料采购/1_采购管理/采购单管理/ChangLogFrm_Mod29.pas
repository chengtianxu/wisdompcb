unit ChangLogFrm_Mod29;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Datasnap.DBClient,uBaseFrm;

type
  TfrmChangLog_Mod29 = class(TfrmBase)
    pnl1: TPanel;
    pnl2: TPanel;
    btnClose: TBitBtn;
    mmo1: TMemo;
    cds339: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData(ARkey,AType:string);
    procedure Init_Memo(AType: string);
  end;

var
  frmChangLog_Mod29: TfrmChangLog_Mod29;

implementation

uses uCommFunc;
{$R *.dfm}

{ TfrmChangLog_Mod29 }

procedure TfrmChangLog_Mod29.GetData(ARkey,AType: string);
var
  LSql:string;
begin
  if AType = 'S' then
  begin
    LSql:=' SELECT Data0339.TRAN_DESCRIPTION, Data0339.TRAN_FROM  ' + #13 +
          '      ,Data0339.TRAN_TO, Data0339.TRAN_DATE     ' + #13 +
          '      ,Data0005.EMPLOYEE_NAME, Data0017.INV_PART_NUMBER   ' + #13 +
          '  FROM Data0017  RIGHT OUTER JOIN   ' + #13 +
          '      Data0071 ON Data0017.RKEY = Data0071.INVT_PTR RIGHT OUTER JOIN   ' + #13 +
          '      Data0339 INNER JOIN Data0005 ON Data0339.EDITED_BY_PTR = Data0005.RKEY ON  ' + #13 +
          '      Data0071.RKEY = Data0339.DATA0071_PTR  ' + #13 +
          '  WHERE Data0339.TRAN_TYPE <> 6   ' +
          '  and data0339.po_ptr=  ' + ARkey + #13 +
          '  order by TRAN_DATE '
  end
  else
  begin
    LSql:=' SELECT dbo.Data0339.TRAN_DESCRIPTION, dbo.Data0339.TRAN_FROM  ' + #13 +
          '    ,dbo.Data0339.TRAN_TO, dbo.Data0339.TRAN_DATE    ' + #13 +
          '    ,dbo.Data0005.EMPLOYEE_NAME, dbo.Data0339.TRAN_TYPE   ' + #13 +
          '    ,Data0072.DESCRIPTION   ' + #13 +
          '  FROM Data0339 INNER JOIN  ' + #13 +
          '      Data0005 ON Data0339.EDITED_BY_PTR = dbo.Data0005.RKEY LEFT OUTER JOIN   ' + #13 +
          '      Data0072 ON dbo.Data0339.DATA0072_PTR = dbo.Data0072.RKEY   ' + #13 +
          '  WHERE dbo.Data0339.TRAN_TYPE <> 6  ' +
          '   and data0339.po_ptr=  ' + ARkey + #13 +
          '  order by TRAN_DATE  ';
  end;
  if not gSvrIntf.IntfGetDataBySql(LSql,cds339) then Exit;
end;

procedure TfrmChangLog_Mod29.Init_Memo(AType: string);
var
  str1:string;
begin
  if not cds339.IsEmpty then
  begin
    cds339.First;
    while not cds339.Eof do
    begin
      if AType = 'S' then
      begin
        str1:= Trim(cds339.FieldByName('EMPLOYEE_NAME').AsString) +
            ' ' + Trim(cds339.FieldByName('TRAN_DATE').AsString) +
            ' ' + Trim(cds339.FieldByName('TRAN_DESCRIPTION').AsString);
        mmo1.Lines.Add(str1);
        str1:='材料编码：' + Trim(cds339.FieldByName('INV_PART_NUMBER').AsString) +
            ' 原值 ' + Trim(cds339.FieldByName('TRAN_FROM').AsString) +
            ' 新值 ' + Trim(cds339.FieldByName('TRAN_TO').AsString);
        mmo1.Lines.Add(str1);
      end
      else
      begin
        str1:= Trim(cds339.FieldByName('EMPLOYEE_NAME').AsString) +
            ' ' + Trim(cds339.FieldByName('TRAN_DATE').AsString) +
            ' ' + Trim(cds339.FieldByName('TRAN_DESCRIPTION').AsString);
        mmo1.Lines.Add(str1);
        str1:='材料名称：' + Trim(cds339.FieldByName('DESCRIPTION').AsString) +
            ' 原值 ' + Trim(cds339.FieldByName('TRAN_FROM').AsString) +
            ' 新值 ' + Trim(cds339.FieldByName('TRAN_TO').AsString);
        mmo1.Lines.Add(str1);
      end;
      cds339.Next;
    end;
  end
  else
  begin
    mmo1.Lines.Add('无');
  end;
end;

end.
