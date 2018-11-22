unit outsql;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls,ComObj, Excel2000,ClipBrd,
  Menus, Buttons;

type
  TForm3 = class(TForm)
    ado207: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    PopupMenu2: TPopupMenu;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    ado207REF457_NUMBER: TStringField;
    ado207GON_NUMBER: TStringField;
    ado207INV_PART_NUMBER: TStringField;
    ado207INV_NAME: TStringField;
    ado207INV_DESCRIPTION: TStringField;
    ado207GROUP_DESC: TStringField;
    ado207DEPT_NAME: TStringField;
    ado207QUANTITY: TBCDField;
    ado207RTN_QUANTITY: TFloatField;
    ado207CURR_CODE: TStringField;
    ado207STANDARD_COST: TBCDField;
    ado207CUT_NO: TStringField;
    ado207SO_NO: TStringField;
    ado207CUST_CODE: TStringField;
    ado207BARCODE_ID: TStringField;
    ado207inv_group_name: TStringField;
    ado207TAX_2: TBCDField;
    ado207tax_price: TBCDField;
    ado207SUPPLIER2: TStringField;
    ado207total_price: TBCDField;
    ado207total_notaxprice: TBCDField;
    ado207CODE: TStringField;
    ado207UNIT_NAME: TStringField;
    ado207TDATE: TDateTimeField;
    ado207rohs: TStringField;
    ado207GRN_NUMBER: TStringField;
    ado207EMPLOYEE_NAME: TStringField;
    ado207note_info: TStringField;
    ado207total_area: TFloatField;
    ado207total_Weight: TBCDField;
    ado207LOCATION: TStringField;
    ado207WAREHOUSE_CODE: TStringField;
    ado207v_type: TStringField;
    ado207ship_DATE: TDateTimeField;
    ado207ship_DATE_1: TDateTimeField;
    ado207FL_EMPLOYEE: TStringField;
    ado207PO_NUMBER: TStringField;
    ado207yf_remark: TStringField;
    ado207DSDesigner: TStringField;
    ado207reason: TStringField;
    ado207ABBR_NAME10: TStringField;
    ado207ABBR_NAME: TStringField;
    ado207EXPIRE_DATE: TDateTimeField;
    ado207s_type: TStringField;
    ado207inv_type: TStringField;
    ado207PROD_CODE: TStringField;
    ado207PRODUCT_NAME: TStringField;
    ado207PRODUCT_DESC: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
   field_name:string;
   procedure item_click(sender:TObject);
  public
    { Public declarations }
    stardate,enddate:string;
  end;

var
  Form3: TForm3;

implementation
uses main, invt_report,common;
{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
 close;
end;

procedure TForm3.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(ado207.SQL.Text);
  if (key=40) and        //如果是下箭头如果是最后一条记录
  (datasource1.DataSet.RecNo=datasource1.DataSet.RecordCount) then abort;
 if key=45 then abort; //insert键
 if (key=46) and (ssCtrl in shift) then abort;//删除记录
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
{ try
  form_report:=tform_report.Create(application);
  ado207.DisableControls;       //切断与DBgrid控件的联系加快显示速度
  form_report.ppReport3.Print;
  ado207.EnableControls;
 finally
  form_report.free;
 end;}
 PopupMenu1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.y);
end;

procedure TForm3.FormCreate(Sender: TObject);
var i:integer;
    item: TmenuItem;
begin
  field_name:='INV_PART_NUMBER';
  for i := 0 to DBGrid1.Columns.Count-1 do
  begin
    item := TmenuItem.Create(self);
    item.Caption := DBGrid1.Columns[i].Title.Caption;
    item.Checked := DBGrid1.Columns[i].Visible;
    item.Enabled:=not ((strtoint(vprev)<=2) and (i in [14,15,16,17,18]));
    item.OnClick := item_click;
    self.PopupMenu2.Items.Add(item);
  end;

  if StrToInt(vprev)=4 then       //如果权限码等于4，额外备注能修改。
  begin
    ado207yf_remark.ReadOnly:=False;
  end;

