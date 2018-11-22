unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB, ADODB, damo, common,
  DBGridEh, term;

type
  TMainFrm = class(TForm)
    pnl1: TPanel;
    bbt_1: TBitBtn;
    bbt_3: TBitBtn;
    bbt_4: TBitBtn;
    pnl2: TPanel;
    edt_1: TEdit;
    label1: TLabel;
    dgh_grd1: TDBGridEh;
    chk_1: TCheckBox;
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure bbt_4Click(Sender: TObject);
    procedure bbt_1Click(Sender: TObject);
    procedure bbt_3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dgh_grd1TitleClick(Column: TColumnEh);
    procedure edt_1Change(Sender: TObject);
    procedure chk_1Click(Sender: TObject);
    procedure dgh_grd1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure dgh_grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumnEh;
    MainTime, qry1Time, Temptime, MainTime1, field_name: string;
    function GetStatus(): string;
  public
    { Public declarations }


  end;

var
  MainFrm: TMainFrm;

implementation


{$R *.dfm}

procedure TMainFrm.FormShow(Sender: TObject);
var
  i: Integer;
begin
  DM.TimeTag := 0;
  MainTime := dm.qryMain.SQL.Text;
  MainTime1 := dm.qryMain.SQL.Text;
  qry1Time := dm.qry1.SQL.Text;
  Temptime := dm.qrytemptable.SQL.Text;
  DM.qrytemptable.ExecSQL;
  dm.qryMain.Open;
  for i := 0 to dm.qryMain.FieldCount - 1 do
  begin
    dgh_grd1.Columns[i].Title.Caption := DM.qryMain.Fields[i].FieldName;
    dgh_grd1.Columns[i].FieldName := DM.qryMain.Fields[i].FieldName;
  end;
  //dgh_grd1.Columns[dm.qryMain.FieldCount - 1].DisplayFormat := '0.00%';
  //dgh_grd1.Columns[dgh_grd1.Columns.Count - 1].Title.Caption := '额外加价率%';
  //dgh_grd1.Columns[dgh_grd1.Columns.Count - 2].Title.Caption := '大料利用率%';
  dgh_grd1.Columns[1].Width := 80;
  dgh_grd1.Columns[2].Width := 80;
  dgh_grd1.Columns[3].Width := 80;
  dgh_grd1.Columns[4].Width := 120;
  dgh_grd1.Columns[5].Width := 100;
  dgh_grd1.Columns[6].Width := 80;
  dgh_grd1.Columns[7].Width := 200;
  field_name := dgh_grd1.Columns[0].FieldName;
  PreColumn := dgh_grd1.Columns[0];
  dgh_grd1.Columns[0].Title.Color := clred ;
  label1.Caption := dgh_grd1.Columns[0].FieldName;
  label1.Left := edt_1.Left - label1.Width - 5;
end;

procedure TMainFrm.bbt_4Click(Sender: TObject);
var
  i: Integer;
