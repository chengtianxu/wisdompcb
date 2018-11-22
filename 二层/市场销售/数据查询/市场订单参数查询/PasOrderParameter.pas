unit PasOrderParameter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, DB, ADODB,DateUtils;

type
  TFrmOrderParameter = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Edit1: TEdit;
    Button1: TButton;
    DBGridEh1: TDBGridEh;
    Button2: TButton;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    Sqlstr:string;
    StartDate,EndDate:TDatetime;
    PreColumn: TColumnEh;
    field_name:string;
    iItemType,icount:Integer;
    ListDEPT: TStringList; //存列表
    procedure item_click(sender: TObject);
  public
    { Public declarations }
  end;

var
  FrmOrderParameter: TFrmOrderParameter;

implementation
uses common,PasPublic,PasSetParameter, PasQuery, pasD80_278, PasDM;


{$R *.dfm}
procedure TFrmOrderParameter.item_click(Sender: TObject);
var
  i:byte;
begin
  (Sender as TmenuItem).Checked := not ((Sender as TmenuItem).Checked);
  if (Sender as TmenuItem).Checked then
  begin
    for i := 0 to DBGridEh1.FieldCount - 1 do
    if DBGridEh1.Columns[i].Title.Caption = (Sender as TmenuItem).Caption then
    begin
      DBGridEh1.Columns[i].Visible := True ;
      Break;
    end ;
  end
  else
  begin
    for i := 0 to DBGridEh1.FieldCount - 1 do
    if DBGridEh1.Columns[i].Title.Caption = (Sender as TmenuItem).Caption then
    begin
      DBGridEh1.Columns[i].Visible := False ;
      Break;
    end ;
  end ;
end;

procedure TFrmOrderParameter.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmOrderParameter.Button1Click(Sender: TObject);
begin
  if (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
    Exit;
  end;
  FrmSetParameter:=TFrmSetParameter.Create(application);
  FrmSetParameter.ShowModal;
  FrmSetParameter.Free;
end;

procedure TFrmOrderParameter.FormCreate(Sender: TObject);
begin
  if not App_init_2(dm.ADOConnection1) then
  begin
    showmsg('程序启动失败,请与管理员联系!',1);
    application.Terminate;
  end;
  self.Caption:=application.Title;

// rkey73:='2525';
// user_ptr := '100';
// vprev := '4';

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  iItemType:=0;
end;

procedure TFrmOrderParameter.BitBtn2Click(Sender: TObject);
var i,j,iNo:integer;
    strText,sTemp:string;
    tmpAdo,tmpAdo2:TADOQuery;
    Date1,Date2:TDateTime;
begin
  if FrmQuery=nil then  FrmQuery:=TFrmQuery.Create(Application);
  if StartDate > 100 then
    FrmQuery.DateTimePicker1.Date:= StartDate
  else
    FrmQuery.DateTimePicker1.Date:=StartOfTheMonth(now);
  if EndDate > 100 then
    FrmQuery.DateTimePicker2.Date:= EndDate
  else
    FrmQuery.DateTimePicker2.Date:=EndOfTheMonth(Now);
  FrmQuery.ListBox3.ItemIndex := FrmQuery.iItem;
  if FrmQuery.ShowModal=mrok then
  begin
    screen.Cursor:=crHourGlass;
    Sqlstr:='';
    iNo:=0;
    Date1:=FrmQuery.DateTimePicker1.Date;
    Date2:=FrmQuery.DateTimePicker2.Date;
    for i:=1 to FrmQuery.SGrid1.RowCount-2 do
    if FrmQuery.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+FrmQuery.sgrid1.Cells[2,i];
    try
      dm.ADODataSet1.DisableControls;
      tmpAdo:=TADOQuery.Create(Application);
      tmpAdo.Connection:=DM.ADOConnection1;
      tmpAdo2:=TADOQuery.Create(Application);
      tmpAdo2.Connection:=DM.ADOConnection1;
      dm.ADODataSet1.Close;
      strText:='  and (convert(char(10),dbo.Data0060.ENT_DATE,120) >= '''''+DateToStr(Date1)+''''') AND (convert(char(10),dbo.Data0060.ENT_DATE,120) <= '''''+DateToStr(Date2)+''''') ';
      dm.ADODataSet1.CommandText:='exec  dbo.Proc_ep60 ''' +Sqlstr+strText+' order by Data0060.rkey'''; 
      StartDate:=FrmQuery.DateTimePicker1.Date;
      EndDate:=FrmQuery.DateTimePicker2.Date;
      dm.ADODataSet1.Prepared;
      dm.ADODataSet1.Open;
      if (not dm.ADODataSet1.IsEmpty) then
      begin
