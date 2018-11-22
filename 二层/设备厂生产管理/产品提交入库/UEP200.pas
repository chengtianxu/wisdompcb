unit UEP200;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGridEh, Menus, StdCtrls, Buttons, ExtCtrls;

type
  TMain_Form = class(TForm)
    DBGridEh1: TDBGridEh;
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADS492: TADODataSet;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Edit1: TEdit;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    ADS492rkey: TAutoIncField;
    ADS492CUT_NO: TStringField;
    ADS492SO_NO: TStringField;
    ADS492cutno: TStringField;
    ADS492EMPLOYEE_NAME: TStringField;
    ADS492ISSUED_QTY: TIntegerField;
    ADS492ISSUE_DATE: TDateTimeField;
    ADS492TSTATUS: TWordField;
    ADS492tobestock_date: TDateTimeField;
    ADS492SCH_COMPL_DATE: TDateTimeField;
    ADS492remark: TStringField;
    ADS492FG_QTY: TIntegerField;
    ADS492WIP_QTY: TIntegerField;
    ADS492ORD_REQ_QTY: TIntegerField;
    ADS492QTY_REJECT: TIntegerField;
    ADS492COMPLETED: TSmallintField;
    ADS492DSDesigner: TStringField;
    ADS492DSDesigner2: TStringField;
    ADS492WAREHOUSE_CODE: TStringField;
    ADS492PROD_CODE: TStringField;
    ADS492PRODUCT_NAME: TStringField;
    ADS492PRODUCT_DESC: TStringField;
    ADS492DEPT_CODE: TStringField;
    ADS492DEPT_NAME: TStringField;
    ADS492EMPLOYEE_NAME_C: TStringField;
    ADS492new_price: TBCDField;
    qryTemp: TADOQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure ADS492AfterScroll(DataSet: TDataSet);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    procedure item_click(sender:TObject);
    procedure init;
    function submit_error(rkey,qty:integer):boolean;
    { Private declarations }
  protected
    procedure WndProc(var Message: TMessage); override;
  public
    { Public declarations }
  end;

var
  Main_Form: TMain_Form;

implementation

uses UEP200_Query,common,DateUtils,UEP200_Submit;

{$R *.dfm}
procedure TMain_Form.FormCreate(Sender: TObject);
begin
  if not App_Init(ADOConnection1) then
  begin
    ShowMsg('程序起动失败,请联系管理员!',1);
    application.Terminate;
    exit;
  end;
  Caption := application.Title;
  {ADOConnection1.Open;
  user_ptr := '626';}
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  init;
end;

procedure TMain_Form.init;
begin
field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
  sSql:= ADS492.CommandText;
end;



procedure TMain_Form.FormShow(Sender: TObject);
var
  i:integer;
  item:TMenuItem;
begin

  if ADOConnection1.Connected then
  begin
      with adoquery1 do
      begin
        ADS492.Close;
        ads492.Parameters.ParamByName('dtpk1').Value:=getsystem_date(ADOQuery1,1)-14;
        ads492.Parameters.ParamByName('dtpk2').Value:=getsystem_date(ADOQuery1,1)+1;
        ads492.Open;
      end;
  DBGridEh1TitleClick(PreColumn);
  for i:=1 to DBGridEh1.Columns.Count do
  begin
    item := TmenuItem.Create(self) ;
    item.Caption := DBGridEh1.Columns[i-1].Title.Caption ;

    if DBGridEh1.Columns[i-1].Visible then
        item.Checked := true ;
        item.OnClick := item_click ;
        PopupMenu2.Items.Add(item) ;
  end;
 end;
end;

procedure TMain_Form.BitBtn1Click(Sender: TObject);
begin
Query_Form.Free;
application.Terminate;
end;



procedure TMain_Form.DBGridEh1TitleClick(Column: TColumnEh);
begin
 if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    ADS492.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    ADS492.Sort:=Column.FieldName+' DESC';
  end;
  ADS492AfterScroll(ADS492);
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if Column.Tag<>1 then
  begin
    if (field_name <> column.FieldName) then
    begin
      label1.Caption := column.Title.Caption ;
      field_name := column.FieldName ;
      edit1.SetFocus;
      PreColumn.Title.Color := clBtnFace ;
      Column.Title.Color := clred ;
      PreColumn := column ;
      Edit1Change(Edit1);
    end
    else
      edit1.SetFocus;
  end;