begin
  try
    chk_1.Checked := false;
    dgh_grd1.Columns.Clear;
    form_condition:=Tform_condition.Create(application);
    form_condition.ShowModal;
    if dm.tt = 0 then Exit;
    DM.qrytemptable.Close;
    DM.qrytemptable.SQL.Text := Temptime;
    dm.qrytemptable.SQL.Text := StringReplace(dm.qrytemptable.SQL.Text,'convert(varchar(100),getdate()-3,23)', QuotedStr(DateToStr(term.form_condition.dtpk1.Date)),[rfReplaceAll]);
    dm.qrytemptable.SQL.Text := StringReplace(dm.qrytemptable.SQL.Text,'convert(varchar(100),getdate(),23)',QuotedStr(DateToStr(term.form_condition.dtpk2.Date)),[rfReplaceAll]);
    for i:=1 to term.form_condition.sgrid1.RowCount-2 do
    Begin
      if term.form_condition.sgrid1.Cells[2,i] <> '' then
      begin
        dm.qrytemptable.SQL.Text := dm.qrytemptable.SQL.Text +  term.form_condition.sgrid1.Cells[2,i];
      end;
    end;
    dm.qrytemptable.ExecSQL;

    dm.qryMain.Close;
    dm.qryMain.SQL.Text := MainTime;
    dm.qryMain.SQL.Text := StringReplace(dm.qryMain.SQL.Text,'convert(varchar(100),getdate()-3,23)', ''''+QuotedStr(DateToStr(term.form_condition.dtpk1.Date))+'''',[rfReplaceAll]);
    dm.qryMain.SQL.Text := StringReplace(dm.qryMain.SQL.Text,'convert(varchar(100),getdate(),23)', ''''+QuotedStr(DateToStr(term.form_condition.dtpk2.Date))+'''',[rfReplaceAll]);
    dm.qryMain.Open;
    MainTime1 := dm.qryMain.SQL.Text;

    dm.qry1.SQL.Text := qry1Time;
    dm.qry1.SQL.Text := StringReplace(dm.qry1.SQL.Text,'convert(varchar(100),getdate()-3,23)', ''''+QuotedStr(DateToStr(term.form_condition.dtpk1.Date))+'''',[rfReplaceAll]);
    dm.qry1.SQL.Text := StringReplace(dm.qry1.SQL.Text,'convert(varchar(100),getdate(),23)', ''''+QuotedStr(DateToStr(term.form_condition.dtpk2.Date))+'''',[rfReplaceAll]);

    for i := 0  to DM.qryMain.FieldCount - 1 do
    begin
      dgh_grd1.Columns[i].Title.Caption := DM.qryMain.Fields[i].FieldName;
      dgh_grd1.Columns[i].FieldName := DM.qryMain.Fields[i].FieldName;
    end;
    //dgh_grd1.Columns[DM.qryMain.FieldCount - 1].DisplayFormat := '0.00%';
    //dgh_grd1.Columns[dgh_grd1.Columns.Count - 1].Title.Caption := '额外加价率%';
    //dgh_grd1.Columns[dgh_grd1.Columns.Count - 2].Title.Caption := '大料利用率%';
    dgh_grd1.Columns[1].Width := 80;
    dgh_grd1.Columns[2].Width := 80;
    dgh_grd1.Columns[3].Width := 80;
    dgh_grd1.Columns[4].Width := 120;
    dgh_grd1.Columns[5].Width := 100;
    dgh_grd1.Columns[6].Width := 80;
    dgh_grd1.Columns[7].Width := 200;
  finally
    form_condition.Free;
    field_name := dgh_grd1.Columns[0].FieldName;
    PreColumn := dgh_grd1.Columns[0];
    dgh_grd1.Columns[0].Title.Color := clred ;
    label1.Caption := dgh_grd1.Columns[0].FieldName;
  end;
end;

procedure TMainFrm.bbt_1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TMainFrm.bbt_3Click(Sender: TObject);
begin
  common.Export_dbGridEH_to_Excel(dgh_grd1,self.Caption);
end;

procedure TMainFrm.FormCreate(Sender: TObject);
begin
  if not app_init(DM.con1) then
  begin
    common.ShowMsg('程序启动失败,请联系系统管理员',1);
    application.Terminate;
    exit;
  end;
  Caption := application.Title;
end;

procedure TMainFrm.dgh_grd1TitleClick(Column: TColumnEh);
begin
  if dgh_grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.qryMain.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.qryMain.Sort:=Column.FieldName+' DESC';
  end;
  if dgh_grd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edt_1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    edt_1Change(edt_1);
  end
  else
    edt_1.SetFocus;
end;

procedure TMainFrm.edt_1Change(Sender: TObject);
var ssql_string:string;
begin 
  if dgh_grd1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if dgh_grd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt_1.text) <> '' then
      begin
        if dgh_grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
          begin
            dgh_grd1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edt_1.text) + '%'')' ;
          end
        else
          if dgh_grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
          begin
            dgh_grd1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edt_1.text,0))+')';
          end;
      end
    else
      dgh_grd1.DataSource.DataSet.Filter:='';
  end;
end;
procedure TMainFrm.chk_1Click(Sender: TObject);
var
  i: Integer;