//        ShowMessage(IntToStr(dm.ADODataSet1.RecordCount));
        tmpAdo.Close;
        tmpAdo.SQL.Clear;
        tmpAdo.SQL.Add('select * from dbo.data0591 order by iSort');
        tmpAdo.Open;
        tmpAdo2.Close;
        tmpAdo2.SQL.Clear;
        tmpAdo2.SQL.Add('select * from dbo.data0592 order by iSort');
        tmpAdo2.Open;
        if (DBGridEh1.Columns.Count<>icount) then
        begin
          for i :=DBGridEh1.Columns.Count-1 downto icount do
          begin
            DBGridEh1.Columns.Delete(i);
          end;
        end;
        tmpAdo2.First;
        while not tmpAdo2.Eof do
        begin
          with DBGridEh1.Columns.Add do
          begin
            FieldName:=tmpAdo2.FieldBYName('ColName').AsString;
            Width:=60;
          end;
          tmpAdo2.Next;
        end;
        tmpAdo.First;
        while not tmpAdo.Eof do
        begin
          with DBGridEh1.Columns.Add do
          begin
            FieldName:=tmpAdo.FieldBYName('ColName').AsString;
            Width:=60;
          end;
          tmpAdo.Next;
        end;
      end;
    finally
      tmpAdo.Close;
      tmpAdo.Connection:=nil;
      tmpAdo.Free;
      tmpAdo2.Close;
      tmpAdo2.Connection:=nil;
      tmpAdo2.Free;
      dm.ADODataSet1.EnableControls;
    end;
    screen.Cursor:=crDefault;
  end;
end;

procedure TFrmOrderParameter.BitBtn4Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(dbgrideh1,self.Caption);
end;

procedure TFrmOrderParameter.BitBtn3Click(Sender: TObject);
var Date1,Date2:TDateTime;
begin
  Date1:=FrmQuery.DateTimePicker1.Date;
  Date2:=FrmQuery.DateTimePicker2.Date;
  DM.ADODataSet1.Close;
  DM.ADODataSet1.CommandText:='exec  dbo.Proc_ep60 '+' ''  and (convert(char(10),dbo.Data0060.ENT_DATE,120) >= '''''+DateToStr(Date1)+''''') AND (convert(char(10),dbo.Data0060.ENT_DATE,120) <= '''''+DateToStr(Date2)+''''') '+Sqlstr+' order by Data0060.rkey''';
  DM.ADODataSet1.Prepared;
  DM.ADODataSet1.Open;
end;

procedure TFrmOrderParameter.FormActivate(Sender: TObject);
var i:integer;
    item:TMenuItem;
begin
    Sqlstr:='and dbo.Data0060.SALES_ORDER=''''nnnn''''';
    DM.ADODataSet1.Close;
    DM.ADODataSet1.CommandText:='exec  dbo.Proc_ep60 '+' ''  and (convert(char(10),dbo.Data0060.ENT_DATE,120) >= ''''2013-05-01'''') AND (convert(char(10),dbo.Data0060.ENT_DATE,120) <= ''''2013-05-01'''') '+Sqlstr+' order by Data0060.rkey''';
    DM.ADODataSet1.Open;
    icount:=DBGridEh1.Columns.Count;
    for i:=0 to DBGridEh1.FieldCount-1 do
    begin
      item:=TmenuItem.Create(self);
      item.Caption:=DBGridEh1.Columns[i].Title.Caption;
      if DBGridEh1.Columns[i].Visible then
      item.Checked:=true;
      item.OnClick:=item_click;
      self.PopupMenu1.Items.Add(item);
    end;
end;

procedure TFrmOrderParameter.FormShow(Sender: TObject);
begin
  DBGridEh1.Visible:=True;
  Sqlstr:='';
  StartDate:=Date;EndDate:=Date;
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
  Label1.Caption:=preColumn.Title.Caption;
  FrmQuery.iItem:=0;
end;

procedure TFrmOrderParameter.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if (column.ReadOnly) and (PreColumn.FieldName<>column.FieldName)  and
     (column.Field.DataType in [ftString,ftWideString])
      then
  begin
    label1.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else edit1.SetFocus;
end;

procedure TFrmOrderParameter.BitBtn5Click(Sender: TObject);
begin
  PopupMenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TFrmOrderParameter.Edit1Change(Sender: TObject);
begin
  if Trim(Edit1.Text)<>'' then
    DM.ADODataSet1.Filter:=preColumn.FieldName+' like ''%'+ Trim(Edit1.Text)+'%'''
  else
    DM.ADODataSet1.Filter:='';
end;

procedure TFrmOrderParameter.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrmOrderParameter.Button2Click(Sender: TObject);
begin
  if (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
    Exit;
  end;
  frmD80_278:=TfrmD80_278.Create(application);
  frmD80_278.ShowModal;
  frmD80_278.Free;
end;

end.
