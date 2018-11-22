unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, DB, ADODB, Mask,
  DBCtrls, common;

type
  TForm1 = class(TForm)
    pnl1: TPanel;
    btn1: TBitBtn;
    btn4: TBitBtn;
    dbgrideh1: TDBGridEh;
    con1: TADOConnection;
    qry1: TADOQuery;
    ds1: TDataSource;
    qry1Rkey: TAutoIncField;
    qry1PriceCode: TStringField;
    qry1PriceName: TStringField;
    btn5: TBitBtn;
    pnl2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btn6: TBitBtn;
    btn3: TButton;
    edt1: TEdit;
    edt2: TEdit;
    procedure btn1Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure qry1AfterScroll(DataSet: TDataSet);
    procedure btn6Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure dbgrideh1ColExit(Sender: TObject);
  private
    { Private declarations }
    Ftag: Integer;
    PriceCode, PriceName: string;
    procedure Edt_TStyle();
    procedure Edt_FStyle();
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Edt_FStyle();
begin
  edt1.ReadOnly := false;
  edt2.ReadOnly := false;
  edt1.Color := clwhite;
  edt2.Color := clwhite;
end;

procedure TForm1.Edt_TStyle();
begin
  edt1.ReadOnly := true;
  edt2.ReadOnly := true;
  edt1.Color := cl3DLight;
  edt2.Color := cl3DLight;
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TForm1.btn5Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    showmessage('对不起，您只有该程序的只读权限！');
    Exit;
  end;
  if qry1.RecordCount <= 0 then
  begin
    showmessage('当前无记录可操作！');
    Exit;
  end;  
  if MessageBox(Handle,'确定要删除该行记录吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
  qry1.Delete;
  qry1.Requery();
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if not app_init_2(con1) then
  begin
    showmsg('程序启动失败，请与系统管理员联系！','提示',1);
    application.Terminate;
    exit;
  end;
  self.Caption:=application.Title;
  //vprev := '4';
  //user_ptr := '3';
  qry1.Close;
  qry1.Open;
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    showmessage('对不起，您只有该程序的只读权限！');
    Exit;
  end;
  Edt_FStyle();
  Ftag := 0;
  edt1.Text := '';
  edt2.Text := '';
  btn3.Enabled := True;
  edt1.SetFocus;
  btn5.Enabled := false;
  btn6.Enabled := false;
end;

procedure TForm1.qry1AfterScroll(DataSet: TDataSet);
begin
  if qry1.RecordCount <= 0 then Exit;
  Edt_TStyle;
  edt1.Text := qry1.FieldValues['PriceCode'];
  edt2.Text := qry1.FieldValues['PriceName'];
end;

procedure TForm1.btn6Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    showmessage('对不起，您只有该程序的只读权限！');
    Exit;
  end;
  if qry1.RecordCount <= 0 then
  begin
    showmessage('当前无记录可操作！');
    Exit;
  end;
  Edt_FStyle();
  Ftag := 1;
  edt1.SetFocus;
  btn3.Enabled := true;
  priceCode := edt1.Text;
  priceName := edt2.Text;
end;

procedure TForm1.btn3Click(Sender: TObject);
var
  QryTemp: TADOquery;
begin
  if edt1.Text = '' then
  begin
    showmessage('价格类别代码不能为空！');
    edt1.SetFocus;
    Exit;
  end;
  if edt2.Text = '' then
  begin
    showmessage('价格类别名称不能为空！');
    edt2.SetFocus;
    Exit;
  end;
  if length(edt1.Text) > 10 then
  begin
    showmessage('长度超过10，保存失败！');
    Exit;
  end;
  if length(edt2.Text) > 20 then
  begin
    showmessage('长度超过20，保存失败！');
    Exit;
  end;
  try
    QryTemp := TADOquery.Create(nil);
    Qrytemp.Connection := con1;

    if Ftag = 0 then    //新增
    begin
      Qrytemp.close;
      Qrytemp.SQL.Clear;
      Qrytemp.SQL.Text := 'select rkey from data0579 where PriceCode = ' + quotedstr(edt1.Text)
        + ' or PriceName = ' + quotedstr(edt2.Text);
      Qrytemp.Open;
      if not Qrytemp.isempty then
      begin
        showmessage('价格代码或价格名称重复，保存失败！');
        Exit;
      end;

      Qrytemp.close;
      Qrytemp.SQL.Clear;
      Qrytemp.SQL.Text := Format('insert into data0579(PriceCode, PriceName) '
        + ' values(''%s'', ''%s'')', [edt1.Text, edt2.Text]);
      Qrytemp.ExecSQL;
    end;

    if Ftag = 1 then    //修改
    begin
      Qrytemp.close;
      Qrytemp.SQL.Clear;
      Qrytemp.SQL.Text := 'select * from data0579 where PriceCode <> ' + quotedstr(PriceCode);
      Qrytemp.Open;
      Qrytemp.First;
      while not Qrytemp.Eof do
      begin
        if edt1.Text = Qrytemp.FieldByName('PriceCode').AsString then
        begin
          showmessage('价格代码重复，请检查！');
          Exit;
        end;
        Qrytemp.Next;
      end;
      
      Qrytemp.close;
      Qrytemp.SQL.Clear;
      Qrytemp.SQL.Text := 'select * from data0579 where PriceName <> ' + quotedstr(PriceName);
      Qrytemp.Open;
      Qrytemp.First;
      while not Qrytemp.Eof do
      begin
        if edt2.Text = Qrytemp.FieldByName('PriceName').AsString then
        begin
          showmessage('价格名称重复，请检查！');
          Exit;
        end;
        Qrytemp.Next;
      end;

      Qrytemp.close;
      Qrytemp.SQL.Clear;
      Qrytemp.SQL.Text := Format('update data0579 set PriceCode = ''%s'','
        + ' PriceName = ''%s'' where rkey = %d',
        [edt1.Text, edt2.Text, qry1.FieldByName('Rkey').AsInteger]);
      Qrytemp.ExecSQL;        
    end;
  finally
    QryTemp.free;
    qry1.Requery();
  end;
end;

procedure TForm1.dbgrideh1ColExit(Sender: TObject);
begin
  if qry1.RecordCount <= 0 then Exit;
  btn5.Enabled := true;
  btn6.Enabled := true;
  btn3.Enabled := False;
  edt1.Text := qry1.FieldValues['PriceCode'];
  edt2.Text := qry1.FieldValues['PriceName'];
  Edt_TStyle();
end;

end.
