unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ADODB, Menus, ExtCtrls, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOQuery1CODE: TStringField;
    ADOQuery1ABBR_NAME: TStringField;
    ADOQuery1INV_PART_NUMBER: TStringField;
    ADOQuery1PRICE_1: TFloatField;
    ADOQuery1LEAD_TIME: TSmallintField;
    ADOQuery1TAX_2: TFloatField;
    ADOQuery1AVL_FLAG: TStringField;
    ADOQuery1SUPPLIER_NAME: TStringField;
    ADOQuery1TDATE: TDateTimeField;
    ADOQuery1SUPPLIER_PART_NO: TStringField;
    ADOQuery1SUGG_REORDER_QTY: TFloatField;
    ADOQuery1AMT_QUAN_FLAG: TWordField;
    ADOQuery1MIN_ORDER_QTY: TFloatField;
    ADOQuery1MIN_ORDER_AMT: TFloatField;
    ADOQuery1PRICE_2: TFloatField;
    ADOQuery1PRICE_3: TFloatField;
    ADOQuery1PRICE_4: TFloatField;
    ADOQuery1PRICE_5: TFloatField;
    ADOQuery1PRICE_6: TFloatField;
    ADOQuery1QUAN_VOL_1: TFloatField;
    ADOQuery1QUAN_VOL_2: TFloatField;
    ADOQuery1QUAN_VOL_3: TFloatField;
    ADOQuery1QUAN_VOL_4: TFloatField;
    ADOQuery1QUAN_VOL_5: TFloatField;
    ADOQuery1DISC_1: TFloatField;
    ADOQuery1DISC_2: TFloatField;
    ADOQuery1DISC_3: TFloatField;
    ADOQuery1DISC_4: TFloatField;
    ADOQuery1DISC_5: TFloatField;
    ADOQuery1DISC_6: TFloatField;
    ADOQuery1CONVERSION_FACTOR: TFloatField;
    ADOQuery1CURR_CODE: TStringField;
    ADOQuery1CURR_NAME: TStringField;
    ADOQuery1DSDesigner: TStringField;
    ADOQuery1DSDesigner2: TStringField;
    ADOQuery1RKEY: TAutoIncField;
    ADOQuery1USER_FULL_NAME: TStringField;
    ADOQuery1USER_LOGIN_NAME: TStringField;
    ADOQuery1INV_PART_DESCRIPTION: TStringField;
    ADOQuery1avl_state: TStringField;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Panel1: TPanel;
    Button1: TButton;
    ADO2811: TADOStoredProc;
    ADO2811RKEY: TAutoIncField;
    ADO2811FILE_POINTER: TIntegerField;
    ADO2811SOURCE_TYPE: TSmallintField;
    ADO2811NOTE_PAD_LINE_1: TStringField;
    ADO2811NOTE_PAD_LINE_2: TStringField;
    ADO2811NOTE_PAD_LINE_3: TStringField;
    ADO2811NOTE_PAD_LINE_4: TStringField;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Label3: TLabel;
    ADOQuery1EDI_OUT_FORCST: TIntegerField;
    ADOQuery2: TADOQuery;
    ADOQuery2user_full_name: TStringField;
    DataSource2: TDataSource;
    ADOQuery1qte_price: TFloatField;
    ADOQuery2user_login_name: TStringField;
    Button2: TButton;
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure N1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    field_name:string;
  public
    { Public declarations }
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  end;

var
  Form1: TForm1;

implementation

uses price_info,common ;

{$R *.dfm}
procedure TForm1.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;

procedure TForm1.ADOQuery1CalcFields(DataSet: TDataSet);
begin
if self.ADOQuery1AVL_FLAG.Value='Y' then
 self.ADOQuery1avl_state.Value:='已认可'
else
 if self.ADOQuery1AVL_FLAG.Value='N' then
  self.ADOQuery1avl_state.Value:='未认可'
 else
  self.ADOQuery1avl_state.Value:='暂时认可';
end;