end;

procedure TForm3.Edit3Change(Sender: TObject);
begin
if trim(edit3.Text)<>'' then
 Ado207.Filter := field_name+' like ''%'+Trim(Edit3.Text)+'%'''
else
 ado207.Filter := '';
end;

procedure TForm3.DBGrid1TitleClick(Column: TColumn);
begin
 if  column.FieldName<>field_name then
 begin
  ado207.Sort:=column.FieldName+' ASC';
 end;
 if (column.Field.DataType in [ftString,ftWideString]) and
    (column.FieldName<>field_name) then
 begin
  field_name:=column.FieldName;
  label3.Caption := column.Title.Caption;
  edit3.SetFocus;
 end;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
form1.CopyDbDataToExcel([dbgrid1],self.Caption);
end;

procedure TForm3.BitBtn10Click(Sender: TObject);
begin
 popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm3.item_click(sender: TObject);
var
  i:integer;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
  begin
    for i := 0 to DBGrid1.FieldCount - 1 do
    if DBGrid1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      DBGrid1.Columns[i].Visible := true;
      break;
    end ;
  end else begin
    for i := 0 to DBGrid1.FieldCount - 1 do
    if DBGrid1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      DBGrid1.Columns[i].Visible := false;
      break;
    end;
  end;
end;

procedure TForm3.N1Click(Sender: TObject);
begin
 try
  Form_report:=TForm_report.Create(Application);
  Form_report.ppReport3.Reset;
  Form_report.ppReport3.Template.FileName:=
      stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
         'exhale_inventory.rtm';
  Form_report.ppReport3.Template.LoadFromFile;
  Form_report.ppReport3.SaveAsTemplate:=True;
  Form_report.ppDesigner3.ShowModal;
 finally
   Form_report.Free;
 end;
end;

procedure TForm3.N2Click(Sender: TObject);
begin
 try
  form_report:=tform_report.Create(application);
  ado207.DisableControls;       //切断与DBgrid控件的联系加快显示速度

  Form_report.ppReport3.Reset;
  Form_report.ppReport3.Template.FileName:=
      stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
         'exhale_inventory.rtm';
  Form_report.ppReport3.Template.LoadFromFile;
  Form_report.ppReport3.SaveAsTemplate:=False;


  Form_report.plbl17.Caption:=self.stardate;
  Form_report.plbl21.Caption:=self.enddate;

  form_report.ppReport3.Print;
  ado207.EnableControls;
 finally
  form_report.free;
 end;
end;

procedure TForm3.BitBtn1Click(Sender: TObject);
begin
 close;
end;

procedure TForm3.BitBtn4Click(Sender: TObject);
begin
  if MessageBox(Handle,'确定导出EXCEL表吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
  form1.CopyDbDataToExcel([dbgrid1],self.Caption);
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
begin
{ try
  form_report:=tform_report.Create(application);
  ado207.DisableControls;       //切断与DBgrid控件的联系加快显示速度
  form_report.ppReport3.Print;
  ado207.EnableControls;
 finally
  form_report.free;
 end;}
 PopupMenu1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.y);
end;

procedure TForm3.BitBtn5Click(Sender: TObject);
begin
   popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
var
  s:integer;
begin
  with ado207 do
  if Active then
  if  (State=dsInsert) or (State=dsEdit)then
  begin
     S:= messagedlg('数据还没有保存,你要保存吗?',mtconfirmation,[mbyes,mbno,mbcancel],0);
     if S = mryes  then
        Post
     else
     if S = mrcancel then
         abort
     else
     if s=mrNo then
       Cancel    ;
  end;

  form1.Show;
end;

procedure TForm3.FormActivate(Sender: TObject);
begin
  WindowState:=  wsMaximized;
end;

end.

