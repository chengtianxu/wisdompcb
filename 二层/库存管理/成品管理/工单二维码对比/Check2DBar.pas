unit Check2DBar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, DB, DM;

type
  TForm1 = class(TForm)
    lbl1: TLabel;
    edtgonghao: TEdit;
    lbl2: TLabel;
    edtwo: TEdit;
    edt2dbar: TEdit;
    lbl3: TLabel;
    btn1: TButton;
    ads1: TADODataSet;
    qrytmp: TADOQuery;
    edtzq: TEdit;
    lbl4: TLabel;
    procedure edt2dbarKeyPress(Sender: TObject; var Key: Char);
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Frkey73: string;
    FRkey06: string;
    function CheckUser(AGongHao: string): Boolean;
    function CheckWO(AWO: string): Boolean;
    function CheckWOAnd2D(AWO,A2D: string): Boolean;
    function InsertHistory(ASucc: string): Boolean;
  end;

var
  Form1: TForm1;

implementation

uses
  StrUtils, history,common;

{$R *.dfm}

function TForm1.CheckUser(AGongHao: string): Boolean;
begin
  Result := False;
  qrytmp.Close;
  qrytmp.SQL.Text := 'select rkey from data0073 where USER_LOGIN_NAME = ' + QuotedStr(AGongHao);
  qrytmp.Open;
  if qrytmp.IsEmpty then
    Result := False
  else
  begin
    Result := True;
    Frkey73 := qrytmp.fieldbyname('Rkey').AsString;
  end;
end;

function TForm1.CheckWO(AWO: string): Boolean;
begin
  Result := False;
  qrytmp.Close;
  qrytmp.SQL.Text := 'select rkey from data0006 where work_order_number = ' + QuotedStr(AWO);
  qrytmp.Open;
  if qrytmp.IsEmpty then
    Result := False
  else
  begin
    Result := True;
    FRkey06 := qrytmp.fieldbyname('rkey').AsString;
  end;
end;

function TForm1.CheckWOAnd2D(AWO, A2D: string): Boolean;
var
  LSql: string;
  LManuPartNumber: string;
  LManuPartDesc: string;
  lstr: string;
begin
  //wo
  Result := False;
  qrytmp.Close;
  LSql := ' SELECT d25.MANU_PART_NUMBER,d25.MANU_PART_DESC from Data0006 d06 ' +
        ' inner join Data0025 d25 ON d25.RKEY = d06.BOM_PTR ' +
' WHERE d06.WORK_ORDER_NUMBER = ' + QuotedStr(AWO);
  qrytmp.SQL.Text := LSql;
  qrytmp.Open;
  if qrytmp.IsEmpty then
  begin
    Result := False;
    Exit;
  end;

  LManuPartNumber := qrytmp.fieldbyname('MANU_PART_NUMBER').AsString;
  LManuPartDesc := qrytmp.fieldbyname('MANU_PART_DESC').AsString;

  //2D
  if Length(A2D) <> 20 then
  begin
    Result := False;
    Exit;
  end;

  qrytmp.Close;
  LSql := 'SELECT 1 FROM Print2D_PrintData where WorkOrderNumber = '+ QuotedStr(AWO)+' and  OutPutStr = ' + QuotedStr(A2D);
  qrytmp.SQL.Text := LSql;
  qrytmp.Open;
  if qrytmp.IsEmpty then
  begin
    Result := false;
    Exit;
  end;

  lstr := 'T' + RightStr(LManuPartDesc,6) + 'MQ';
  if LeftStr(A2D,9) <> lstr then
  begin
    Result := False;
    Exit;
  end;

  Result := True;
end;

procedure TForm1.edt2dbarKeyPress(Sender: TObject; var Key: Char);
var
  LSucc: string;
begin
  if (Key = #13) then
  begin
    if not CheckUser(edtgonghao.Text) then
    begin
      ShowMessage('工号无效');
      Exit;
    end;
    if not CheckWO(edtwo.Text) then
    begin
      ShowMessage('工单无效');
      Exit;
    end;
    if not CheckWOAnd2D(edtwo.Text,edt2dbar.Text) then
    begin
      ShowMessage('NG');
      LSucc := 'NG';
    end else
      LSucc := 'OK';

    InsertHistory(LSucc);

    edt2dbar.Text := '';
    edt2dbar.SetFocus;
  end;
end;

function TForm1.InsertHistory(ASucc: string): Boolean;
var
  ldt: TDateTime;
begin
  qrytmp.Close;
  qrytmp.SQL.Text := 'select getdate() as dt';
  qrytmp.Open;
  ldt := qrytmp.fieldbyname('dt').AsDateTime;

  qrytmp.close;
  qrytmp.SQL.Text := 'select * from data0737HWZD where 1=0';
  qrytmp.Open;
  qrytmp.Append;
  qrytmp.FieldByName('WO_Ptr').AsString := FRkey06;
  qrytmp.FieldByName('Bar2D').AsString := edt2dbar.Text;
  qrytmp.fieldbyname('Succ').AsString := ASucc;
  qrytmp.fieldbyname('D73_Ptr').AsString := Frkey73;
  qrytmp.fieldbyname('DTime').AsDateTime := ldt;
  qrytmp.Post;


end;

procedure TForm1.btn1Click(Sender: TObject);
begin
  with TfrmHistroy.create(Self) do
  begin
    try
      ShowModal;
    finally
      free;
    end;


  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if not app_init_2(dm1.con1) then
  begin
    showmsg('程序起动失败,请联系管理员!', 1);
    application.Terminate;
    exit;
  end;
  self.caption := application.Title;


// rkey73:='1';
// vprev:='4';
// user_ptr := '1284';
 //DM.ADOConnection1.Open;
end;

end.