end;

procedure TMain_Form.ADS492AfterScroll(DataSet: TDataSet);
begin
//  ADS492.Close;
 // ADS492.Parameters[0].Value:=DataSet.FieldValues['RKEY'];
 // ADS492.Open;
end;

procedure TMain_Form.Edit1Change(Sender: TObject);
begin
 if DBGridEh1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        DBGridEh1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        DBGridEh1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      DBGridEh1.DataSource.DataSet.Filter:='';
  end;
end;

procedure TMain_Form.BitBtn3Click(Sender: TObject);
var
  i:integer;
begin
  if ADS492.IsEmpty then exit;
  i := ADS492rkey.AsInteger ;
  ADS492.Close;
  ADS492.Open;
  ADS492.Locate('rkey',i,[]);
end;

procedure TMain_Form.BitBtn5Click(Sender: TObject);
begin
  popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TMain_Form.item_click(sender: TObject);
var
  i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
      begin
          for i := 0 to DBGridEh1.FieldCount - 1 do
              if DBGridEh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
                  begin
                      DBGridEh1.Columns[i].Visible := true ;
                      break ;
                  end ;
      end
  else
      begin
          for i := 0 to DBGridEh1.FieldCount - 1 do
              if DBGridEh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
                  begin
                      DBGridEh1.Columns[i].Visible := false ;
                      break ;
                  end ;
      end ;
end;

procedure TMain_Form.BitBtn2Click(Sender: TObject);

begin
if DBGridEh1.DataSource.DataSet.Active then
              if DBGridEh1.DataSource.DataSet.RecordCount > 0 then
                  Export_dbGridEH_to_Excel(DBGridEh1,'产品入库处理') ;
end;

procedure TMain_Form.BitBtn4Click(Sender: TObject);
var
 i:byte;
begin
 with  Query_Form do
 begin
  dtpk1.Date:= strtodate(formatdatetime('yyyy-mm-dd',ads492.Parameters.ParamValues['dtpk1']));
  dtpk2.Date:= strtodate(formatdatetime('yyyy-mm-dd',ads492.Parameters.ParamValues['dtpk2']-1));
   if ShowModal=mrok then
   with ads492 do
    begin
     close;
     CommandText:=self.sSql+#13;
     for i:=1 to SGrid1.RowCount-2 do
        CommandText:=ads492.CommandText+SGrid1.Cells[2,i]+#13;
      Parameters.ParamValues['dtpk1']:=strtodate(
          formatdatetime('yyyy-mm-dd ',dtpk1.Date));
      Parameters.ParamValues['dtpk2']:=strtodate(
          formatdatetime('yyyy-mm-dd ',dtpk2.Date+1));
     open;
    end;
  end;
end;


procedure TMain_Form.N1Click(Sender: TObject);
begin
if (vprev = '1') or (vprev = '3') then
    showmsg('你只有检查权限，不能做其他操作',1)
else
begin
 try
    with qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'Select * From sysobjects Where name = ''WZCP0088''';
      Open;
      if not IsEmpty then
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'select * from wzcp0088 where PutIntoRkey =' + IntToStr(ADS492rkey.AsInteger);

        Open;
        if (not IsEmpty) and (FieldByName('Status').AsInteger <> 3) then
        begin
          ShowMessage('该生产单号已外发给供应商，还未验收，无法提交，请检查！');
          Exit;
        end;
      end;
    end;
    Submit_Form := TSubmit_Form.Create(application) ;
    Submit_Form.Edit2.Text := ADS492CUT_NO.Value;
   // Submit_Form.Name :=
    anme := ADS492CUT_NO.Value;
    Submit_Form.Edit5.Text := ADS492ISSUED_QTY.AsString;
    Submit_Form.Edit3.Text := ADS492FG_QTY.AsString;
    Submit_Form.Edit4.Text := ADS492WIP_QTY.AsString;

    if Submit_Form.ShowModal = mrok then
    begin
      if submit_error(ADS492RKEY.Value,ADS492ORD_REQ_QTY.AsInteger) then
       begin
        showmsg('当前在线数量发生改变,提交操作不成功!',1);
        BitBtn3Click(sender);
       end
      else
      try
        begin
         ADS492.Edit;
         ADS492ORD_REQ_QTY.AsInteger := ADS492ORD_REQ_QTY.AsInteger+strtoint(Submit_Form.Edit1.Text);
         ADS492WIP_QTY.Value:=ADS492WIP_QTY.Value-strtoint(Submit_Form.Edit1.Text);
         ADS492COMPLETED.AsString := user_ptr;
         ADS492tobestock_date.AsDateTime := getsystem_date(ADOQuery1,0);
         ADS492.Post;
         BitBtn3Click(sender);
        end;
      except
        ShowMessage('当前在线数量发生改变，提交操作不成功!');
        BitBtn3Click(sender);
      end;
     end ;
  finally
    Submit_Form.Free ;
  end;