begin
  if chk_1.Checked then
  begin
    dm.qryMain.Close;
    dm.qryMain.SQL.Text := dm.qry1.SQL.Text;
    dm.qryMain.Open;
  end;
  if chk_1.Checked = False then
  begin
    dm.qryMain.Close;
    dm.qryMain.SQL.Text := MainTime1;
    dm.qryMain.Open;
  end;
  for i := 0 to dgh_grd1.Columns.Count - 1 do
  begin
    if (i > 5) and (i < dgh_grd1.Columns.Count - 5) then
    begin
      dgh_grd1.Columns[i].Width := 100;
    end;
  end;
  //dgh_grd1.Columns[dgh_grd1.Columns.Count - 1].DisplayFormat := '0.00%'; .
  //dgh_grd1.Columns[dgh_grd1.Columns.Count - 1].Title.Caption := '额外加价率%';
  //dgh_grd1.Columns[dgh_grd1.Columns.Count - 2].Title.Caption := '大料利用率%';
  dgh_grd1.Columns[1].Width := 80;
  dgh_grd1.Columns[2].Width := 80;
  dgh_grd1.Columns[3].Width := 80;
  dgh_grd1.Columns[4].Width := 120;
  dgh_grd1.Columns[5].Width := 100;
  dgh_grd1.Columns[6].Width := 80;
  dgh_grd1.Columns[7].Width := 200;
  {dgh_grd1.Columns[dm.qryMain.FieldCount - 5].Width := 60;
  dgh_grd1.Columns[dm.qryMain.FieldCount - 4].Width := 60;
  dgh_grd1.Columns[dm.qryMain.FieldCount - 3].Width := 80;
  dgh_grd1.Columns[dm.qryMain.FieldCount - 2].Width := 80;
  dgh_grd1.Columns[dm.qryMain.FieldCount - 1].Width := 80;}

end;

procedure TMainFrm.dgh_grd1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if (Sender as TDBGridEh).SumList.RecNo mod 2 = 1 then
   Background := $00FFC4C4;
end;

procedure TMainFrm.dgh_grd1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  with  (Sender as TDBGridEh)do
  begin
    if ((State=[gdSelected]))then
      Canvas.Brush.Color:=clInactiveCaption;           //设置表格选定区域的颜色
    DefaultDrawColumnCell(Rect,datacol,Column,state);
  end;
  Canvas.brush.Color := $00FFC4C4;
end;

function TMainFrm.GetStatus():string;
var
  StatusNameStr: string;
begin
  StatusNameStr := '';
  if CheckBox1.Checked then
  begin
    StatusNameStr := StatusNameStr + '0' + ',';  //0
  end;
  if CheckBox2.Checked then
  begin
    StatusNameStr := StatusNameStr + '2' + ',';  //2
  end;
  if CheckBox3.Checked then
  begin
    StatusNameStr := StatusNameStr + '1' + ',';  //1
  end;
  if CheckBox4.Checked then
  begin
    StatusNameStr := StatusNameStr + '3' + ',';  //3
  end;
  if CheckBox5.Checked then
  begin
    StatusNameStr := StatusNameStr + '4' + ',';  //4
  end;
  StatusNameStr := Copy(StatusNameStr, 0, Length(StatusNameStr) - 1 );
  Result := StatusNameStr;
end;

procedure TMainFrm.CheckBox1Click(Sender: TObject);
begin
  if not (CheckBox1.Checked or CheckBox2.Checked or CheckBox3.Checked or CheckBox4.Checked or CheckBox5.Checked) then
  begin
    DM.qrytemptable.SQL.Text := Temptime;
    DM.qrytemptable.ExecSQL;
    DM.qryMain.Close;
    DM.qryMain.Open;
  end
  else
  begin
    DM.qrytemptable.SQL.Text := Temptime + ' and AUDITED_STATUS in (' + GetStatus() + ')';
    DM.qrytemptable.ExecSQL;
    DM.qryMain.Close;
    DM.qryMain.Open;
  end;
  //dgh_grd1.Columns[dgh_grd1.Columns.Count - 1].Title.Caption := '额外加价率%';
  //dgh_grd1.Columns[dgh_grd1.Columns.Count - 2].Title.Caption := '大料利用率%';
  dgh_grd1.Columns[1].Width := 80;
  dgh_grd1.Columns[2].Width := 80;
  dgh_grd1.Columns[3].Width := 80;
  dgh_grd1.Columns[4].Width := 120;
  dgh_grd1.Columns[5].Width := 100;
  dgh_grd1.Columns[6].Width := 80;
  dgh_grd1.Columns[7].Width := 200;
end;

end.