procedure TForm1.N1Click(Sender: TObject);
begin
 form2:=tform2.Create(application);
 adoquery2.Open;
 adoquery1.Edit;
 if form2.ShowModal=mrok then
  begin
   if ADOQuery1AVL_FLAG.Value='N' then
    ADOQuery1EDI_OUT_FORCST.Value:=0
   else
    begin
     ADOQuery1EDI_OUT_FORCST.Value:=strtoint(rkey73);
     ADOQuery1TDATE.Value:=date();
    end;
   adoquery1.Post
  end
 else
  adoquery1.Cancel;
 adoquery2.close;
 form2.Free;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
 adoquery1.Close;
 if checkbox1.Checked then
  adoquery1.Parameters[0].Value:='Y'
 else
  adoquery1.Parameters[0].Value:='N';
 adoquery1.Open;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
{if (trim(edit1.Text) <> '') and (trim(edit2.Text) <> '') then
 adoquery1.Filter := 'inv_part_number like '''+trim(edit1.Text)+'%'''
                  +'and abbr_name like '''+trim(edit2.Text)+'%'''
else
 if (trim(edit1.Text) <> '') and (trim(edit2.Text) = '') then
  adoquery1.Filter := 'inv_part_number like '''+trim(edit1.Text)+'%'''
 else
  if (trim(edit1.Text) = '') and (trim(edit2.Text) <> '') then
   adoquery1.Filter := 'abbr_name like '''+trim(edit2.Text)+'%'''
  else
   adoquery1.filter := '';
}
if trim(edit1.Text)<> '' then
 adoquery1.Filter := field_name+' like ''%'+trim(edit1.Text)+'%'''
else
 adoquery1.filter := '';
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(adoquery1.SQL.Text);
end;

procedure TForm1.FormResize(Sender: TObject);
begin
 dbgrid1.Columns[0].Width:=138+round((dbgrid1.Width-707)*138/680);
 dbgrid1.Columns[1].Width:=275+round((dbgrid1.Width-707)*275/680);
 dbgrid1.Columns[2].Width:=79+round((dbgrid1.Width-707)*79/680);
 dbgrid1.Columns[3].Width:=57+round((dbgrid1.Width-707)*57/680);
 dbgrid1.Columns[4].Width:=70+round((dbgrid1.Width-707)*70/680);
 dbgrid1.Columns[5].Width:=61+round((dbgrid1.Width-707)*61/680);
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
if combobox1.ItemIndex<>combobox1.Items.Count-1 then
 case combobox1.ItemIndex of
 0:
  begin
   adoquery1.Close;
   adoquery1.SQL.Delete(27);
   adoquery1.SQL.Insert(27,'and data0028.avl_flag=''Y''');
   adoquery1.Open;
  end;
 1:
  begin
   adoquery1.Close;
   adoquery1.SQL.Delete(27);
   adoquery1.SQL.Insert(27,'and data0028.avl_flag=''N''');
   adoquery1.Open;
  end;
 2:
  begin
   adoquery1.Close;
   adoquery1.SQL.Delete(27);
   adoquery1.SQL.Insert(27,'and data0028.avl_flag=''T''');
   adoquery1.Open;
  end;
 end
else
 begin
   adoquery1.Close;
   adoquery1.SQL.Delete(27);
   adoquery1.SQL.Insert(27,'');
   adoquery1.Open;
 end;
end;

procedure TForm1.FormCreate(Sender: TObject);

begin
if not app_init_2(self.ADOConnection1) then
 begin
  showmsg('程序起动失败请与管理员联系!',1);
  application.Terminate;
 end;
self.Caption:=application.Title;

  self.field_name:= 'INV_PART_NUMBER';
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
if Adoconnection1.Connected then
 begin
  adoquery1.Open;
 end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
if adoquery1.IsEmpty then
 n1.Enabled:=false
else
 n1.Enabled:=true;
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
begin
if (column.ReadOnly) and (column.FieldName<>self.field_name) then
 begin
  self.field_name:=column.FieldName;
  label1.Caption:=column.Title.Caption;
  edit1.SetFocus;
 end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Export_dbGrid_to_Excel(DBGrid1,'供应商物料价格');
end;

end.
