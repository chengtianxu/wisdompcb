unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh, Buttons, Menus, AddFrm, DB;

type
  TFrmMain = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    edt_1: TEdit;
    BitBtn4: TBitBtn;
    DBGridEh1: TDBGridEh;
    RadioGroup1: TRadioGroup;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    pnl1: TPanel;
    procedure N1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure edt_1Change(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumnEh;
    field_name: string;    
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses damo, common, DateUtils;

{$R *.dfm}

procedure TFrmMain.N1Click(Sender: TObject);
begin
  DM.UpdateTag := 0;
  FrmAdd := TFrmAdd.Create(Application);
  FrmAdd.ShowModal;
  FrmAdd.Free;
  DM.qry1.Close;
  DM.qry1.Open;
  DM.qry1.Last;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  DM.qry1.Close;
  DM.qry1.Open;
  DBGridEh1.SelectedRows.CurrentRowSelected := False;
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
  label1.Caption := DBGridEh1.Columns[0].Title.Caption;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  if not App_init(DM.con1) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;
  //user_ptr := '3';
end;

procedure TFrmMain.DBGridEh1DrawColumnCell(Sender: TObject;
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
  If DM.qry1.FieldByName('ActiveName').AsString = '否' then
  Begin
      DBGridEh1.Canvas.Font.Color := clRed;
      DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, [gdFixed, gdFocused, gdSelected]);
  End;
  {If DM.qrySalaryJL.FieldByName('ActiveName').AsString = '否' then
  Begin
      DBGridEh1.Canvas.Brush.Color := clMoneyGreen;
      DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, [gdFixed, gdFocused, gdSelected]);
  End; }
end;

procedure TFrmMain.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if (Sender as TDBGridEh).SumList.RecNo mod 2 = 1 then
   Background := $00FFC4C4;
end;

procedure TFrmMain.PopupMenu1Popup(Sender: TObject);
begin
  if DM.qry1.IsEmpty then
    begin
       N2.Enabled := False;
       N3.Enabled := False;
       N4.Enabled := False;
    end
  else
    begin
      if DM.qry1.FieldValues['ActiveName'] = '是' then
      begin
        N2.Enabled := False;
        N4.Enabled := False;
      end
      else
      begin
        N2.Enabled := true;
        N4.Enabled := true;
      end;
    end;
end;

procedure TFrmMain.N4Click(Sender: TObject);
begin
  with DM.qrytemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'select count(*) counts from employee_alteration where employeeid = ' + IntToStr(DM.qry1.FieldValues['EmpRkey'])
      + ' and alterdate= ' + QuotedStr(DM.qry1.FieldByName('alterdate').AsString)
      + ' and active= 1 and type is null ';
    Open;
    if FieldByName('counts').AsInteger > 0 then
    begin
      ShowMessage('对不起，员工：' + DM.qry1.fieldByName('chinesename').AsString + ',' + #13 + #13
        + IntToStr(YearOf(DM.qry1.fieldByName('alterdate').asDateTime)) + '年'
        + IntToStr(MonthOf(DM.qry1.fieldByName('alterdate').asDateTime))
        + '月份已有生效帐套调整记录，请勿重复添加！');
      Exit;
    end;
  end;
  if MessageDlg('您确定要将当前记录生效吗?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      //更新人事变动表active=1为有效
      DM.con1.BeginTrans;
      with DM.qrytemp do
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'update employee_alteration set active=1 where rkey =' + IntToStr(DM.qry1.FieldValues['AltRkey']);
        ExecSQL;
      end;
      DM.con1.CommitTrans;
      //跟新人事表wagetype
      DM.con1.BeginTrans;
      with DM.qrytemp do
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'update employeemsg set wagetype= ' + IntToStr(DM.qry1.FieldValues['new_accountid'])
          + ' where rkey =' + IntToStr(DM.qry1.FieldValues['EmpRkey']);
        ExecSQL;
      end;
      DM.con1.CommitTrans;
    except
      on e: Exception do
      begin
        DM.con1.RollbackTrans;
        ShowMessage('网络异常...... (' + e.Message + ')');
      end;
    end;
  end;
  BitBtn2.Click;
end;

procedure TFrmMain.BitBtn2Click(Sender: TObject);
var
  i: Integer;
begin
  i := DM.qry1AltRkey.Value;
  DM.qry1.Close;
  DM.qry1.Open;
  DM.qry1.Locate('AltRkey', i, []);
end;

procedure TFrmMain.N3Click(Sender: TObject);
begin
  DM.UpdateTag := 1;
  FrmAdd := TFrmAdd.Create(Application);
  FrmAdd.ShowModal;
  FrmAdd.Free;
  BitBtn2.Click;
end;

procedure TFrmMain.BitBtn1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMain.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.qry1.SQL.Text);
end;

procedure TFrmMain.N2Click(Sender: TObject);
var
  i: Integer;
begin
  i := DBGridEh1.Row;
  if MessageDlg('确定要删除当前选中的记录吗？', mtInformation, [mbYes, mbNo], 1) = mryes then
  begin
    with DM.qrytemp do
    begin
      SQL.Clear;
      SQL.Text := 'delete from employee_Alteration where rkey=' + IntToStr(DM.qry1.FieldValues['Altrkey']);
      ExecSQL;
    end;
    DM.qry1.Close;
    DM.qry1.Open;
    DM.qry1.MoveBy(i - 1);
  end;
end;

procedure TFrmMain.BitBtn3Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(DBGridEh1, '员工帐套变动');
end;

procedure TFrmMain.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.qry1.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.qry1.Sort:=Column.FieldName+' DESC';
  end;
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
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

procedure TFrmMain.edt_1Change(Sender: TObject);
begin
  DBGridEh1.DataSource.DataSet.Filtered := True;
  if DBGridEh1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt_1.text) <> '' then
      begin
        if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
          begin
            DBGridEh1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edt_1.text) + '%'')' ;
          end
        else
          if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
          begin
            DBGridEh1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edt_1.text,0))+')';
          end;
      end
    else
      DBGridEh1.DataSource.DataSet.Filter:='';
  end;
end;

procedure TFrmMain.RadioGroup1Click(Sender: TObject);
begin
  DBGridEh1.DataSource.DataSet.Filtered := True;
  DBGridEh1.DataSource.DataSet.Filter := '';
  if RadioGroup1.ItemIndex = 1 then
  begin
    if DBGridEh1.DataSource.DataSet.Filter = '' then DBGridEh1.DataSource.DataSet.Filter := ' ActiveName = ''是'''
    else DBGridEh1.DataSource.DataSet.Filter := ' and ActiveName = ''是'' ';
  end;
  if RadioGroup1.ItemIndex = 2 then
  begin
    if DBGridEh1.DataSource.DataSet.Filter = '' then DBGridEh1.DataSource.DataSet.Filter := ' ActiveName = ''否'''
    else DBGridEh1.DataSource.DataSet.Filter := ' and ActiveName = ''否'' ';
  end;
end;

end.