end;
end;

function TMain_Form.submit_error(rkey,qty: integer): boolean;
begin
 result:=false;
 ADOQuery1.Close;
 ADOQuery1.SQL.Text:='select data0492.ORD_REQ_QTY as qty'+#13+
                           'from data0492'+#13+
                           'where data0492.rkey='+inttostr(rkey);

 ADOQuery1.Open;
 if not ADOQuery1.IsEmpty then
  if ADOQuery1.FieldValues['qty'] = 0 then
    if ADOQuery1.FieldValues['qty']<>qty then
    result:=true;
end;

procedure TMain_Form.PopupMenu1Popup(Sender: TObject);
var
    ads_value : Integer;
begin
   with ADOQuery1 do
    begin
      Close;
      ADOQuery1.SQL.Text:='select data0492.ORD_REQ_QTY'+#13+
                                 'from data0492'+#13+
                                 'where data0492.rkey =' +inttostr(ADS492rkey.AsInteger);
      ads_value := ADS492rkey.AsInteger;
      Open;
    end;

    if  ads_value = 0 then
       begin
          n1.Enabled := false;
          n3.Enabled := False;
       end
    else
    if  ADOQuery1.FieldByName('ORD_REQ_QTY').AsInteger > 0  then
      begin
        n1.Enabled := false;
        n3.Enabled := true;
      end
    else
    if  ADOQuery1.FieldByName('ORD_REQ_QTY').AsInteger = 0 then
      begin
        n1.Enabled := true;
        n3.Enabled := false;
      end
end;

procedure TMain_Form.N3Click(Sender: TObject);
begin
if (vprev = '1') or (vprev = '3') then
    showmsg('你只有检查权限，不能做其他操作',1)
 else
if application.MessageBox('是否确定取消?','提示',mb_yesno)=idyes then
 begin
 try
  if submit_error(ADS492RKEY.Value,ADS492ORD_REQ_QTY.AsInteger) then
       begin
        showmsg('当前在线数量发生改变,提交操作不成功!',1);
        BitBtn3Click(sender);
       end
      else
      try
        begin
         ADS492.Edit;
         ADS492WIP_QTY.Value:=ADS492WIP_QTY.Value+ADS492ORD_REQ_QTY.AsInteger;
         ADS492ORD_REQ_QTY.AsInteger := 0;
         ADS492.Post;
         BitBtn3Click(sender);
        end;
      except
        ShowMessage('当前在线数量发生改变，提交操作不成功!');
        BitBtn3Click(sender);
      end;
    finally
   // Submit_Form.Free ;
    end;
  end;
end;

procedure TMain_Form.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
    showmessage(ADS492.CommandText);
end;

procedure TMain_Form.DBGridEh1DrawColumnCell(Sender: TObject;const Rect: TRect; DataCol: Integer; Column: TColumnEh;State: TGridDrawState);
begin
  if not (gdFixed in State) then
  begin
    if DBGridEh1.DataSource.DataSet.Active then //只有在打开的时候才画
      if  (ADS492ORD_REQ_QTY.AsInteger = 0) then
      begin
//        DBGridEh1.Canvas.Font.color:=clWindowText;
        DBGridEh1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
      end
      else
      if (ADS492ORD_REQ_QTY.AsInteger > 0 )then
      begin
        DBGridEh1.Canvas.Font.color:=clOlive;
        DBGridEh1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
      end;
  end;
end;

procedure TMain_Form.WndProc(var Message: TMessage);
begin
  if Message.Msg = messages.WM_SYSCOMMAND  then
  begin
    if (Message.WParam = windows.SC_MAXIMIZE) then
    begin
      with Self do
      begin
        Top := 0;
        Left:= 0;
        Width := Screen.Width;
        Height := Screen.Height;
      end;
    end;
  end;
  inherited WndProc(Message);
end;



end.

