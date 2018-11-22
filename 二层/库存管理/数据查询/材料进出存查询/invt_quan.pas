unit invt_quan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, ExtCtrls, StdCtrls,ComObj, Excel2000, ClipBrd,
  Menus, Buttons;

type
  TForm4 = class(TForm)
    ADO22: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ADO22INV_PART_NUMBER: TStringField;
    ADO22INV_PART_DESCRIPTION: TStringField;
    ADO22GROUP_NAME: TStringField;
    ADO22quan_total: TFloatField;
    ADO22avl_price: TFloatField;
    ADO22amount: TFloatField;
    Panel1: TPanel;
    ADO22UNIT_CODE: TStringField;
    ADO22ABBR_NAME: TStringField;
    ADO22inv_group_name: TStringField;
    ADO22inv_name: TStringField;
    Label1: TLabel;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    ADO22STOCK_SELL: TFloatField;
    ADO22total_weigth: TFloatField;
    ADO22total_area: TFloatField;
    ADO22supplier2: TStringField;
    ADO22amount_notax: TBCDField;
    ADO22QUAN_ON_HAND: TBCDField;
    ADO22CONSIGN_ONHAND_QTY: TFloatField;
    ADO22quan_allow: TBCDField;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    ADO22location: TStringField;
    edt1: TEdit;
    lbl1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    field_name:string;
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation
uses main, invt_report,common;
{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
 close;
end;

procedure TForm4.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 form1.Show;
end;

procedure TForm4.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(ado22.SQL.Text);
end;

procedure TForm4.Button3Click(Sender: TObject);
begin
{ try
  form_report:=tform_report.Create(application);
  if strtoint(vprev)<=2 then       //权限
   begin
    form_report.ppDBText4.Visible:=false;
    form_report.ppDBText5.Visible:=false;
   end;
  form_report.ppReport1.Print;
 finally
  form_report.free;
 end;}
 PopupMenu1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.y);
end;

procedure TForm4.Button2Click(Sender: TObject);
 begin
form1.CopyDbDataToExcel([dbgrid1],self.Caption);
  end;

procedure TForm4.FormCreate(Sender: TObject);
begin
field_name:='INV_PART_NUMBER';
CheckBox1.Checked:=False;
end;

procedure TForm4.Edit1Change(Sender: TObject);
begin
if (trim(edit1.Text)<>'') and (checkbox1.Checked) then
 Ado22.Filter := field_name+' like ''%'+Trim(Edit1.Text)+'%'''
else
 if (trim(edit1.Text)<>'') and (not checkbox1.Checked) then
  Ado22.Filter := field_name+' like ''%'+Trim(Edit1.Text)+'%'''+
                   'and quan_total >0'
 else
  if (trim(edit1.Text)='') and (not checkbox1.Checked) then
   Ado22.Filter :='quan_total >0'
  else
   ado22.Filter := '';
end;

procedure TForm4.DBGrid1TitleClick(Column: TColumn);
begin
 if (column.FieldName<>'quan_total') and
    (column.FieldName<>'avl_price') and
    (column.FieldName<>'amount') and
    (column.FieldName<>'STOCK_BASE') and
    (column.FieldName<>'total_weigth') and
    (column.FieldName<>'STOCK_SELL') and
    (column.FieldName<>'total_area') and    
    (column.FieldName<>field_name) then
 begin
  field_name:=column.FieldName;
  label1.Caption := column.Title.Caption;
  edit1.SetFocus;
  ado22.sort:=column.FieldName+' ASC';
 end;
end;

procedure TForm4.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 if (ADO22CONSIGN_ONHAND_QTY.Value > 0) and
    (ADO22CONSIGN_ONHAND_QTY.Value > ADO22QUAN_ON_HAND.Value) then
  DBGrid1.Canvas.Font.Color := clred;

  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm4.N1Click(Sender: TObject);
begin
 try
  Form_report:=TForm_report.Create(Application);
  Form_report.ppReport1.Reset;
  Form_report.ppReport1.Template.FileName:=
      stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
         'warehouse_lucre.rtm';
  Form_report.ppReport1.Template.LoadFromFile;
  Form_report.ppReport1.SaveAsTemplate:=True;
  Form_report.ppDesigner1.ShowModal;
 finally
   Form_report.Free;
 end;
end;

procedure TForm4.N2Click(Sender: TObject);
begin
 try
  form_report:=tform_report.Create(application);
  if strtoint(vprev)<=2 then       //权限
   begin
    form_report.ppDBText4.Visible:=false;
    form_report.ppDBText5.Visible:=false;
   end;

  Form_report.ppReport1.Reset;
  Form_report.ppReport1.Template.FileName:=
      stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
         'warehouse_lucre.rtm';
  Form_report.ppReport1.Template.LoadFromFile;
  Form_report.ppReport1.SaveAsTemplate:=False;

  form_report.ppReport1.Print;
 finally
  form_report.free;
 end;
end;

procedure TForm4.BitBtn1Click(Sender: TObject);
begin
 close;
end;

procedure TForm4.BitBtn4Click(Sender: TObject);
begin
   if MessageBox(Handle,'确定导出EXCEL表吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
   form1.CopyDbDataToExcel([dbgrid1],self.Caption);
end;

procedure TForm4.BitBtn2Click(Sender: TObject);
begin
     PopupMenu1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.y);
end;

end.
